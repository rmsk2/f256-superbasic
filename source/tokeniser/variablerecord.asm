; ************************************************************************************************
; ************************************************************************************************
;
;		Name:		variablerecord.asm
;		Purpose:	Handle a possibly new variable identifier
;		Created:	19th September 2022
;		Reviewed: 	No
;		Author:		Paul Robson (paul@robsons.org.uk)
;
; ************************************************************************************************
; ************************************************************************************************

		.section code

; ************************************************************************************************
;
;		Check to see if the currently specified identifier is in the table.  If not, create it
; 		as specified.
;
;		Then compile a reference to it in the tokenised code.
;
; ************************************************************************************************

CheckCreateVariableRecord:
		.debug

		; NOTE: compare hash and text *not* type byte as we might change the type to procedure !

		.send code

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
