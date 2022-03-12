Entity[][] entityList;
boolean held;

void setup(){
  size(200, 200);
  
  frameRate(30);

  
  entityList = new Entity[width][height];
  
  for (int x = 0; x < width; x = x+1) {
      for (int y = 0; y < height; y = y+1) {
        entityList[x][y] = new Entity(x, y, 0, color(0,0,0,0), 0);
    }
  }
}

void draw(){ 
  


  
  background(255);
  
  fill(0, 0, 0, 255);
  text(frameRate, 5, 20); 

  drawHeld();
  physics();
  
    for (int x = 0; x < width; x = x+1) {
      for (int y = 0; y < height; y = y+1) {

        if (entityList[x][y].id == 1){
         stroke(entityList[x][y].colour);
         point(x, y); 
        } else if (entityList[x][y].id == 2){
         stroke(entityList[x][y].colour);
         point(x, y); 
        } else if (entityList[x][y].id == 3){
         stroke(entityList[x][y].colour);
         point(x, y); 
        }
    }
    

    
  }
}

void drawHeld()
{
  if (held){
      try {
        if (entityList[mouseX][mouseY].id == 0 && entityList[mouseX + 1][mouseY + 1].id == 0 && entityList[mouseX + 1][mouseY].id == 0 && entityList[mouseX][mouseY + 1].id == 0) {
          if (mouseButton == LEFT){
            entityList[mouseX][mouseY].setID(1);
            entityList[mouseX + 1][mouseY + 1].setID(1);
            entityList[mouseX + 1][mouseY].setID(1);
            entityList[mouseX][mouseY + 1].setID(1);
          }
          else if (mouseButton == RIGHT) {
            entityList[mouseX][mouseY].setID(2);
            entityList[mouseX + 1][mouseY + 1].setID(2);
            entityList[mouseX + 1][mouseY].setID(2);
            entityList[mouseX][mouseY + 1].setID(2);
          }
          else if (mouseButton == CENTER) {
            entityList[mouseX][mouseY].setID(3);
            entityList[mouseX + 1][mouseY + 1].setID(3);
            entityList[mouseX + 1][mouseY].setID(3);
            entityList[mouseX][mouseY + 1].setID(3);
          }
        }
        else if (entityList[mouseX][mouseY].id == 0){
          if (mouseButton == LEFT)
            entityList[mouseX][mouseY].setID(1);
          else if (mouseButton == RIGHT)
            entityList[mouseX][mouseY].setID(2);
          else if (mouseButton == CENTER)
            entityList[mouseX][mouseY].setID(3);
          }
          
         
      }
      catch (Exception e)
        {
    
        }
    }
}

void mousePressed() {
  held = true;
}
  
void mouseReleased() {
  held = false;
}

void physics(){
  // reset all pixels to not moved
    for (int x = 0; x < width; x = x+1) {
     for (int y = 0; y < (height - 1); y = y+1) {
       entityList[x][y].moved = false;
     }
    }
  
    // loop over each pixel, do all fancy checks in here
    //for (int x = 0; x < width; x = x+1) {
    // for (int y = 0; y < (height - 1); y = y+1) {
      
    for (int x = (width - 1); x > -1; x -= 1) {
     for (int y = (height - 1); y > -1; y -= 1) {       
       // if it has moved during this physics sesh, skip it
        if (entityList[x][y].moved == true)
          continue;
          
         // if it contains any pixel
         if (entityList[x][y].id != 0){
           
           switch(entityList[x][y].id){
             case 1:
               // DIRT
               regularFalling(x, y);
               break;
             case 2:
               // WATER
               liquidFalling(x, y);
               break;
             case 3:
             // STONE
               regularFalling(x, y);
              
               
               
           }
         }
     }
    }
  
}

void regularFalling(int x, int y){
    if (entityList[x][y + 1].id == 0 || entityList[x][y + 1].weight < entityList[x][y].weight){
      int prev = entityList[x][y + 1].id;
      entityList[x][y + 1].setID(entityList[x][y].id);
      entityList[x][y + 1].moved = true;
      entityList[x][y].setID(prev);
    } else if (x + 1 != width){
      if (entityList[x + 1][y + 1].id == 0 || entityList[x + 1][y + 1].weight < entityList[x][y].weight) {
        int prev = entityList[x + 1][y + 1].id;
        entityList[x + 1][y + 1].setID(entityList[x][y].id);
        entityList[x + 1][y + 1].moved = true;
        entityList[x][y].setID(prev);
      } else if (x - 1 != -1){
      if (entityList[x - 1][y + 1].id == 0 || entityList[x - 1][y + 1].weight < entityList[x][y].weight){
        int prev = entityList[x - 1][y + 1].id;
        entityList[x - 1][y + 1].setID(entityList[x][y].id);
        entityList[x - 1][y + 1].moved = true;
        entityList[x][y].setID(prev);
      }
    }
  }
}

void liquidFalling(int x, int y){
  // FALL BELOW
    if (entityList[x][y + 1].id == 0 || entityList[x][y + 1].weight < entityList[x][y].weight){
      int prev = entityList[x][y + 1].id;
      entityList[x][y + 1].setID(entityList[x][y].id);
      entityList[x][y + 1].moved = true;
      entityList[x][y].setID(prev);
    } 
    else if (x + 1 != width)
    {
      // FALL BELOW RIGHT
      if (entityList[x + 1][y + 1].id == 0 || entityList[x + 1][y + 1].weight < entityList[x][y].weight) {
        int prev = entityList[x + 1][y + 1].id;
        entityList[x + 1][y + 1].setID(entityList[x][y].id);
        entityList[x + 1][y + 1].moved = true;
        entityList[x][y].setID(prev);
      } 
      else if (x - 1 != -1)
      {
        // FALL BELOW LEFT
        if (entityList[x - 1][y + 1].id == 0 || entityList[x - 1][y + 1].weight < entityList[x][y].weight){
          int prev = entityList[x - 1][y + 1].id;
          entityList[x - 1][y + 1].setID(entityList[x][y].id);
          entityList[x - 1][y + 1].moved = true;
          entityList[x][y].setID(prev);
        } 
        else 
        {
          int dir;
          if (entityList[x + 1][0].id == 0 ^ entityList[x - 1][0].id == 0){
            if (entityList[x + 1][0].id == 0){
              dir = 1;
            } else {
              dir = -1;
            }
          } else {
            dir = int(random(-2, 2));
          }
          
          
          if (dir == 0)
            return;
          
          if (entityList[x + dir][y].id == 0)
          {
            int prev = entityList[x + dir][y].id;
            entityList[x + dir][y].setID(entityList[x][y].id);
            entityList[x + dir][y].moved = true;
            entityList[x][y].setID(prev);
          }
        }
      }
  }
}
