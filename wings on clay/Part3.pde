int sx,sy,dxTour,move=0;
boolean once = true;
ArrayList<animation> anims2;
void setPart3(){
  noFill();
  sx = 500;
  sy = 500;
  dxTour = 0;
  anims = new ArrayList<animation>();
  anims2 = new ArrayList<animation>();
  slit=new forme("square",height/2,width/2,10,10,5,0,0,1,10,1,255,150,0);
}
void drawPart3(){
  if(trame==850)xs();
  background(0,0,0);
  noFill();
  translate(390-move,110);
  if(trame<1000){
  for(int i =1;i<(sx+sy)/2;i+=5){
    stroke(random(150,255),random(0,255),random(0,55));
    arc(sy-dxTour, 0, i, i, 0, 2*PI);
    arc(sy, sx-dxTour, i, i, 0, 2*PI);
    arc(0, 0+dxTour, i, i, 0, 2*PI);
    arc(0+dxTour, sx, i, i, 0, 2*PI);
  }
  if(dxTour==sx) dxTour=0; else dxTour+=5;
  }
  translate(-390,-110);
  if(trame<1000){
  newEyes();
  ArrayList<animation> rmv = new ArrayList<animation>();
  for(animation x:anims)
    if(x.ligne<1280)x.animer();else rmv.add(x);
  for(animation y:rmv)
    anims.remove(y);
  }
  if(trame>820) {if(once&&slit.wid>200) {slit.sizeInc = 0;slit.movey=8;move=move+slit.movey;} slit.animer();if(trame%3==0)slit.g++;}
  if(once&&trame>975) if(slit.rota%180<5){slit.rotation=0;slit.rota=0;slit.movey=0;slit.y1-=slit.wid/2;slit.x1-=slit.wid/2;once=false;}
}
void newEyes(){
  if((trame-765)%12==0){
    int l = (int)random(2,4.1);
      for(int i =0;i<l;i++)
        anims.add(new animation((int)random(-80,-40),(int)random(0,100),(int)random(5,20),1,1,(int)random(7,12),0,1,"eye1.png"));
     l = (int)random(2,4.1);
     for(int i =0;i<l;i++)
       anims.add(new animation((int)random(-80,-40),(int)random(1180,1270),(int)random(5,20),1,1,(int)random(7,12),0,1,"eye1.png"));
  }
}
void xs(){
    anims.add(new animation(1000,1280+200,-30,2,4,-10,-2,1,"data/Angel2.png"));
    anims.add(new animation(1000,1280+400,-30,2,4,-15,-2,1,"data/Angel2.png"));
    anims.add(new animation(1000,1280+500,-30,2,4,-12,-2,1,"data/Angel2.png"));
    anims.add(new animation(1000,1280+700,-30,2,4,-10,-2,1,"data/Angel2.png"));
    anims.add(new animation(1000,1280+800,-30,2,4,-12,-2,1,"data/Angel2.png"));
    anims.add(new animation(1100,1280+900,-30,2,4,-10,-2,1,"data/Angel2.png"));
    anims.add(new animation(1200,1280+950,-30,2,4,-19,-2,1,"data/Angel2.png"));
    anims.add(new animation(1000,1280+1000,-30,2,4,-17,-2,1,"data/Angel2.png"));
}
