PImage backpic, birdpic, wallpic, welcomescreen,bonuspic;
int game, score, highscore, x, y, vertical, wallx[] = new int[2], wally[] =new int[2];
void setup() {
   String face = "face.png";
   String backg = "background.jpeg";
   String wall = "wall.png";
   String enter = "enter (1).jpg";
   String bonuspicc = "bonuspic.png";
   backpic =loadImage(backg);
   birdpic =loadImage(face);
   wallpic =loadImage(wall);
   bonuspic = loadImage(bonuspicc);
   welcomescreen=loadImage(enter);
   game = 1; score = 0; highscore = 0; x = -200; vertical = 0; 
  size(600,450);
  fill(0,0,0);
  textSize(25);
  
}
void draw() { 
  if(game == 0) {
    imageMode(CORNER);
    image(backpic, x, 0);
    image(backpic, x+backpic.width, 0);
    x -= 5;
    vertical += 1;
    y += vertical;
    if(x == -1800) x = 0;
    for(int i = 0 ; i < 2; i++) {
      imageMode(CENTER);
      image(wallpic, wallx[i], wally[i] - (wallpic.height/2+100));
      image(wallpic, wallx[i], wally[i] + (wallpic.height/2+100));
      if(wallx[i] < 0) {
        wally[i] = (int)random(200,height-200);
        wallx[i] = width;
      }
      if(wallx[i] == width/2) highscore = max(++score, highscore);
      if(y>height||y<0||(abs(width/2-wallx[i])<25 && abs(y-wally[i])>100)) game=1;
      wallx[i] -= 6;
    }
    image(birdpic, width/2, y);
    text("Score: "+score, 10, 20);
    if(score == 10) { // check if score is 10
      imageMode(CENTER);
      image(bonuspic, width/2, height/2); // display the bonus image
      
    }
  }
  
  else {
    imageMode(CENTER);
    image(welcomescreen, width/2,height/2);
    text("High Score: "+highscore, 50, 130);
    fill(250,250,0);

  }
}
void mousePressed() {
  vertical = -15;
  if(game==1) {
    wallx[0] = 300;
    wally[0] = y = height/2;
    wallx[1] = 600;
    wally[1] = 300;
    x = game = score = 0;
  }
}
