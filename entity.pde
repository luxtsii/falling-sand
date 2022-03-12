class Entity {
  
  public int x;
  public int y;
  public int id;
  public boolean moved = false;
  public color colour;
  public float weight;
  
  public Entity(int x, int y, int id, color colour, float weight){
     stroke(colour);
     point(x, y);
     
     this.x = x;
     this.y = y;
     this.id = id;
     this.colour = colour;
     this.weight = weight;
  }
  
  void setID(int id){
    this.id = id;
    
    if (id == 1){
      this.colour = #856100;
      this.weight = 0.8f;
    }
    else if (id == 2){
      this.colour = #10b6e8;
      this.weight = 0.2f;
    }
    else if (id == 3){
      this.colour = #ADB6B5;
      this.weight = 0.9f;
    }
    else {
      this.colour = color(0,0,0,0);
      this.weight = 0f;
    }
  }
}
