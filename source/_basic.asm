;
;	This file is automatically generated
;
	.include	"./common/aa.system/01common.inc"
	.include	"./common/aa.system/02macros.inc"
	.include	"./common/aa.system/04data.inc"
	.include	"./system.f256/ab.system/macros.inc"
	.include	"./system.f256/ab.system/ticktask.inc"
	.include	"./common/assembler/constants.inc"
	.include	"./common/expressions/binary/handlers.inc"
	.include	"./common/generated/errors.inc"
	.include	"./common/generated/kwdconst.inc"
	.include	"./common/generated/kwdconst0.inc"
	.include	"./system.f256/memory/memory.flat/access.inc"
	.include	"./common/stack/stack.inc"


	.include	"./common/aa.system/00start.asm"
	.include	"./system.f256/ab.system/events.asm"
	.include	"./system.f256/ab.system/input.asm"
	.include	"./system.f256/ab.system/ticktask.asm"
	.include	"./system.f256/ab.system/trackio.asm"
	.include	"./system.f256/ab.system/wrapper.asm"
	.include	"./common/api/api.asm"
	.include	"./common/assembler/assembler.asm"
	.include	"./common/assembler/aswrite.asm"
	.include	"./common/assembler/instruction.asm"
	.include	"./common/assembler/label.asm"
	.include	"./common/assembler/operands.asm"
	.include	"./common/cli/backload.asm"
	.include	"./common/cli/editor.asm"
	.include	"./common/cli/warmstart.asm"
	.include	"./common/commands/assemble.asm"
	.include	"./common/commands/assert.asm"
	.include	"./common/commands/call.asm"
	.include	"./common/commands/data.asm"
	.include	"./common/commands/dim.asm"
	.include	"./common/commands/end.asm"
	.include	"./common/commands/for.asm"
	.include	"./common/commands/gosub.asm"
	.include	"./common/commands/goto.asm"
	.include	"./common/commands/if.asm"
	.include	"./common/commands/inputprint.asm"
	.include	"./common/commands/let.asm"
	.include	"./common/commands/list.asm"
	.include	"./common/commands/local.asm"
	.include	"./common/commands/new.asm"
	.include	"./common/commands/poke.asm"
	.include	"./common/commands/procedure.asm"
	.include	"./common/commands/read.asm"
	.include	"./common/commands/rem.asm"
	.include	"./common/commands/repeat.asm"
	.include	"./common/commands/restore.asm"
	.include	"./common/commands/run.asm"
	.include	"./common/commands/stop.asm"
	.include	"./common/commands/utilities/clear.asm"
	.include	"./common/commands/utilities/procscan.asm"
	.include	"./common/commands/utilities/scanforward.asm"
	.include	"./common/commands/while.asm"
	.include	"./common/errors/charcheck.asm"
	.include	"./common/errors/errors.asm"
	.include	"./common/expressions/binary/compare.asm"
	.include	"./common/expressions/binary/concat.asm"
	.include	"./common/expressions/binary/divide.asm"
	.include	"./common/expressions/binary/multiply.asm"
	.include	"./common/expressions/binary/scompare.asm"
	.include	"./common/expressions/binary/shifts.asm"
	.include	"./common/expressions/binary/simple.asm"
	.include	"./common/expressions/binary/tostring.asm"
	.include	"./common/expressions/expression.asm"
	.include	"./common/expressions/float/addsub.asm"
	.include	"./common/expressions/float/compare.asm"
	.include	"./common/expressions/float/divide.asm"
	.include	"./common/expressions/float/fractional.asm"
	.include	"./common/expressions/float/integer.asm"
	.include	"./common/expressions/float/multiply.asm"
	.include	"./common/expressions/float/utility.asm"
	.include	"./common/expressions/term/assignnumber.asm"
	.include	"./common/expressions/term/assignstring.asm"
	.include	"./common/expressions/term/dereference.asm"
	.include	"./common/expressions/term/number.asm"
	.include	"./common/expressions/term/term.asm"
	.include	"./common/expressions/term/variable.asm"
	.include	"./common/expressions/unary/number/abs.asm"
	.include	"./common/expressions/unary/number/alloc.asm"
	.include	"./common/expressions/unary/number/asc.asm"
	.include	"./common/expressions/unary/number/frac.asm"
	.include	"./common/expressions/unary/number/int.asm"
	.include	"./common/expressions/unary/number/len.asm"
	.include	"./common/expressions/unary/number/minmax.asm"
	.include	"./common/expressions/unary/number/not.asm"
	.include	"./common/expressions/unary/number/peek.asm"
	.include	"./common/expressions/unary/number/sgn.asm"
	.include	"./common/expressions/unary/number/val.asm"
	.include	"./common/expressions/unary/string/chr.asm"
	.include	"./common/expressions/unary/string/items.asm"
	.include	"./common/expressions/unary/string/spc.asm"
	.include	"./common/expressions/unary/string/str.asm"
	.include	"./common/expressions/unary/string/substring.asm"
	.include	"./common/expressions/utility/exprhelper.asm"
	.include	"./common/expressions/utility/mult8x8.asm"
	.include	"./common/expressions/utility/utility.asm"
	.include	"./common/generated/asmcore.asm"
	.include	"./common/generated/constants.asm"
	.include	"./common/generated/errors.asm"
	.include	"./common/generated/timestamp.asm"
	.include	"./system.f256/memory/memory.flat/delete.asm"
	.include	"./system.f256/memory/memory.flat/insert.asm"
	.include	"./system.f256/memory/memory.flat/memory.asm"
	.include	"./system.f256/memory/memory.flat/search.asm"
	.include	"./system.f256/module.interfaces/graphics/gcommand.asm"
	.include	"./system.f256/module.interfaces/graphics/gcontrol.asm"
	.include	"./system.f256/module.interfaces/graphics/gfx.asm"
	.include	"./system.f256/module.interfaces/graphics/hit.asm"
	.include	"./system.f256/module.interfaces/graphics/palette.asm"
	.include	"./system.f256/module.interfaces/graphics/tile.asm"
	.include	"./system.f256/module.interfaces/hardware/cls.asm"
	.include	"./system.f256/module.interfaces/kernel/commands/crossdev.asm"
	.include	"./system.f256/module.interfaces/kernel/commands/dos.asm"
	.include	"./system.f256/module.interfaces/kernel/commands/event.asm"
	.include	"./system.f256/module.interfaces/kernel/commands/files/bload.asm"
	.include	"./system.f256/module.interfaces/kernel/commands/files/bsave.asm"
	.include	"./system.f256/module.interfaces/kernel/commands/files/dir.asm"
	.include	"./system.f256/module.interfaces/kernel/commands/files/drive.asm"
	.include	"./system.f256/module.interfaces/kernel/commands/files/load.asm"
	.include	"./system.f256/module.interfaces/kernel/commands/files/save.asm"
	.include	"./system.f256/module.interfaces/kernel/commands/files/try.asm"
	.include	"./system.f256/module.interfaces/kernel/commands/files/verify.asm"
	.include	"./system.f256/module.interfaces/kernel/commands/joy.asm"
	.include	"./system.f256/module.interfaces/kernel/commands/memcopy.asm"
	.include	"./system.f256/module.interfaces/kernel/commands/mouse.asm"
	.include	"./system.f256/module.interfaces/kernel/commands/setdatetime.asm"
	.include	"./system.f256/module.interfaces/kernel/commands/timer.asm"
	.include	"./system.f256/module.interfaces/kernel/functions/getdatetime.asm"
	.include	"./system.f256/module.interfaces/kernel/functions/getinkey.asm"
	.include	"./system.f256/module.interfaces/kernel/functions/keydown.asm"
	.include	"./system.f256/module.interfaces/kernel/functions/rnd.asm"
	.include	"./system.f256/module.interfaces/sound/effects.asm"
	.include	"./system.f256/module.interfaces/sound/playing.asm"
	.include	"./system.f256/module.interfaces/sound/sound.asm"
	.include	"./common/stack/bytes.asm"
	.include	"./common/stack/frames.asm"
	.include	"./common/stack/location.asm"
	.include	"./common/stack/setup.asm"
	.include	"./common/strings/concrete.asm"
	.include	"./common/strings/stringalloc.asm"


.section code
StartModuleCode:
	.if PagingEnabled==1
	* = $A000
	.offs $2000
	.endif
.send code
	.include	"../modules/_build/_hardware.module"
	.include	"../modules/_build/_graphics.module"
	.include	"../modules/_build/_tokeniser.module"
	.include	"../modules/_build/_sound.module"
	.include	"../modules/_build/_kernel.module"
.section code
	.if PagingEnabled==1
	* = $A000
	.offs $4000
	.endif
.send code
	.include	"../modules/hardware/header/headerdata.dat"
