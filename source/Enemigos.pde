//Clase de los policías
class enemigos {
  float posX;
  int posY;
  int leftLimit;
  int rightLimit;
  boolean right, left = true, vivo=true;
  float speed1 = 2;

  //Constructor
  //Se les da una posición en x y en y, un límite a la izquierda y uno a la derecha para desplazarse
  enemigos(float posX, int posY, int leftLimit, int rightLimit) {
    this.posX = posX;
    this.posY = posY;
    this.leftLimit = leftLimit;
    this.rightLimit = rightLimit;
  }

  void enemigos3() {
    //Los enemigos desaparecerán si son asesinados con el movimiento especial ATodaMadre
    if (aTodaMadre) {
      if (xpos + latinox >= xpos1 + posX &&
        xpos <= xpos1 + posX + imgLeft.width &&
        ypos + latinoy >= posY &&
        ypos <= posY + imgLeft.height) {
        //Se reproduce el sonido de golpe
        golpe.play(1, vol[1].volume);
        vivo = false;
      }
    } else {
      //Si no lo toca con el movimiento de ATodaMadre, detecta la colisión
      obstaculos1(xpos1 + posX, posY, tamx, tamy);
    }

    //Actualizar la posición x sumando la velocidad individual de los enemigos
    posX += speed1;

    //Verifica si el enemigo se encuentra justo en los límites
    if (posX >= rightLimit || posX <= leftLimit) {
      // Cambiar la imagen y la dirección de movimiento
      if (posX >= rightLimit) {
        posX = rightLimit;
        image(imgRight, xpos1 + posX, ypos);
        right = true;
        left = false;
      } else if (posX <= leftLimit) {
        posX = leftLimit;
        image(imgLeft, xpos1 + posX, ypos);
        right = false;
        left = true;
      }
      speed1 *= -1; //Cambiar la dirección de movimiento
    } else {
      //Dibujar la imagen en su posición actual
      if (left) {
        image(imgLeft, xpos1 + posX, posY);
      } else if (right) {
        image(imgRight, xpos1 + posX, posY);
      }
    }
  }
}
