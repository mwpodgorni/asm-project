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

LDI GREENLED, 0x20				;setting up the alarm
LDI BLUELED, 0x40
LDI REDLED, 0x80
LDI BUZZER, 0x10
LDI BLUEBUTTON, 0x08
LDI WHITEBUTTON, 0x04

LDI PIRINPUTPIN, 0x10

OUT DDRB, GREENLED
OUT DDRB, BLUELED
OUT DDRB, REDLED
OUT DDRB, BUZZER

IN DDRB, BLUEBUTTON
IN DDRB, WHITEBUTTON
IN DDRE, PIRINPUTPIN

OUT PORTB, GREENLED


MAINLOOP:

CMP WHITEBUTTONSTATE, 1
JZ ARM
LDI BLUEBUTTONSTATE, 0x00
LDI PIRSTATE, 0x00
LDI BLUELED, 0x00
LDI REDLED, 0x00
OUT PORTB, GREENLED
LDI BUZZER, 0x00

ARM:
CMP BLUEBUTTONSTATE, 1
JZ END
LDI WHITEBUTTONSTATE, 0x00
LDI GREENLED, 0x00
LDI BLUELED, 0x00
DELAY

WHILELOOP:
CMP PIRSTATE, 1
JZ WHILELOOPEND
LDI BLUELED, 0x00
OUT PORTB, REDLED
OUT PORTB, BUZZER

CMP WHITEBUTTON, 1
JZ DISARMEND
LDI BLUEBUTTONSTATE, 0x00
LDI PIRSTATE, 0x00
LDI BLUELED, 0x00
LDI REDLED, 0x00
OUT PORTB, GREENLED
LDI BUZZER, 0x00

WHILELOOPEND:
RJMP WHILELOOP
END:

RJMP MAINLOOP