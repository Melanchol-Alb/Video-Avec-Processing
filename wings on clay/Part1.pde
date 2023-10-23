void setPart1(){
  shapes = new ArrayList<forme>();
  anims = new ArrayList<animation>();
  anims.add(new animation(10,width/2-10,0,1,1,2,0,1,"data/grab.png"));
  anims.get(0).reSize(10,10);
  slit=new forme("los",height/2-300,width/2,1,100,0,0,0,1,0,5,0,0,0);
  noStroke();
}
void drawPart1(){
  setBackground();
  if(trame<80&&trame%4==0)
    slit.wid++;
  if(trame>80&&trame%16==0)
    slit.hei++;
    newShapes();
  for(forme x:shapes)
    x.animer();
   slit.animer();
   if(trame>280)
     for(animation x:anims){
       x.animer();x.reSize(x.imgWid+6,x.imgHei+6);x.colonne-=3;}
}
void newShapes(){
  switch(trame){
    case 70: getShapes(50);break;
    case 80: getShapes(50);break;
    case 90: getShapes(60);break;
    case 100:getShapes(70);break;
    case 110:getShapes(80);break;
    case 120:getShapes(90);break;
    case 130:getShapes(100);break;
    case 140:getShapes(110);break;
    case 150:getShapes(120);break;
    case 160:getShapes(70);break;
    case 170:getShapes(80);break;
    case 180:getShapes(90);break;
    case 190:getShapes(100);break;
    case 200:getShapes(110);break;
    case 220:getShapes(120);break;
    case 240:getShapes(90);break;
    case 260:getShapes(100);break;
    case 280:getShapes(110);break;
    case 300:getShapes(120);break;
  }
}
void getShapes(int nb){
  for(int i=0;i<nb/4;i++){
    shapes.add(new forme("square",height/2-(int)random(290,310),width/2-2,10+rdm(-5,6),10,rdm(5,15),(i%20==1)?0:rdm(-9,9),(i%20==0)?0:rdm(-9,9),1,0,5,(int)random(0,255),(int)random(0,255),(int)random(0,255)));
    shapes.add(new forme("rect",height/2-(int)random(290,310),width/2-2,10+rdm(-5,6),10+rdm(-5,6),rdm(5,15),(i%20==1)?0:rdm(-9,9),(i%20==0)?0:rdm(-9,9),1,0,5,(int)random(0,255),(int)random(0,255),(int)random(0,255)));
    shapes.add(new forme("circle",height/2-(int)random(290,310),width/2-2,10+rdm(-5,6),10+rdm(-5,6),rdm(5,15),(i%20==1)?0:rdm(-9,9),(i%20==0)?0:rdm(-9,9),1,0,5,(int)random(0,255),(int)random(0,255),(int)random(0,255)));
}
for(int i=0;i<nb/8;i++){
  shapes.add(new forme(randShape(),height/2-(int)random(290,310),width/2-2,10+rdm(-5,6),10+rdm(-5,6),rdm(5,15),(i%4==1)?rdm(-12,-5):rdm(5,12),(i%4==0)?rdm(-12,-5):rdm(5,12),1,rdm(1,4),5,(int)random(0,255),(int)random(0,255),(int)random(0,255)));
  shapes.add(new forme(randShape(),height/2-(int)random(290,310),width/2-2,10+rdm(-5,6),10+rdm(-5,6),rdm(5,15),(i%4==0)?rdm(-12,-5):rdm(5,12),(i%4==1)?rdm(-12,-5):rdm(5,12),1,rdm(1,4),5,(int)random(0,255),(int)random(0,255),(int)random(0,255)));
}
}
int rdm(int a,int b){
  int ret = (int)random(a,b);
  while(ret==0)
    ret = (int)random(a,b);
  return ret;
}
String randShape(){
  int i = (int)random(0,4);
  switch(i){
    case 0:return "rect";
    case 1:return "circle";
    case 2:return "square";
    case 3:return "los";
  }
  return "los";
}
