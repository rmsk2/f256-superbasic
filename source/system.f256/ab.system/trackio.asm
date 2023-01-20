; ************************************************************************************************
; ************************************************************************************************
;
;		Name:		trackio.asm
;		Purpose:	Wrapper for kernel.nextEvent
;		Created:	20th January 2023
;		Reviewed: 	No.
;		Author:		Paul Robson (paul@robsons.org.uk)
;
; ************************************************************************************************
; ************************************************************************************************

		.section code

; ************************************************************************************************
;
;			Effectively calls kernel.nextEvent but also updates keyboard state 
;			and mouse events.
;
; ************************************************************************************************

GetNextEvent:
		jmp 	kernel.NextEvent

		.send code


		.section storage


		.send storage       

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
