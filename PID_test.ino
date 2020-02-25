// Simple sketch to read the pulse width of a PWM signal
// Useful for reading PWM valuss from a R/C reciever
// to create actions that are not typically handled
// with a servo, such as controlling LED lighting.

#include <Servo.h>
#include <PID_v1.h>

#define CHANNELS 4
#define MAX_POWER 245
#define MAX_FREQ 58.4 //in kHz

int num_channels = CHANNELS;
int pins[CHANNELS] = {0, 1, 14, 15};  // Check what pin to use
byte escA = 2; // change this
byte escB = 3; //change this
int throttle = 55;
int throttle_step = 0;
int dataA = 180;
int dataB = 180;
int rot = 0;
int yaw_scale = 64; //128;

//servo stuff
Servo servoL;
Servo servoR;

//PID stuff
double SetpointA, InputA, OutputA;
double SetpointB, InputB, OutputB;
double kp=1, ki=0.05, kd=0.25; //tuning values to change here

PID PIDA(&InputA, &OutputA, &SetpointA, kp, ki, kd, DIRECT); //left pid loop
PID PIDB(&InputB, &OutputB, &SetpointB, kp, ki, kd, DIRECT); //right pid loop

int encodePinA = 23;
int encodePinB = 22;



// setup serial and input, output pins
void setup(){
 
  Serial.begin(9600);
  pinMode(pins[0], INPUT); // PWM input pin
  pinMode(pins[1], INPUT); // PWM input pin
  pinMode(pins[2], INPUT); // PWM input pin
  pinMode(pins[3], INPUT); // PWM input pin
//  pinMode(pins[4], INPUT); // PWM input pin
  //pinMode(outblink, OUTPUT); // LED Blink pin, using the build in LED on pin 13
  
  
  servoL.attach(4);
  servoR.attach(5);
  
  servoL.write(90);
  servoR.write(90);
  
  pinMode(escA, OUTPUT);
  pinMode(escB, OUTPUT);
  analogWriteFrequency(escA, 16000);     //set pin 0 frequency to 16kHz
  analogWriteFrequency(escB, 16000);     //set pin 1 frequency to 16kHz

  delay(1000);
  analogWrite(escA, 255);
  analogWrite(escB, 255);
  delay(3000);
  bootThrottle();
  Serial.println("end");
  delay(1000);


  InputA = 0;
  InputB = 0;

  SetpointA = 0;
  SetpointB = 0;


  PIDA.SetSampleTime(40);
  PIDB.SetSampleTime(40);
  
  PIDA.SetMode(AUTOMATIC);
  PIDB.SetMode(AUTOMATIC);



//  maybe add interrupt stuff here to read encoders
}

 

void loop()
{
  int duration; // Duration of the pulse
  throttle = 130;
  int channel_data[num_channels];
  int temp;

  int servoValL;
  int servoValR;
  int turn;
  int turn_scale = 16;


  
  for(int i = 0; i < 20; i++){
    delay(100);
    analogWrite(escA, throttle);
    analogWrite(escB, throttle);
    throttle++;
    Serial.println(throttle);
  }
  
  for(int i = 0; i < 20; i++){
    delay(50);
    analogWrite(escA, throttle);
    analogWrite(escB, throttle);
    throttle--;
    Serial.println(throttle);
  } 
  delay(500);
  analogWrite(escA, 170);
  analogWrite(escB, 170);

  while(1){
//      Serial.println("Start of while");
    for(int i = 1; i < num_channels+1; i++){
      duration = pulseIn(pins[i-1], HIGH);  
//      Serial.print((String)" Channel " + i + ": ");
       temp = duration - 990;
      
      if(temp < 0){
         temp = 0;
      }
      else if(temp > 1024){
        temp = 1024;
      }
      channel_data[i-1] = temp;
      
//      Serial.print(channel_data[i-1]);
    }
//    Serial.println();


    rot = (channel_data[3] - 512)/yaw_scale;
    
    SetpointA = map(channel_data[0], 0, 1024, 0, 255) - rot;
    SetpointB = map(channel_data[0], 0, 1024, 0, 255) + rot;
   
    InputA = encoderVal(encodePinA);
    InputB = encoderVal(encodePinB);
    PIDA.Compute();
    PIDB.Compute();
    
    dataA = map(OutputA, 0, 255, 170, 255);
    dataB = map(OutputB, 0, 255, 170, 255);

    dataA = constrain(dataA, 170, MAX_POWER);
    dataB = constrain(dataB, 170, MAX_POWER);
    

    Serial.println((String)"SetpointA: " + SetpointA);
    Serial.println((String)"SetpointB: " + SetpointB);

    Serial.println((String)"InputA: " + InputA);
    Serial.println((String)"InputB: " + InputB);
    
    Serial.println((String)"Throttle DataA: " + dataA);
    Serial.println((String)"Throttle DataB: " + dataB);

    
    analogWrite(escA,dataA);
    analogWrite(escB,dataB);

    


    
    //servo control
    turn = (channel_data[1] - 512)/turn_scale;
  
    servoValL = channel_data[2]; //forward and back channel
    servoValR = channel_data[2]; //forward and back channel

    Serial.println((String)"Channel Data: " + channel_data[1]); //prints the turn data

    //this returns it in terms of an angle from 0 to 180
    servoValL = 180 - ( (servoValL*180)/1024 ); //used to be:  servoValL = (servoValL*180)/1024; changed to make left and right turn correctly
    servoValR = (servoValR*180)/1024; //used to be:  servoValR = 180 - (servoValR*180)/1024; changed to make left and right turn correctly

    servoValL += turn;
    servoValR += turn;

    //newly added map functions
    servoValL = map(servoValL, 0, 180, 60, 120); 
    servoValR = map(servoValL, 0, 180, 60, 120);
    
    Serial.println((String)"Servo Data L: " + servoValL);
    Serial.println((String)"Servo Data R: " + servoValR);

    servoL.write(servoValL);
    servoR.write(servoValR);
    
    
    delay(50);
  }

  delay(100); //delay so you can read the scrolling output
}



void bootThrottle(){
  Serial.println("Throttle Cal");
  for(int i = 0; i < 150; i++){
    analogWrite(escA, throttle_step);
    analogWrite(escB, throttle_step);
    throttle_step++;
    delay(10);
  }
  delay(100);
  for(int i = 0; i < 150; i++){
    analogWrite(escA, throttle_step);
    analogWrite(escB, throttle_step);
    throttle_step--;
    delay(10);
  }
}


double encoderVal(int pin){
  double duration = pulseIn(pin, LOW, 3);
  double freq = 0;
  double power = 0;
  
  if(duration != 0){
    freq = 1/(duration + 2);
  }
  
  power = 255*(freq/MAX_FREQ);

  return power;
  
}
