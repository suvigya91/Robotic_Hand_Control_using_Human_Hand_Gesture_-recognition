int lp=2;
int ln=3;
int rp=4;
int rn=5;
int mp=6;
int mn=7;
int ip=8;
int in=9;
int tp=2;
int tn=2;

void setup()
{
  pinMode(lp,OUTPUT);
  pinMode(ln,OUTPUT);
  pinMode(rp,OUTPUT);
  pinMode(rn,OUTPUT);
  pinMode(mp,OUTPUT);
  pinMode(mn,OUTPUT);
  pinMode(ip,OUTPUT);
  pinMode(in,OUTPUT);
  pinMode(tp,OUTPUT);
  pinMode(tn,OUTPUT);
}

void loop()
{
 little_fin();
 delay(100);
 ring_fin();
 delay(100);
 middle_fin();
 delay(100);
 index_fin();
 delay(100);
 thumb_fin();
 delay(100); 
}

void little_fin()
{
    analogWrite(lp,240);      //move staright
    analogWrite(ln,0);    
    delay(200);
    analogWrite(lp,0);      //move left
    analogWrite(ln,0);
    delay(100);
    analogWrite(lp,0);      //move left
    analogWrite(ln,240);
    
 }
 
 void ring_fin()
{
    analogWrite(rp,150);      //move staright
    analogWrite(rn,0);    
    delay(200);
    analogWrite(rp,0);      //move staright
    analogWrite(rn,0);    
    delay(100);
    analogWrite(rp,0);      //move left
    analogWrite(rn,150);
 }
 void middle_fin()
{
    analogWrite(mp,240);      //move staright
    analogWrite(mn,0);    
    delay(200);
    analogWrite(mp,0);      //move left
    analogWrite(mn,240);
}
void index_fin()
{
    analogWrite(ip,240);      //move staright
    analogWrite(in,0);    
    delay(200);
    analogWrite(ip,0);      //move staright
    analogWrite(in,0);    
    delay(100);
    analogWrite(ip,0);      //move left
    analogWrite(in,240);
 }
 void thumb_fin()
{
    analogWrite(tp,240);      //move staright
    analogWrite(tn,0);    
    delay(200);
    analogWrite(tp,0);      //move staright
    analogWrite(tn,0);    
    delay(100);
    analogWrite(tp,0);      //move left
    analogWrite(tn,240);
    
 }
