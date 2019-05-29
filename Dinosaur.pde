class Dinosaur extends Enemy{
	// Requirement #4: Complete Dinosaur Class
  float speed = 1f;
  int direction;
  final float TRIGGERED_SPEED_MULTIPLIER = 5;
  
  Dinosaur(float x,float y){
   super(x,y); 
  }

  void update(){
    x += speed;
    if(x >= width-w || x<0) {
    speed *=-1 ;}
    if(player.row*SOIL_SIZE==y){
    if(player.x<x && direction==LEFT&&speed==-1f||player.x>x && direction==RIGHT&&speed==1f){speed*=TRIGGERED_SPEED_MULTIPLIER;}
    else{speed=(speed>0)?1f:-1f;}}
    
  }
  void display(){
    direction = (speed > 0)?RIGHT:LEFT;
    pushMatrix();
    if (direction == LEFT){
    translate(x+w,y);
    scale(-1,1);
    image(dinosaur,0,0);
    }
    else{
    image(dinosaur,x,y);
    
    }
    popMatrix();  


  }

  
	// HINT: Player Detection in update()
	/*
	float currentSpeed = speed
	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
	}
	*/
}
