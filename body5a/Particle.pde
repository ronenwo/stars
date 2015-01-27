
    
public class Particle
{
  PVector loc = new PVector( random( 0, width ), random( 0, height ), random( -300, -700 ) );
  PVector speed = new PVector();
 
  public Particle()
  {
 
  }
 
  public void update()
  {
    if( keyPressed )
    {
      PVector dir = new PVector( width / 2 + random(-100,100), height / 2 + random(-h*1.1) , -500 );
      dir.sub( loc );
      dir.normalize();
      speed.add( dir );
      PVector dir1 = new PVector( width / 2 + random(-100,100), height / 2 + random(-h*1.25) , -500 );
      dir1.sub( loc );
      dir1.normalize();
      speed.add( dir1 );
      PVector dir2 = new PVector( width / 2 + random(-100,100), height / 2 + random(-h*1.35) , -500 );
      dir2.sub( loc );
      dir2.normalize();
      speed.add( dir2 );
    }
    else
    {
      speed.mult( .9 );
    }
    loc.add( speed );
    pLayer.pushMatrix();
    pLayer.translate( loc.x, loc.y, loc.z );
//    rotateToFace( loc );
    pLayer.noStroke();
    pLayer.rect(0,0,size,size);
//    pLayer.beginShape( QUADS );
//    pLayer.vertex( -size, -size, 0 );
//    pLayer.vertex( size, -size, 0 );
//    pLayer.vertex( size, size, 0 );
//    pLayer.vertex( -size, size, 0 );
//    pLayer.endShape();
    pLayer.popMatrix();
  }
}
 
// O is your object's position
// P is the position of the object to face
// U is the nominal "up" vector (typically Vector3.Y)
// Note: this does not work when O is straight below or straight above P
PVector U = new PVector( 0, 1, 0 );
void rotateToFace( PVector P )
{
  PVector D = new PVector( );
  D.set( O );
  D.sub( P );
  PVector Right = U.cross( D );
  Right.normalize();
  PVector Backwards = Right.cross( U );
  Backwards.normalize();
  PVector Up = Backwards.cross( Right );
  pLayer.applyMatrix(Right.x, Right.y, Right.z, 0, Up.x, Up.y, Up.z, 0, Backwards.x, Backwards.y, Backwards.z, 0, 0, 0, 0, 1);
}

