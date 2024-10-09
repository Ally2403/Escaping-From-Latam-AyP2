
//Aquí se encuentra todo lo que controla el movimiento del juego, desde el personaje hasta el mapa

//Aumenta la velocidad del personaje cada 15 segundos, tanto en el movimiento normal como en el especial
void aumentoVel() {
  if (sw.getElapsedTime() >= lastTime + 15000 && !speedboolean) {
    speed = speed + 3;
    speed2 = speed2 + 3;
    lastTime = sw.getElapsedTime();
    speedboolean = true;
  } else if (sw.getElapsedTime() < lastTime + 15000) {
    speedboolean = false;
  }
}

//MOVIMIENTO ESPECIAL DEL PERSONAJE: A TODA MADRE
void aTodaMadre() {
  if (movimiento) {
    //El movimiento solo dura 1 segundo
    if (millis() - tiempoInicio >= 1000) {
      movimiento = false; //Detener el movimiento
      aTodaMadre = false;
    } else if (!izquierda && aTodaMadre == true && !invulnerable) {
      //Si la combinación de teclas apropiada fue realizada se muestra la animación del personaje seleccionado en su forma de movimiento especial
      switch(op) {
      case 1:
        image(atodamadre1, xpos, ypos-40);
        break;
      case 2:
        image(atodamadre2, xpos, ypos-40);
        break;
      case 3:
        image(atodamadre3, xpos, ypos-40);
        break;
      case 4:
        image(atodamadre4, xpos, ypos-40);
        break;
      case 5:
        image(atodamadre5, xpos, ypos-40);
        break;
      }
      aTodaMadre = true;

      //Utiliza la velocidad incrementada del movimiento especial
      xpos1 = xpos1 - speed2;
      xpos = xpos + speed2;
    } else {
      aTodaMadre = false;
    }
  }
}

//Movimiento del mapa = contrario al movimiento del personaje
void movemapa() {
  if (derecha) {
    xpos1 = xpos1 - speed;
  }
  if (izquierda && xpos1 != 0) {
    xpos1 = xpos1 + speed;
  }
  //Hasta donde llegará el movimiento del mapa
  xpos1 = constrain(xpos1, -23700, 0);

  //La variable xpos1 controla todo el movimiento del mapa y cualquier posición asociada a esta se moverá de la misma manera
  //Ejemplo: plataformas, billetes, granadas
}

//Movimiento del personaje
void movelatino() {

  if (derecha) {
    xpos = xpos + speed;
  }
  if (izquierda) {
    xpos = xpos - speed;
  }
  if (abajo) {
    ypos = ypos + speed;
  }
  gravedad();

  //Dibujar plataformas sobre las que el personaje se moverá
  for (i=0; i<plat.length; i++) {
    plat[i].plataformas1();
  }

  //Límites de la pantalla por los cuales se puede mover el personaje
  xpos = constrain(xpos, 100, 700);
  ypos = constrain(ypos, 0, 900-400);

  //xpos y ypos controlan el movimiento del personaje y ayudarán a comprobar también las colisiones
}

//Cuando se ejecuta este procedimiento el personaje salta
void saltar() {
  yspeed = -25;
  saltando = true;
  if (!invulnerable) {
    //Reproduce el sonido de salto
    salto.play(1, vol[1].volume);
  }
}

void nosaltar() {
  if (ypos >= 900-400) { //Si el personaje toca el suelo
    ypos = 900-400;
    yspeed = 0;
    saltando = false;
  }
}

//Gravedad que se le aplica al salto
void gravedad() {
  if (!saltando && ypos >= 900-400) {
    yspeed = 0;
    saltando = false;
  } else {
    yspeed += gravity;
  }
  ypos += yspeed;
}

//Si el personaje llega a las coordenadas que limitan el final del mapa, este gana
void ganador() {
  //límite para ganar -22000
  if (xpos1 <= -22000) {
    win = true;
    //Reproduce el sonido de victoria
    victoria.play(1, vol[1].volume);
    xpos1 = -100;
  }
}
