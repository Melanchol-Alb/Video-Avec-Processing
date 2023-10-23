int trame,cptP4,cptP2;
int P4av;
int finP4;
PFont daed;
backgrnd fond;
forme slit,sqr,sqrs[];
ArrayList<forme> shapes;
ArrayList<animation> anims;
void setup(){//20 FRAMES PER SEC IS WHERE IT'S AT
  size(1280,720);
  trame = 0;
  cptP4=0;
  finP4=70;
  setPart1();
  frameRate(20);
}
void draw(){
  if(trame<380)drawPart1();
  if(trame==380)setPart2();
  if(trame>=380&&trame<765)drawPart2();
  if(trame==765)setPart3();
  if(trame>=765&&trame<=1000)drawPart3();
  if(trame==1001)setPart4();
  if(trame>=1001&&trame<1300)drawPart4();
  if(trame==1300) setPart5();
  if(trame>=1300&&trame<=1860) drawPart5();
  if(trame<=1860)saveFrame("Capt####");
  trame++;
}
