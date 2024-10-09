
//Aquí se encuentran todos los hilos que manejan las teclas utilizadas en el videojuego

//Tecla presionada
void keyPressed() {
  if (keyCode == RIGHT) {
    derecha = true;
  } else if (keyCode == LEFT) {
    izquierda = true;
  }
  if (keyCode == DOWN) {
    abajo = true;
  }
  //A toda madre
  if (keyCode == ' ') {// Espacio
    spacePressed = true;
    spaceWhileDown = abajo; //Verifica si la tecla de abajo estaba presionada al presionar el espacio
  }
  //Tecla para saltar = espacio
  if (key == ' ' && !saltando && abajo == false && aTodaMadre == false) {
    saltar();
  }
  //Presionar TAB para abrir el menú de pausa
  if (keyCode == TAB) {
    pausa = true;
    //Pausa el tiempo mientras se encuentra en el menú de pausa
    sw.pause();
  }
}

//Tecla soltada
void keyReleased () {
  if (keyCode == RIGHT) {
    derecha = false;
  } else if (keyCode == LEFT) {
    izquierda = false;
  }
  //Combinación de teclas para el movimiento especial A Toda Madre
  if (keyCode == DOWN) {
    abajo = false;
    if (spacePressed && spaceWhileDown) {
      aTodaMadre = true;
      if (!movimiento) {
        //Reproducir sonido de ATodaMadre
        atodamadresound.play(1, vol[1].volume);
        movimiento = true; //Iniciar el movimiento especial
        tiempoInicio = millis(); //Guardar el tiempo de inicio del movimiento especial
      }
    }
  }
  if (keyCode == ' ') { //Espacio ya no está presionado
    spacePressed = false;
  }
}
