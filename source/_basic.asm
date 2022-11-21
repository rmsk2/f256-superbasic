;
;	This file is automatically generated
;
	.include	"./common/aa.system/01common.inc"
	.include	"./common/aa.system/02macros.inc"
	.include	"./common/aa.system/04data.inc"
	.include	"./common/assembler/constants.inc"
	.include	"./common/expressions/binary/handlers.inc"
	.include	"./common/generated/errors.inc"
	.include	"./common/generated/kwdconst.inc"
	.include	"./common/generated/kwdconst0.inc"
	.include	"./memory/memory.flat/access.inc"
	.include	"./common/stack/stack.inc"


	.include	"./common/aa.system/00start.asm"
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
	.include	"./common/commands/clear.asm"
	.include	"./common/commands/cls.asm"
	.include	"./common/commands/data.asm"
	.include	"./common/commands/dim.asm"
	.include	"./common/commands/end.asm"
	.include	"./common/commands/for.asm"
	.include	"./common/commands/gosub.asm"
	.include	"./common/commands/goto.asm"
	.include	"./common/commands/if.asm"
	.include	"./common/commands/let.asm"
	.include	"./common/commands/list.asm"
	.include	"./common/commands/local.asm"
	.include	"./common/commands/new.asm"
	.include	"./common/commands/print.asm"
	.include	"./common/commands/procedure.asm"
	.include	"./common/commands/read.asm"
	.include	"./common/commands/rem.asm"
	.include	"./common/commands/repeat.asm"
	.include	"./common/commands/restore.asm"
	.include	"./common/commands/run.asm"
	.include	"./common/commands/stop.asm"
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
	.include	"./common/expressions/unary/number/rnd.asm"
	.include	"./common/expressions/unary/number/sgn.asm"
	.include	"./common/expressions/unary/number/val.asm"
	.include	"./common/expressions/unary/string/chr.asm"
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
	.include	"./memory/memory.flat/delete.asm"
	.include	"./memory/memory.flat/insert.asm"
	.include	"./memory/memory.flat/memory.asm"
	.include	"./memory/memory.flat/search.asm"
	.include	"./common/module.interface/graphics/gcommand.asm"
	.include	"./common/module.interface/graphics/gcontrol.asm"
	.include	"./common/module.interface/graphics/gfx.asm"
	.include	"./common/module.interface/graphics/hit.asm"
	.include	"./common/module.interface/graphics/palette.asm"
	.include	"./common/module.interface/hardware/event.asm"
	.include	"./common/module.interface/hardware/joy.asm"
	.include	"./common/module.interface/hardware/timer.asm"
	.include	"./common/stack/bytes.asm"
	.include	"./common/stack/frames.asm"
	.include	"./common/stack/location.asm"
	.include	"./common/stack/setup.asm"
	.include	"./common/strings/concrete.asm"
	.include	"./common/strings/stringalloc.asm"


	.include	"../modules/_build/_hardware.module"
	.include	"../modules/_build/_graphics.module"
	.include	"../modules/_build/_tokeniser.module"
	.include	"../modules/_build/_sound.module"
