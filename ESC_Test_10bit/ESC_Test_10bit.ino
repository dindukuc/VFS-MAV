#define CHANNELS 5


int num_channels = 4;                     //BUG DETECTED: when not all channels are plugged in, pulse in causes large delays in loop
int pins[CHANNELS] = {0, 1, 14, 15, 12};  // Check what pin to use
byte escA = 2; // change this
byte escB = 3; //change this
int throttle = 55;
int throttle_step = 0;
int rot = 0;
int yaw_scale = 64; //128;

int throttleA, throttleB =0;

void setup() {
  int temp = 0;
  int duration = 0;
  int channel = 0;

  Serial.begin(9600);
  pinMode(pins[0], INPUT); // PWM input pin
  pinMode(pins[1], INPUT); // PWM input pin
  pinMode(pins[2], INPUT); // PWM input pin
  pinMode(pins[3], INPUT); // PWM input pin
  
  pinMode(escA, OUTPUT);
  pinMode(escB, OUTPUT);
  analogWriteFrequency(escA, 16000);     //set pin 0 frequency to 16kHz
  analogWriteFrequency(escB, 16000);     //set pin 1 frequency to 16kHz
  analogWriteResolution(10);
  analogWrite(escA, 1024);
  analogWrite(escB, 1024);
  delay(1000);
}

void loop() {
  int duration; // Duration of the pulse
  throttle = 130;
  int channel_data[num_channels];
  int temp;
  
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
      Serial.println(channel_data[i-1]);
    }

    rot = (channel_data[3] - 512)/yaw_scale;

    throttleA = map(channel_data[0], 0, 1024, 550, 1000) - rot;
    throttleB = map(channel_data[0], 0, 1024, 550, 1000) + rot;

    Serial.println((String)"Throttle DataA: " + throttleA);
    Serial.println((String)"Throttle DataB: " + throttleB);

    //data = 170;
    analogWrite(escA,throttleA);
    analogWrite(escB,throttleB);
}
