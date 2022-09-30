; ************************************************************************************************
; ************************************************************************************************
;
;		Name:		str.asm
;		Purpose:	Convert number to string
;		Created:	29th September 2022
;		Reviewed: 	
;		Author:		Paul Robson (paul@robsons.org.uk)
;
; ************************************************************************************************
; ************************************************************************************************

		.section code

; ************************************************************************************************
;
;										str$() function
;
; ************************************************************************************************

Unary_Str: ;; [str$(]
		plx
		jsr 	EvaluateNumber  			; get number
		jsr 	CheckRightBracket 			; closing bracket
		lda 	#5 							; maximum decimals, from Basic816
		jsr 	ConvertNumberToString 		; do the conversion.

		lda		#33 						; create buffer
		jsr 	StringTempAllocate 			; allocate memory

		phx 
		ldx 	#0
_USCopy:
		lda 	DecimalBuffer,x
		jsr 	StringTempWrite
		inx
		lda 	DecimalBuffer,x
		bne 	_USCopy
		plx		
		rts

; ************************************************************************************************
;
;				Convert FPA to String in ConversionBuffer, return offset in X
;
; ************************************************************************************************

ConvertNumberToString:
		phy 								; save code position
		sta 	DecimalPlaces	 			; save number of DPs.
		stz 	dbOffset 					; offset into decimal buffer = start.

		lda 	NSStatus,x  				; is it -ve.
		bpl 	_CNTSNotNegative
		and 	#$7F 						; make +ve
		sta 	NSStatus,x
		lda 	#"-"
		jsr 	WriteDecimalBuffer
_CNTSNotNegative:
		lda 	NSExponent,x 				; check if decimal
		beq 	_CNTSNotFloat

		inx 								; round up
		lda 	#1
		jsr 	NSMSetByte		
		dex
		lda		NSExponent,x
		sta 	NSExponent+1,x
		lda 	#NSTFloat
		sta 	NSStatus+1,x
		jsr 	FloatAdd
_CNTSNotFloat:

		jsr 	MakePlusTwoString
		jsr 	FloatFractionalPart 		; get the fractional part
		jsr 	NSNormalise					; normalise , exit if zero
		beq 	_CNTSExit
		lda 	#"."
		jsr 	WriteDecimalBuffer 			; write decimal place
_CNTSDecimal:
		dec 	DecimalPlaces 				; done all the decimals
		bmi 	_CNTSExit
		inx 								; x 10.0
		lda 	#10
		jsr 	NSMSetByte
		lda 	#NSTFloat
		sta 	NSStatus,x
		dex
		jsr 	FloatMultiply
		jsr 	MakePlusTwoString
		jsr 	FloatFractionalPart 		; get the fractional part
		bra 	_CNTSDecimal 				; keep going.

_CNTSExit:
		ply
		rts

; ************************************************************************************************
;
;		Make S[X] and integer, convert it to a string, and copy it to the decimal buffer
;		
; ************************************************************************************************

MakePlusTwoString:
		phx
		jsr 	NSMShiftUpTwo 				; copy S[X] to S[X+2] - we will use S[X+2] for the intege part.		
		inx 								; access it
		inx
		jsr 	FloatIntegerPart 			; make it an integer
		lda 	#10 						; convert it in base 10
		jsr 	ConvertInt32 
		ldx	 	#0
_MPTSCopy:
		lda 	NumberBuffer,x
		jsr 	WriteDecimalBuffer
		inx		
		lda 	NumberBuffer,x
		bne 	_MPTSCopy
		plx
		rts

; ************************************************************************************************
;
;									Write A to Decimal Buffer
;		
; ************************************************************************************************

WriteDecimalBuffer:
		phx
		ldx 	dbOffset
		sta 	DecimalBuffer,x
		stz 	DecimalBuffer+1,x
		inc 	dbOffset
		plx
		rts

		.send 	code
		
; ************************************************************************************************
;
;									Changes and Updates
;
; ************************************************************************************************
;
;		Date			Notes
;		==== 			=====
;
; ************************************************************************************************