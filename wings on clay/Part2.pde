void setPart2(){
  shapes = new ArrayList<forme>();
  anims = new ArrayList<animation>();
  anims.add(new animation(height/2,width/2,5,4,1,0,0,1,"data/Angel1.png"));
  anims.add(new animation(height/2-125,width/2-125,-30,4,3,0,0,1,"data/maw.png"));
  anims.add(new animation(900,250,-30,4,4,-5,-2,1,"data/Angel2.png"));
  anims.add(new animation(-1200,1000,-30,4,4,5,0,1,"data/Angel2.png"));
  anims.add(new animation(500,1500,5,3,1,0,-5,1,"data/Angel1.png"));
  daed = createFont("Angelic Alphabet", 48);
  textFont(daed);
  cptP2 = 0;
  noFill();
  stroke(0);
  for(int i=0;i<500;i++);
    drawPart2();
}
void drawPart2(){
  background(random(250,255),random(50,150),random(180,200));
  text("A slit as dark as night in the midday sky I see growing and growing beckoning in denizens of the realm of perfection surely among them dwells my reflexion waiting and waiting and now in glory the beackon shines upon me",1280-2*cptP2,100);
  text("Into glory or gore In this pink corridor I've gotten plucked The red hue shakes The bleak end quackes I am stunnedInto glory or gore In this pink corridor I've gotten plucked The red hue shakes The bleak end quackes I am stunned",1350-4*cptP2,200);
  text("The birds weep in harmony, the grand scheme of life unveiled leaves no room for thought or prayer, come all ye faithful to the house of horror plentiful and bathe in the glory of the father of dread as he sings us his song",-4500+3*cptP2,600);
  rotate(HALF_PI);
  text("This is a long text",750-cptP2,-90);
  text("This is an even longer text",-400+cptP2,-1100);
  rotate(-HALF_PI);
  cptP2++;
  if(trame==700) {//anims.get(1).rotation = 5;
                  anims.get(1).movC=-3;anims.get(1).movL=-3;}
  if(trame>=700) anims.get(1).reSize(anims.get(1).imgWid+6,anims.get(1).imgHei+6);
  
  float v1 = random(-2,3),v2=random(-2,3);
  translate(v1,v2);
  drawShapesP2();
  if(cptP2%4==0)shapes.add(new forme("rect",height/2-height/(50),width/2-width/(50),width/25,height/25,0,-4,-8,2,8,1));
  
  line(0,40,width/2-width/(50),height/2-height/(50));
  line(0,height-40,width/2-width/(50),height/2-height/(50)+height/25);
  line(width/2-width/50+width/25,height/2-height/50,width,40);
  line(width/2-width/50+width/25,height/2-height/50+height/25,width,height-40);
  
  for(animation x:anims)
    x.animer();
  
  translate(-v1,-v2);
}
void drawShapesP2(){
  for(forme x:shapes)
    x.animer();
  if(shapes.size()>0)
  if(shapes.get(0).hei>720)
    shapes.remove(0);
}
