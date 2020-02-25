// Simple sketch to read the pulse width of a PWM signal
// Useful for reading PWM valuss from a R/C reciever
// to create actions that are not typically handled
// with a servo, such as controlling LED lighting.


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


// setup serial and input, output pins
void setup(){
  Serial.begin(9600);
  pinMode(pins[0], INPUT); // PWM input pin
  pinMode(pins[1], INPUT); // PWM input pin
  pinMode(pins[2], INPUT); // PWM input pin
  pinMode(pins[3], INPUT); // PWM input pin

  pinMode(escA, OUTPUT);
  pinMode(escB, OUTPUT);
  analogWriteFrequency(escA, 16000);     //set pin 0 frequency to 16kHz
  analogWriteFrequency(escB, 16000);     //set pin 1 frequency to 16kHz

  delay(1000);
  
}

 

void loop(){
  int duration = 0;
  int temp = 0;
  int channel_data[num_channels];
  
  for(int i = 1; i < num_channels+1; i++){
      duration = pulseIn(pins[i-1], HIGH);  
       temp = duration - 990;
      
      temp = constrain(temp, 0, 1024);
      channel_data[i-1] = temp;
//      Serial.print((String)" Channel " + i + ": ");
//      Serial.print(channel_data[i-1]);
  }

    dataA = map(channel_data[0], 0, 1024, 0, 255);
    dataB = map(channel_data[0], 0, 1024, 0, 255);

    Serial.println((String)"Throttle DataA: " + dataA);
    Serial.println((String)"Throttle DataB: " + dataB);

    analogWrite(escA,dataA);
    analogWrite(escB,dataB);

    delay(50);
  
}
