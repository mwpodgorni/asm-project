# A Project for the AVR - Written in Assembler Language



## Description of the Project
Movement sensor that is triggering an alarm when detects movement.
Features/parts:

Used components:  | 
------------- |  
Movement sensor
Red and green LED lights + blue light
Buzzer
Arm button
Jump Wires
Breadboard
Arduino

Description:
When alarm is turned on, green LED light is working, and it’s unarmed by default. If you press blue button, the alarm is armed after 5 seconds. When movement is detected, red LED light and buzzer are turning on, green and blue light are switching off. Alarm is triggered until someone clicks the white button. Then it goes to ”unarmed” state and is waiting to be armed again.

## Problem Formulation
What is the best way to create such a device?

How can it be more optimized using Assembly than using c++?

How to make buttons respond with the right action?
## ProjectPlan
### State Machine Diagram
![](https://github.com/mwpodgorni/asm-project/blob/master/StateMachineDiagramPic.png)
## Implementation
Check Assembly file
## Testing
![](https://github.com/mwpodgorni/asm-project/blob/master/testing.png)
### Constructed circuit
![](https://github.com/mwpodgorni/asm-project/blob/master/circuitPic.png)



