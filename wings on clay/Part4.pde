int nb = 0;
void setPart4(){
  shapes = new ArrayList<forme>();
  shapes.add(new forme("square",height/2-slit.hei,width/2-slit.wid/2,slit.wid,slit.hei,0,0,0,1,0,50,slit.r,slit.g,slit.b));
}
void drawPart4(){
  if(trame<1060){
    background(0,0,0);
    for(forme x:shapes)
      x.animer();
    if(trame%8==0){
      int l = shapes.size();
      while(nb<l){
        if(shapes.get(nb).wid>1){
          shapes.add(new forme("square",shapes.get(nb).x1-shapes.get(nb).wid/2,shapes.get(nb).y1-shapes.get(nb).wid/2,shapes.get(nb).wid/2,shapes.get(nb).hei/2,0,0,0,1,0,50,shapes.get(nb).r-5,shapes.get(nb).g-10,shapes.get(nb).b));
          shapes.add(new forme("square",shapes.get(nb).x1-shapes.get(nb).wid/2,shapes.get(nb).y1+shapes.get(nb).wid,shapes.get(nb).wid/2,shapes.get(nb).hei/2,0,0,0,1,0,50,shapes.get(nb).r-5,shapes.get(nb).g-10,shapes.get(nb).b));
          shapes.add(new forme("square",shapes.get(nb).x1+shapes.get(nb).wid,shapes.get(nb).y1+shapes.get(nb).wid,shapes.get(nb).wid/2,shapes.get(nb).hei/2,0,0,0,1,0,50,shapes.get(nb).r-5,shapes.get(nb).g-10,shapes.get(nb).b));
          shapes.add(new forme("square",shapes.get(nb).x1+shapes.get(nb).wid,shapes.get(nb).y1-shapes.get(nb).wid/2,shapes.get(nb).wid/2,shapes.get(nb).hei/2,0,0,0,1,0,50,shapes.get(nb).r-5,shapes.get(nb).g-10,shapes.get(nb).b));
          nb++;
        }else nb = l;
      }
    }
  }
  if(trame==1060){
    sqrs = new forme[9];
    sqrs[0] = new forme("square",0,1300,150,100,5,2,0,1,0,5);
    sqrs[1] = new forme("square",0,1100,150,100,5,2,0,1,0,5);
    sqrs[2] = new forme("square",0,900,150,100,5,2,0,1,0,5);
    sqrs[3] = new forme("square",0,700,150,100,5,2,0,1,0,5);
    sqrs[4] = new forme("square",0,500,150,100,5,2,0,1,0,5);
    sqrs[5] = new forme("square",0,300,150,100,5,2,0,1,0,5);
    sqrs[6] = new forme("square",0,100,150,100,5,2,0,1,0,5);
    sqrs[7] = new forme("square",0,-100,150,100,5,2,0,1,0,5);
    sqrs[8] = new forme("square",0,-300,150,100,5,2,0,1,0,5);
    stroke(0,0,0);
  }
  if(trame>=1060&&trame<1200){
    for(forme x:sqrs){
      x.r=(int)random(200,255);x.g=190;x.b=190;
        x.animer();x.animer();x.animer();}
  }
  if(trame==1200){
    P4av = 10;
    sqrs[0] = new forme("square",0,1300,150,100,5,2,0,1,0,5,190,190,190);
    sqrs[1] = new forme("square",0,1100,150,100,5,2,0,1,0,5,190,190,190);
    sqrs[2] = new forme("square",0,900,150,100,5,2,0,1,0,5,190,190,190);
    sqrs[3] = new forme("square",0,700,150,100,5,2,0,1,0,5,190,190,190);
    sqrs[4] = new forme("square",0,500,150,100,5,2,0,1,0,5,190,190,190);
    sqrs[5] = new forme("square",0,300,150,100,5,2,0,1,0,5,190,190,190);
    sqrs[6] = new forme("square",0,100,150,100,5,2,0,1,0,5,190,190,190);
    sqrs[7] = new forme("square",0,-100,150,100,5,2,0,1,0,5,190,190,190);
    sqrs[8] = new forme("square",0,-300,150,100,5,2,0,1,0,5,190,190,190);
  }
  if(trame>=1200){
    background(0,0,0);
    for(forme x:sqrs){
      int r = (int)random(200,255);
      for(int i=0;i<400;i++){
        x.r = r;
        x.animer();}}
    for(forme x:sqrs){
      x.x1=0;
      x.y1+=P4av;
      if(trame>1300-40)x.movex+=1;
        x.rotation=5;
    }
    cptP4+=P4av;
    if(cptP4==200){for (forme x:sqrs)x.y1-=200;cptP4=0;}
  }
}
