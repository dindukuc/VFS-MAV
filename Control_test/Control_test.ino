// Simple sketch to read the pulse width of a PWM signal
// Useful for reading PWM valuss from a R/C reciever
// to create actions that are not typically handled
// with a servo, such as controlling LED lighting.

#include <Servo.h>

#define CHANNELS 4

int num_channels = 4;
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


// setup serial and input, output pins
void setup()
{
 
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

  int offset = 0;


  
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
    
    dataA = channel_data[0]/12 + 170;
    dataB = channel_data[0]/12 + 170;

    dataA -= rot; 
    dataB += rot;

    //dataA += 8; //change it so it is linearly scaling
    offset = map(dataA, 170, 255, 6, 10); //should be sort of linearly scaling
    dataA += offset;
    
    if(dataA > 238){
      dataA = 238;
    }
    else if(dataA < (170 + offset + 1)){ //used to be "dataA < 179" for offset being 8
      dataA = 170;
    }

    
    if(dataB > 230){
      dataB = 230;
    }
    else if(dataB < 170){
      dataB = 170;
    }


    Serial.println((String)"Throttle DataA: " + dataA);
    Serial.println((String)"Throttle DataB: " + dataB);

    //data = 170;
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

    //limits without map function
//    if(servoValL < 60){ //max for backward
//      servoValL = 60;
//    }
//    else if(servoValL > 120){ //max for forward
//      servoValL = 120;
//    }
//
//    
//    if(servoValR < 60){ //max for forward
//      servoValR = 60;
//    }
//    else if(servoValR > 120){ //max for backward
//      servoValR = 120;
//    }

    //newly added map functions
    servoValL = map(servoValL, 0, 180, 60, 120); 
    servoValR = map(servoValL, 0, 180, 60, 120);
    
    Serial.println((String)"Servo Data L: " + servoValL);
    Serial.println((String)"Servo Data R: " + servoValR);

    servoL.write(servoValL);
    servoR.write(servoValR);
    
    
    delay(50);



    
//    if(data < 170){
//      analogWrite(escA,170);
//      analogWrite(escB,170);
////      break;
//    }
//  
//    if(data > throttle){
//      delay(50);
//      throttle++;
//      analogWrite(escA, throttle);
//      analogWrite(escB, throttle);
//    }
//    if(data < throttle){
//      delay(50);
//      throttle--;
//      analogWrite(escA, throttle);
//      analogWrite(escB, throttle);
//    }
  
  
  
  }
  

//    Serial.println();

  
  
  
 
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
