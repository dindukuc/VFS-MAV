// used to measure our tacos per unit length

void pulse_countA(){
  encA_count++;
}

void pulse_countB(){
  encB_count++;
}

void calc_rpm(){
  double ms = 1000;          //evaluate rpm every ms
//  double sec = interval_time_us/MAGNITUDE;          //evaluate rpm every ms
  double rot = (encA_count/CPR);
  current_rpmA = (rot*60000)/ms;
  rot = (encB_count/CPR);
  current_rpmB = (rot*60000)/ms;
  encA_count = 0;
  encB_count = 0;
}
