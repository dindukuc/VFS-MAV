#define CHANNELS 8

int num_channels = 8;
int pins[CHANNELS] = {0, 1, 12, 11, 10, 9, 14, 15};  // Check what pin to use

int duration; // Duration of the pulse
int channel_data[CHANNELS];
int temp;

void setup() {
  Serial.begin(9600);
  for(int i = 0; i < num_channels; i++){
    pinMode(pins[i], INPUT);
  }
}

void loop() {
  for(int i = 1; i < num_channels+1; i++){
      duration = pulseIn(pins[i-1], HIGH);  
      temp = duration - 990;
      
      if(temp < 0){
         temp = 0;
      }
      else if(temp > 1024){
        temp = 1024;
      }
      channel_data[i-1] = temp;

      Serial.print("  | Channel ");
      Serial.print(i);
      Serial.print(" : ");
      Serial.print(channel_data[i-1]);
    }
  Serial.println();
  delay(50);
  //Serial.println("\n\n\n\n\n\n\n\n\n");
}
