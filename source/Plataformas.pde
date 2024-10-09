//Clase de las plataformas sobre las que el personaje puede caminar
class plataformas {
  int xposplat, yposplat, platx, platy;

  //Constructor
  plataformas(int xposplat, int yposplat, int platx, int platy) {
    this.xposplat = xposplat;
    this.yposplat = yposplat;
    this.platx = platx;
    this.platy = platy;
  }

  void plataformas1() {
    //Si el personaje está sobre una plataforma se actualiza su posición en Y y es capaz de saltar sobre ella
    noFill();
    noStroke();
    rect(xposplat + xpos1, yposplat, platx, platy);
    if (ypos >= yposplat - latinoy && xpos + latinox >= xposplat + xpos1 && xpos <= xposplat + xpos1 + platx) {
      ypos = yposplat - latinoy;
      yspeed = 0;
      saltando = false;
    } else { //Si el personaje toca el suelo
      nosaltar();
    }
  }
}
