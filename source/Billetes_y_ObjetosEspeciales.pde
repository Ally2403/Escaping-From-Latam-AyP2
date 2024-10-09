//Clase que controla todas las interacciones con los billetes generados aleatoriamente
class billetes {
  float dollarPositionsX, dollarPositionsY;
  boolean billete = true;

  //Constructor
  billetes(float dollarPositionsX, int dollarPositionsY) {
    this.dollarPositionsY =  dollarPositionsY;
    this.dollarPositionsX =  dollarPositionsX;
  }
  void billetes1() {
    image(dollar, xpos1 + dollarPositionsX, dollarPositionsY);
    //Si el persobaje se encuentra dentro de las coordenadas del billete es capaz de recogerlo
    if (xpos >= xpos1 + dollarPositionsX - 50 && xpos <= xpos1 + dollarPositionsX + 90 && ypos == dollarPositionsY) {
      //Si presiona la tecla UP
      if (keyCode == UP) {
        //Reproducir sonido al recoger billete
        recogerbillete.play(1, vol[1].volume);
        dollars++; // Incrementar el contador de recogidos
        dollarcount++; //Incrementar contador a reiniciar
        billete = false; //Desaparecer billete
      }
    }
  }
}

//Objetos especiales a conseguir a lo largo del mapa
class objetoespecial {
  float botellax, botellay, posfinalx, posfinaly;
  boolean botella1 = true, botella2 = true;

  //Constructor
  objetoespecial(float botellax, float botellay, float posfinalx, float posfinaly) {
    this.botellax = botellax;
    this.botellay = botellay;
    this.posfinalx = posfinalx;
    this.posfinaly = posfinaly;
  }
  void botella() {
    //Si la botella no se ha recogido
    if (botella1) {
      //Si no ha ganado el juego las dibuja normalmente
      if (win == false) {
        image(botella, xpos1 + botellax, botellay, 70, 90);
        image(botella_negra, posfinalx, posfinaly, 70, 90);
      } else {
        image(botella_negra, posfinalx, posfinaly);
      }
    }
    //Si está dentro de las coordenadas para recoger la botella puede recogerla
    if (xpos >= xpos1 + botellax - 50 && xpos <= xpos1 + botellax + 100 && ypos == botellay) {
      if (keyCode == UP) {
        //Si recoge la botella
        //Reproducir sonido de recoger botella
        recogerbillete.play(1, vol[1].volume);
        botella1 = false; //Recogió la botella y la desaparece
        botella2 = false; //Controla si la botella se dibujará o no en la esquina superior izquierda al ser recogido
      }
    }
  }
}

//Reinicia el contador al llegar a las 10 monedas necesarias para aumentar una vida al jugador para poder seguir recolectando
void dollar_vida() {
  if (dollarcount == 10) {
    dollarcount = 0;
    colision = colision + 1;
  }
}
