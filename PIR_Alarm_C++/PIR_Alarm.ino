
const int greenLed=11;
const int blueLed=12;
const int redLed=13;
const int blueButton = 9;
const int whiteButton = 8;
const int buzzer=10;
const int pirInputPin=2;

int pirState=0;
int whiteButtonState=0;
int blueButtonState=0;


void setup() {
  pinMode(greenLed, OUTPUT);
  pinMode(blueLed, OUTPUT);
  pinMode(redLed, OUTPUT);
  pinMode(buzzer, OUTPUT);

  pinMode(pirInputPin, INPUT);
  pinMode(blueButton, INPUT);
  pinMode(whiteButton, INPUT);

  digitalWrite(greenLed, 1);
  Serial.begin(9600);
} 

void loop() {
    whiteButtonState=digitalRead(whiteButton);
    blueButtonState=digitalRead(blueButton);
  
    if(whiteButtonState==1){
      blueButtonState=0;
      pirState=0;
      digitalWrite(blueLed, 0);
      digitalWrite(redLed, 0);
      digitalWrite(greenLed, 1);
      noTone(buzzer);
//      Serial.println("Alarm disarmed.");
    }
  
    if(blueButtonState){
      whiteButtonState=0;
      digitalWrite(greenLed, 0);
      digitalWrite(blueLed, 1);
    
      delay(5000);
     
      pirState=digitalRead(pirInputPin);
      
      while(pirState==1){
        digitalWrite(blueLed, 0);
        digitalWrite(redLed, 1);
        tone(buzzer, 1000);
        
            if(digitalRead(whiteButton)){
              blueButtonState=0;
              pirState=0;
              digitalWrite(blueLed, 0);
              digitalWrite(redLed, 0);
              digitalWrite(greenLed, 1);
              noTone(buzzer);
            
            }
      }
    }    
}
   
      
