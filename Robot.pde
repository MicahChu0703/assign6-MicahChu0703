class Robot extends Enemy{
	// Requirement #5: Complete Dinosaur Class
  float speed = 2f;
  int direction;
  Laser laser = new Laser();
  Robot(float x,float y){
   super(x,y); 
  }
  
    void update(){
    x += speed;
    if(x >= width-w || x<0) {
    speed *=-1 ;}
    if(abs(player.row*SOIL_SIZE-y)<=PLAYER_DETECT_RANGE_ROW*SOIL_SIZE){
    if(player.x<x && direction==LEFT||player.x>x && direction==RIGHT){speed=0;    
    laser.fire(x+HAND_OFFSET_X_FORWARD,y+HAND_OFFSET_Y,player.x,player.y); 
    }
    }
    else{speed=(speed>0)?2f:-2f;}
    laser.update();  

    
  }
  void display(){
    if(speed==0 && x<player.x){direction=RIGHT;}
    if(speed > 0 ){direction=RIGHT;}
    if(speed < 0 ){direction=LEFT;}
    pushMatrix();
    if (direction == LEFT){
    translate(x+w,y);
    scale(-1,1);
    image(robot,0,0);
    }
    else{
    image(robot,x,y);
    
    }
    popMatrix();  
    laser.display();



  }
  
	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;

	// HINT: Player Detection in update()
	/*

	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )

	boolean checkY = player is less than (or equal to) 2 rows higher or lower than me

	if(checkX AND checkY){
		Is laser's cooldown ready?
			True  > Fire laser from my hand!
			False > Don't do anything
	}else{
		Keep moving!
	}

	*/
}
