* Homework4 ARM Program Framework
	
	AREA	Homework4, CODE, READONLY
	EXPORT	main		;required by the startup code
	ENTRY

main					;required by the startup code. This is a label as well.
	LDR R2, =strOne		;[R2]<-the beginning address of strOne. strOne is a label. This label represents an address.
	LDR R3, =strTwo		;[R3]<-the beginning address of strTwo. strTwo is a label. This label represents an address.
	LDR R4, =mixStr		;[R4]<-the beginning address of mixStr. MixStr is a label. This label represents an address.
	
mixLoop
	LDRB R5, [R2], #1	;This loads a byte from the memory location in R2 to R5.
	TEQ R5, #0			;This compares R5 to 0.
	BEQ doneStrOne		;This braches if R5 is equal to 0.
	STRB R5, [R4], #1	;This stores a byte from R5 to the memory location in R4. It then increases R4 by 1.
	LDRB R5, [R3], #1	;This loads a byte from the memory location in R3 to R5.
	TEQ R5, #0			;This compares R5 to 0.
	BEQ doneStrTwo		;This brances if R5 is equal to 0.
	STRB R5, [R4], #1	;This stores a byte from R5 to the memory location in R4. It then increases R4 by 1.
	B mixLoop			;This brances to mixLoop which is the top of the while loop.
	
doneStrOne
	LDRB R5, [R3], #1	;This loads a byte from the memory location in R3 to R5.
	TEQ R5, #0			;This compares R5 to 0.
	BEQ doneAll			;This branches if R5 is equal to 0.
	STRB R5, [R4], #1	;This stores a byte from R5 to the memory location in R4. It then increased R4 by 1.
	B doneStrOne		;This brances to doneStrOne which is the top of the while loop.
	
doneStrTwo
	LDRB R5, [R2], #1	;This loads a byte from the memory location in R2 to R5.
	TEQ R5, #0			;This compares R5 to 0.
	BEQ doneAll			;This braches if R5 is equal to 0.
	STRB R5, [R4], #1	;This stores a byte from R5 to the memory location in R4. It then increases R4 by 1.
	B doneStrTwo		;This braches to doneStrOne which is the top of the while loop.

doneAll
	STRB	R5, [R4]	;This stores a 0x00 at the end of the string.
	SVC	#0x11 			;This ends the main routine
	

	AREA	Homework4Data, DATA, READWRITE
		
	EXPORT	adrStrOne	;needed for displaying addr in command-window
	EXPORT	adrStrTwo	;needed for displaying addr in command-window
	EXPORT	adrMixStr	;needed for displaying addr in command-window

adrStrOne	DCD	strOne		;needed for displaying addr in command-window. DCD is for a four byte word.
adrStrTwo	DCD strTwo		;needed for displaying addr in command-window. DCD is for a four byte word.
adrMixStr	DCD mixStr		;needed for displaying addr in command-window. DCD is for a four byte word.

	
strOne	DCB	"Hello Metro State!", 0					;the string one
strTwo	DCB "I like assembly programming.", 0		;the string two

	ALIGN

MAX_LEN EQU 100				;This sets the size of MAX_LEN to 100.
mixStr SPACE	MAX_LEN	+ 1	;This creates a space of memory that is the same length of MAX_LEN.
	
	END
