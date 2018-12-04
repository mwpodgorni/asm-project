START:
.def GREENLED =R16				;naming registers		
.def BLUELED = R17				
.def REDLED = R18
.def BUZZER = R19
.def BLUEBUTTON = R20
.def WHITEBUTTON = R21
.def PIRINPUTPIN = R22
.def PIRSTATE = R23
.def WHITEBUTTONSTATE = R24
.def BLUEBUTTONSTATE =R25
								;setting up the alarm
LDI GREENLED, 0x20				
LDI BLUELED, 0x40
LDI REDLED, 0x80
LDI BUZZER, 0x10
LDI BLUEBUTTON, 0x08
LDI WHITEBUTTON, 0x04

LDI PIRINPUTPIN, 0x10			

OUT DDRB, GREENLED				;assigning green led to port B, to output
OUT DDRB, BLUELED				;assigning blue led to port B, to output
OUT DDRB, REDLED				;assigning red led to port B, to output
OUT DDRB, BUZZER				;assigning buzzer to port B, to output

IN DDRB, BLUEBUTTON				;assigning blue button to port B, to input
IN DDRB, WHITEBUTTON			;assigning white button to port B, to input
IN DDRE, PIRINPUTPIN			;assigning PIR sensor to port E, to input

OUT PORTB, GREENLED				;turning on green led


MAINLOOP:

CMP WHITEBUTTONSTATE, 1			;checking if the "disarm" state was triggered
JZ ARM
LDI BLUEBUTTONSTATE, 0x00		;bluebuttonstate to 0
LDI PIRSTATE, 0x00				;pirstate to 0
LDI BLUELED, 0x00				;blue led off
LDI REDLED, 0x00				;red led off
OUT PORTB, GREENLED				;green led on
LDI BUZZER, 0x00				;buzzer off

ARM:
CMP BLUEBUTTONSTATE, 1			;checking if the "arm" state was triggered
JZ END
LDI WHITEBUTTONSTATE, 0x00		;whitebuttonstate to 0
LDI GREENLED, 0x00				;green led off
LDI BLUELED, 0x00				;blue led off
DELAY

WHILELOOP:						;checking if the alarm was triggered
CMP PIRSTATE, 1				
JZ WHILELOOPEND	
LDI BLUELED, 0x00				;blue led off
OUT PORTB, REDLED				;red led on
OUT PORTB, BUZZER				;buzzer on

CMP WHITEBUTTON, 1	
JZ DISARMEND
LDI BLUEBUTTONSTATE, 0x00		;bluebuttonstate to 0
LDI PIRSTATE, 0x00				;pirstate to 0
LDI BLUELED, 0x00				;blue led off
LDI REDLED, 0x00				;red led off
OUT PORTB, GREENLED				;green led on
LDI BUZZER, 0x00				;buzzer off

WHILELOOPEND:
RJMP WHILELOOP
END:

RJMP MAINLOOP