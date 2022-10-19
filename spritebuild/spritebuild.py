# *******************************************************************************************
# *******************************************************************************************
#
#		Name : 		spritebuild.py
#		Purpose :	Composite Sprite Builder Application
#		Date :		13th October 2022
#		Author : 	Paul Robson (paul@robsons.org.uk)
#
# *******************************************************************************************
# *******************************************************************************************

from PIL import Image
import os,sys,re

# *******************************************************************************************
#
#									Sprite Object Class
#
# *******************************************************************************************

class SpriteImage(object):
	def __init__(self,imageFile):
		self.image = Image.open(imageFile).convert("RGBA") 										# get image and convert to RGBA format.
		self.background = self.image.getpixel((0,0))  											# top left pixel is background colour
		self.baseName = os.path.splitext(imageFile.split(os.sep)[-1])[0].lower() 				# get base name
		self.isVflip = False
		self.isHflip = False
		self.rotateAngle = 0
		while self.clipImage():																	# reduce to minimum size.
			pass
		self.calculateSizeAndOffset()															# figure out size of finished sprite and offset.
	#
	#		Work out size and offset of sprite
	#
	def calculateSizeAndOffset(self):
		self.spriteSize = int((max(self.image.size[0],self.image.size[1])+7)/8)*8  				# 8/16/24/32 pixel size
		assert self.spriteSize <= 32
		self.xOffset = int(self.spriteSize/2 - self.image.size[0] / 2) 							# offset in graphic to make square centred sprite
		self.yOffset = int(self.spriteSize/2 - self.image.size[1] / 2)
		#print(self.spriteSize,self.xOffset,self.yOffset,self.image.size)
	#
	#		Get name of sprite
	#
	def getName(self):
		if not self.isVflip and not self.isHflip and self.rotateAngle == 0:
			return self.baseName
		return self.baseName + "_" + ("v" if self.isVflip else "") + ("h" if self.isHflip else "") + (str(self.rotateAngle) if self.rotateAngle != 0 else "")
	#
	#		Get sprite data
	#
	def getData(self):
		data = []
		for y in range(0,self.spriteSize):
			for x in range(0,self.spriteSize):
				d = 0
				rgb = self.read((x,y))
				if rgb is not None:
					d = self.rgbConvert(rgb)
				data.append(d)
		return(data)
	#
	#		Get sprite size
	#
	def getSize(self):
		return self.spriteSize
	#
	#		Get byte requirement
	#
	def getDataSize(self):
		return self.spriteSize * self.spriteSize
	#
	#		Translate a coordinate pair
	#
	def translate(self,cp):
		if self.isHflip:
			cp = [self.spriteSize-1-cp[0],cp[1]]
		if self.isVflip:
			cp = [cp[0],self.spriteSize-1-cp[1]]
		if self.rotateAngle != 0:
			for i in range(0,self.rotateAngle // 90):
				cp = [cp[1],self.spriteSize-1-cp[0]]
		return cp 
	#
	#		Set translations
	#
	def vFlip(self):
		self.isVflip = True
		return self 
	#
	def hFlip(self):
		self.isHflip = True
		return self 
	#
	def rotate(self,angle):
		assert angle >= 0 and angle < 360 and angle % 90 == 0,"Rotation only through 90 degree steps at present"
		self.rotateAngle = angle 
		return self 
	#
	#		Convert [r,g,b] to pixel data
	#
	def rgbConvert(self,pixel):
		colour = ((pixel[0] >> 5) << 5)
		colour += ((pixel[1] >> 5) << 2)
		colour += ((pixel[2] >> 6) << 0)
		return colour
	#
	#		Read a pixel value. Return [R,G,B] or None
	#
	def read(self,c):
		c = self.translate(c) 																	# convert so we can flip etc.
		x = c[0] - self.xOffset  																# index in pixels
		y = c[1] - self.yOffset
		if x < 0 or y < 0 or x >= self.image.size[0] or y >= self.image.size[1]:				# off sprite area ?
			return None 
		if self.isBackground(x,y): 																# background colour
			return None 
		return self.image.getpixel((x,y))[:3] 													# clip out alpha
	#
	#		Reduce image to its minimum size
	#
	def clipImage(self):
		w = self.image.size[0] 																	# get size handy
		h = self.image.size[1]
		if self.canHorizontalClip(0):															# clip all 4 dimensions in turn.
			self.image = self.image.crop((0,1,w,h))
			return True 
		if self.canHorizontalClip(h-1):
			self.image = self.image.crop((0,0,w,h-1))
			return True 
		if self.canVerticalClip(0):
			self.image = self.image.crop((1,0,w,h))
			return True 
		if self.canVerticalClip(w-1):
			self.image = self.image.crop((0,0,w-1,h))
			return True 
		return False 
	#
	#		Can we horizontally clip y
	#
	def canHorizontalClip(self,y):
		for x in range(0,self.image.size[0]):
			if not self.isBackground(x,y):
				return False
		return True
	#
	#		Can we vertically clip y ?
	#
	def canVerticalClip(self,x):
		for y in range(0,self.image.size[1]):
			if not self.isBackground(x,y):
				return False
		return True
	#
	#		Is pixel (x,y) background ?
	#
	def isBackground(self,x,y):
		return self.image.getpixel((x,y)) == self.background 
	#
	#		Display a rough text version of the sprite.
	#
	def printSprite(self):
		for y in range(0,self.spriteSize):
			s1 = ""
			for x in range(0,self.spriteSize):
				s1 += "." if s.read((x,y)) is None else "*"
			print(s1)

# *******************************************************************************************
#
#								Sprite Collection class
#
# *******************************************************************************************

class SpriteCollection(object):
	def __init__(self):
		self.spriteList = []
	#
	#		Add a new sprite
	#
	def add(self,sprite):
		self.spriteList.append(sprite)
	#
	#		Output the sprite graphics object. This has a 512 byte index preceding it containing
	#		256 low bytes first, then 256 high bytes.
	#	
	#		The bytes have the formula 00aaaaaa aaaallss
	#
	# 		aaaaaaaaaaa is the offset shifted 6 right (e.g. / 64) from the start
	#		ll  		is the LUT to use (0 at present)
	#		ss 			is the size of the sprite (0-3 are 8,16,24,32)
	#
	def outputSprite(self,file = "graphics.bin"):
			spriteIndex = [ 0 ] * 256 			
			position = 0x200 
			for i in range(0,len(self.spriteList)):
				s = self.spriteList[i]
				offset = (position >> 6) 									
				size = (s.getSize() >> 3)-1
				lut = 0 
				spriteIndex[i] = (offset << 4) + (lut << 2) + (size << 0)
				position += s.getDataSize()
			#
			h = open(file,"wb")
			for i in range(0,256):
				h.write(bytes([spriteIndex[i] & 0xFF]))
			for i in range(0,256):
				h.write(bytes([spriteIndex[i] >> 8]))
			for s in self.spriteList:
				h.write(bytes(s.getData()))

			h.close()





c = SpriteCollection()
c.add(SpriteImage("sprite8.png"))
c.add(SpriteImage("sprite16.png"))
c.add(SpriteImage("sprite24.png"))
c.add(SpriteImage("sprite32.png").rotate(0))
c.add(SpriteImage("sprite32.png").rotate(90))
c.add(SpriteImage("sprite32.png").rotate(180))
c.add(SpriteImage("sprite32.png").rotate(270))
c.outputSprite()