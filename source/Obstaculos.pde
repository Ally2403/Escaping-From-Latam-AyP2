//Clase obstáculos
class obstaculos {
  int yposobjeto1, objetox1, objetoy1;
  float xposobjeto1;

  //Constructor
  obstaculos(float xposobjeto1, int yposobjeto1, int objetox1, int objetoy1) {
    this.xposobjeto1 = xposobjeto1;
    this.yposobjeto1 = yposobjeto1;
    this.objetox1 = objetox1;
    this.objetoy1 = objetoy1;
  }
  void obstaculos1() {
    noFill();
    noStroke();
    if (!invulnerable) {
      rect(xposobjeto1 + xpos1, yposobjeto1, objetox1, objetoy1);

      //Detecta si el personaje colisiona con un objeto
      if (xpos + latinox >= xposobjeto1 + xpos1 &&
        xpos <= xposobjeto1 + xpos1 + objetox1 &&
        ypos + latinoy >= yposobjeto1 &&
        ypos <= yposobjeto1 + objetoy1) {
        invulnerable = true; //Activar la invulnerabilidad

        //Cuando colisiona va a saltar ya sea a la derecha o a la izquierda
        saltar();
        if (derecha) {
          xpos = xpos - 150;
        }
        if (izquierda) {
          xpos = xpos + 150;
        }

        colision = colision - 1;
        //Le quita una vida
        speed = 8;
        speed2 = 12;
        //Reinicia la velocidad del personaje

        //Dependiendo del personaje reproduce su sonido característico si no es la última vida que le queda
        if (op == 1 && colision != 0) {
          music1.play(1, vol[1].volume);
        } else if (op == 2 && colision != 0) {
          music2.play(1, vol[1].volume);
        } else if (op == 3 && colision != 0) {
          music3.play(1.8, vol[1].volume);
        } else if (op == 4 && colision != 0) {
          music4.play(1, vol[1].volume);
        } else if (op == 5 && colision != 0) {
          music5.play(1, vol[1].volume);
        }

        tiempoColision = millis(); //Actualizar el tiempo de la última colisión
      }
    }
  }
}

//Este procedimiento sirve para evaluar las colisiones de los enemigos
void obstaculos1(float xposobjeto1, int yposobjeto1, int objetox1, int objetoy1) {
  noFill();
  noStroke();
  if (!invulnerable) {

    //Detecta si el personaje colisiona con un objeto
    rect(xposobjeto1, yposobjeto1, objetox1, objetoy1);
    if (xpos + latinox >= xposobjeto1 &&
      xpos <= xposobjeto1 + objetox1 &&
      ypos + latinoy >= yposobjeto1 &&
      ypos <= yposobjeto1 + objetoy1) {
      invulnerable = true; //Activar la invulnerabilidad

      //Cuando colisiona va a saltar ya sea a la derecha o a la izquierda
      saltar();
      if (derecha) {
        xpos = xpos - 150;
      }
      if (izquierda) {
        xpos = xpos + 150;
      }
      colision = colision - 1;
      //Le quita una vida
      speed = 8;
      speed2 = 12;
      //Reinicia la velocidad del personaje

      //Dependiendo del personaje reproduce su sonido característico si no es la última vida que le queda
      if (op == 1 && colision != 0) {
        music1.play(1, vol[1].volume);
      } else if (op == 2 && colision != 0) {
        music2.play(1, vol[1].volume);
      } else if (op == 3 && colision != 0) {
        music3.play(1.8, vol[1].volume);
      } else if (op == 4 && colision != 0) {
        music4.play(1, vol[1].volume);
      } else if (op == 5 && colision != 0) {
        music5.play(1, vol[1].volume);
      }

      tiempoColision = millis(); //Actualizar el tiempo de la última colisión
    }
  }
}
