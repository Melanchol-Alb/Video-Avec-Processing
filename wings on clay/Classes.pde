class forme{
  String shape;
  int x1,y1;
  int movex,movey;
  int speed;
  int sizeInc,sizespeed;
  int wid,hei;
  int rotation,rota;
  int cpt;
  int r,g,b;
  forme(String shap,int x,int y,int widd,int heii,int rott,int movx,int movy,int spd,int sizeIncrease,int sizespd){
    shape = shap;
    x1=x;y1=y;
    movex=movx;movey=movy;
    speed=spd;
    wid=widd;hei=heii;
    sizeInc = sizeIncrease;sizespeed=sizespd;
    rotation=rott;rota=0;
    cpt=1;r=-1;g=255;b=255;
  }
  forme(String shap,int x,int y,int widd,int heii,int rott,int movx,int movy,int spd,int sizeIncrease,int sizespd,int rc,int gc,int bc){
    shape = shap;
    x1=x;y1=y;
    movex=movx;movey=movy;
    speed=spd;
    wid=widd;hei=heii;
    sizeInc = sizeIncrease;sizespeed=sizespd;
    rotation=rott;rota=0;
    cpt=1;
    r=rc;g=gc;b=bc;
  }
  void animer(){
    if(r==-1) noFill();
    else fill(r,g,b);
    if(rotation!=0){translate(y1,x1);rotate(radians(rota));}
    draww();
    if(rotation!=0){rotate(radians(-rota));translate(-y1,-x1);}
    if(cpt%speed==0){
      x1+=movex;
      y1+=movey;
      rota+=rotation;
    }
    if(cpt%sizespeed==0){
      wid+=sizeInc;
      hei+=sizeInc/2;
    }
    cpt++;
  }
  void draww(){
    int col1=y1,lin1=x1;
    if(rotation!=0){col1=-wid/2;lin1=-hei/2;}
    switch(shape){
      case "square": square(col1,lin1,wid);break;
      case "rect": rect(col1,lin1,wid,hei);break;
      case "circle":circle(col1,lin1,wid);break;
      case "los":ellipse(col1,lin1,wid,hei);break;
    }
  }
}
class animation{
  int ligne,colonne,rotation,nbr,img,rot,compteur,speed;
  int movL,movC,movSpeed;
  int imgHei,imgWid;
  String filePath;
  PImage contenu[];
  boolean dir;
  animation(int ligne,int colonne,int rotation,int speed,int nbr,int movL,int movC,int movSpeed,String filePath){
    this.ligne = ligne;this.colonne = colonne;this.rotation = rotation;this.nbr = nbr;
    this.movL = movL;  this.movC = movC;      this.movSpeed=movSpeed;  this.speed = speed;      this.filePath = filePath;
    dir = true;img=0;rot = 0;
    contenu = new PImage[nbr];  getImages();
  }
  void reSize(int Wid,int Hei){
    imgWid = Wid;  imgHei=Hei;
  }
  void animer(){
    if(rotation>0){translate(colonne,ligne);rotate(radians(rot));image(contenu[img],-imgWid/2,-imgHei/2,imgWid,imgHei);}
    if(rotation==-90||rotation==-180||rotation==-270){translate(colonne,ligne);rotate(radians(-rotation));image(contenu[img],-imgWid/2,-imgHei/2,imgWid,imgHei);rotate(-radians(-rotation));translate(-colonne,-ligne);}
    else if(rotation<=0)                                                    image(contenu[img],colonne,ligne,imgWid,imgHei);
    if(rotation>0){rotate(radians(-rot));translate(-colonne,-ligne);}
    rot+=rotation;
    if(compteur%speed == 0){
      if(dir)img++;else img--;
    }
    if(compteur%movSpeed==0){
      ligne+=movL;  colonne+=movC;
    }
    if(rotation!=-30){
      if(img>nbr-1 || img<0) {dir = ! dir;
        if(dir)img++;else img--;}}
     else if(img==nbr) img=0;
    compteur ++;
  }
  void getImages(){
    PImage src = loadImage(filePath);
    imgWid = src.width/nbr;
    imgHei = src.height;
    int indices[] = new int[nbr];
    for(int i = 0;i<nbr;i++){
      contenu[i] = createImage(imgWid,imgHei,ARGB);
      indices[i] = 0;
    }
    src.loadPixels();
    color couleurSep = src.pixels[0];
    int i = src.width,iProv;
    while(i<src.width*(src.height-2)){
      for(int k =0;k<nbr;k++){
        iProv = indices[k];
        while(indices[k]<iProv+imgWid-1){
          if(src.pixels[i]==couleurSep)
            contenu[k].pixels[indices[k]] = color(0,0,0,0);
          else contenu[k].pixels[indices[k]] = src.pixels[i];
          i++;
          indices[k]++;
        }
        i++;
        indices[k]++;
        contenu[k].updatePixels();
      }
    }
  }
}
class backgrnd{
  int current,speed,frameInit,frameNb,compteur;
  String path,extension;
  PImage contenu;
  boolean direction,cyclique;
  backgrnd(int frameInit,int frameNb,int speed,String path,String extension,boolean cyclique){
    current = frameInit;
    this.frameInit = frameInit;
    this.frameNb = frameNb;
    this.speed = speed;
    this.path = path;
    this.extension = extension;
    this.cyclique = cyclique;
    compteur = 0;
    //contenu = loadImage(path+"00"+current+extension);
  }
  void setBackground(){
    if(compteur%speed == 0) {
      if(cyclique){
        current ++;
        if(current>frameNb) 
          current = frameInit;
      }
      else  {
        if((direction && current == frameNb) || (!direction && current == frameInit))
          direction = !direction;
        current += direction? 1:-1;
      }
      contenu = loadImage(path+((current<100)?"0":"")+((current<10)?"0":"")+current+extension);
    }
    try{
    image(contenu,0,0);}
    catch(Exception e){print(path+((current<100)?"0":"")+((current<10)?"0":"")+current+extension);}
    compteur ++ ;
  }
}

int current=9,speed=1,frameInit=9,frameNb=125,compteur=0;
  String path="Sky0/Sky0_",extension=".jpg";
  PImage contenu;
  boolean direction=true,cyclique=true;
  void setBackground(){
    if(compteur%speed == 0) {
      if(cyclique){
        current ++;
        if(current>frameNb) 
          current = frameInit;
      }
      else  {
        if((direction && current == frameNb) || (!direction && current == frameInit))
          direction = !direction;
        current += direction? 1:-1;
      }
      contenu = loadImage(path+((current<100)?"0":"")+((current<10)?"0":"")+current+extension);
    }
    image(contenu,0,0);
    compteur ++ ;
  }
