int rotSqr,cptP5,alpha,cptChaine,r;
String chaine;
void setPart5(){
  shapes= new ArrayList<forme>();
  anims = new ArrayList<animation>();
  animation x;
  anims.add(x=new animation(250,width/2,5,1,1,0,0,50,"data/spin_hand.png"));x.reSize(500,500);
  anims.add(x=new animation(250-105,width/2-60,0,1,1,0,0,50,"data/kamisama.png"));x.reSize(120,210);
  anims.add(x=new animation(570,240,0,1,1,0,0,50,"data/Board.png"));
  anims.add(x=new animation(110,950,-180,1,6,0,0,50,"data/Animated_Hand_1.png"));
  anims.add(x=new animation(110,1000,-180,1,6,0,0,50,"data/Animated_Hand_1.png"));
  anims.add(x=new animation(110,1050,-180,1,6,0,0,50,"data/Animated_Hand_1.png"));
  anims.add(x=new animation(110,340,-180,1,6,0,0,50,"data/Animated_Hand_11.png"));
  anims.add(x=new animation(110,290,-180,1,6,0,0,50,"data/Animated_Hand_11.png"));
  anims.add(x=new animation(110,240,-180,1,6,0,0,50,"data/Animated_Hand_11.png"));
  anims.add(new animation(200,600,-30,2,4,5,8,1,"data/Angel2.png"));
  anims.add(new animation(200,200,-30,2,4,5,-8,1,"data/Angel2.png"));
  stroke(180,140,0);
  rotSqr = 0;
  cptP5 = 0;
  alpha = 5;
  r = 0;
  daed = createFont("Angelic Alphabet", 48);
  textFont(daed);
  current=2;frameInit=2;frameNb=29;compteur=0;speed=2;
  path="Sky1/Sky1_";
  cyclique=false;
}
void drawPart5(){
  tint(255,255-r,255-r,alpha);
  setBackground();
  ArrayList<animation> rmv = new ArrayList<animation>();
  noFill();
  for(animation x:anims){
    x.animer();
    if(x.ligne>765||x.ligne<-50)rmv.add(x);
  }
  translate(width/2, (height-220)/2);
  rotate(radians(rotSqr));
  for(int i = 0;i<360;i+=10){
    rotate(radians(5));
    square(-80, -80, 160);
  }
  rotate(radians(-rotSqr));rotSqr++;
  rotate(PI);
  translate(-width/2, -(height-220)/2);
  if(cptP5%16==0){int n = (int)random(2,6);animation x;anims.add(x = new animation(-40,50,-90,1,nbImg(n),5,0,1,"data/Animated_Hand_"+n+".png"));if(n==2||n==5) x.reSize(78,250);
                      n = (int)random(2,6);anims.add(x = new animation(760,1240,-270,1,nbImg(n),-5,0,1,"data/Animated_Hand_"+n+".png"));if(n==2||n==5) x.reSize(78,250);}
  cptP5++;
  for(animation x:rmv)
    anims.remove(x);
  if(alpha<255) alpha +=10;
  fill(0,0,0);
  if(trame<1580){
    fill(0,0,0);
    if(trame==1300){chaine = "Perfection cometh in oh so many forms   ";cptChaine = 0;}
    if(trame==1380){chaine = "Amongst the clouds Ziz flies     ";cptChaine = 0;}
    if(trame==1440){chaine = "Atop the mountains Behemoth lies     ";cptChaine = 0;}
    if(trame==1510){chaine = "Afloats at sea Leviathan cries       ";cptChaine = 0;}
    if(trame==1580){chaine = "Who dost thou think thou art    ";cptChaine = 0;}
    fill(0,0,0);
    text(chaine.substring(0,cptChaine),300,660);
    if(trame%2==0)cptChaine++;
  }else{
    if(trame==1580){chaine = "Who dost thou think thou art    ";cptChaine = 0;anims.get(1).contenu[0]=loadImage("data/kamisamael.png");}
    fill(255,0,0);
    if(trame<1640){
      text(chaine.substring(0,cptChaine),300,660);
      if(trame%2==0){cptChaine++;}
      if(trame%4==0){anims.get(0).rotation+=1;}
    }
    else{
      text(chaine,300,660);
    }
    if(r<150)r+=2;
  }
  if(trame>1700) filter(DILATE);
  if(trame>1720) filter(DILATE);
  if(trame>1740) filter(DILATE);
  if(trame>1760) filter(DILATE);
  if(trame>1780) filter(DILATE);
  if(trame>1800&&r<200) r++; 
}
int nbImg(int img){
  switch(img){
    case 2 : return 8;
    case 3 : return 7;
    case 4 :
    case 5 : return 5;
  }
  return 1;
}
