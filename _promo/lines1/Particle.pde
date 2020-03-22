// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Simple Particle System

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  boolean active = false;

  Particle(PVector l) {
    acceleration = new PVector(0.0,0.02);//new PVector(0,0.05);
    velocity = new PVector(random(-0.3,0.3),random(-1.5,-0.1));
    position = l.get();
    lifespan = 255.0;
  }

  void run() {
    if( active ){
      update();
    }
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    fill(50,lifespan);
    ellipse(position.x,position.y, 5, 5);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
