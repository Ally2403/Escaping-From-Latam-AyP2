
//Aquí se encuentran todos los hilos que controlan el uso del mouse dentro del videojuego

//Mouse presionado
void mouseClicked() {
  //Se valida si la pantalla se encuentra en el aparatado de los personajes y luego dependiendo del botón presionado escoge una pantalla u otra
  if (pantalla == 1 || pantalla == 4 || pantalla == 5 || pantalla == 6 || pantalla == 7) {
    if (mouseX > 50 && mouseX< 135 && mouseY > 18 && mouseY < 123) {
      pantalla = 0;
      boton.play(1, vol[1].volume);
    } else if (mouseX > posicionx && mouseX<posicionx + 283 && mouseY >243 && mouseY<293) {
      pantalla = 1;
      seleccionpersonaje = 1;
      boton.play(1, vol[1].volume);
    } else if (mouseX > posicionx + 3 && mouseX<posicionx + 218 && mouseY >336 && mouseY<387) {
      pantalla = 4;
      seleccionpersonaje = 2;
      boton.play(1, vol[1].volume);
    } else if (mouseX > posicionx + 3 && mouseX<posicionx + 321 && mouseY >428 && mouseY<483) {
      pantalla = 5;
      seleccionpersonaje = 3;
      boton.play(1, vol[1].volume);
    } else if (mouseX > posicionx + 1 && mouseX<posicionx + 321 && mouseY >521 && mouseY<571) {
      pantalla = 6;
      seleccionpersonaje = 4;
      boton.play(1, vol[1].volume);
    } else if (mouseX > posicionx + 3 && mouseX<posicionx + 149 && mouseY >612 && mouseY<663) {
      pantalla = 7;
      seleccionpersonaje = 5;
      boton.play(1, vol[1].volume);
    } else if (mouseX > 32 && mouseX<430 && mouseY >707 && mouseY<764) {
      pantalla = 8;
      boton.play(1, vol[1].volume);
      sw.restart();
      tiempoInicio1 = millis();
    }
  } else if (pantalla == 2) {
    //How to play
    if (mouseX > 18 && mouseX< 104 && mouseY > 20 && mouseY < 128) {
      pantalla = 0;
      boton.play(1, vol[1].volume);
    }
  } else if (pantalla == 3) {
    //Credits
    if (mouseX > 54 && mouseX< 138 && mouseY > 22 && mouseY < 118) {
      pantalla = 0;
      boton.play(1, vol[1].volume);
    }
  } else if (pantalla == 9) {
    //Settings
    if (mouseX > 52 && mouseX< 140 && mouseY > 8 && mouseY < 115) {
      pantalla = 0;
      boton.play(1, vol[1].volume);
    }
  }
  //Pantalla inicial
  if (pantalla == 0) {
    if (mouseX > 70 && mouseX<553 && mouseY >337 && mouseY<405) {
      pantalla = 1;
      boton.play(1, vol[1].volume);
    } else if (mouseX > 70 && mouseX <600 && mouseY >429 && mouseY<504) {
      pantalla = 2;
      boton.play(1, vol[1].volume);
    } else if (mouseX > 70 && mouseX < 410 && mouseY > 519 && mouseY <586) {
      pantalla = 3;
      creditscount = 1;
      boton.play(1, vol[1].volume);
    } else if (mouseX > 70 && mouseX < 458 && mouseY > 610 && mouseY <685) {
      pantalla = 9;
      boton.play(1, vol[1].volume);
    }
  }


  //Botón restart en menú de muerte
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h && (colision == 0 || colision == -1)) {
    boton.play(1, vol[1].volume);
    reset();
  }

  //Botón de exit en menú de muerte
  if (mouseX > 695 && mouseX < 695 + 180 && mouseY > 580 && mouseY < 580 + 57 && (colision == 0 || colision == -1) && pantalla == 8) {
    boton.play(1, vol[1].volume);
    reset();
    pantalla = 0;
  }

  //Botón de continuar en menu de pausa
  if (mouseX > 555 && mouseX < 555 + 470 && mouseY > 295 && mouseY < 295 + 150 && pausa == true) {
    boton.play(1, vol[1].volume);
    pausa = false;
    sw.resume();
  }

  //Botón de exit
  if (mouseX > 555 && mouseX < 555 + 470 && mouseY > 450 && mouseY < 450 + 150 && (pausa == true || win == true) && pantalla == 8) {
    boton.play(1, vol[1].volume);
    reset();
    pantalla = 0;
    pausa = false;
  }

  //Botón play again
  if (mouseX > 555 && mouseX < 555 + 470 && mouseY > 295 && mouseY < 295 + 150 && win == true && pantalla == 8) {
    boton.play(1, vol[1].volume);
    win = false;
    reset();
  }
}

//Mouse presionado
void mousePressed() {

  //Verificar si el mouse está sobre el control deslizante del volumen
  if (mouseX > vol[0].sliderX && mouseX < vol[0].sliderX + vol[0].sliderWidth && mouseY > vol[0].sliderY && mouseY < vol[0].sliderY + vol[0].sliderHeight) {
    vol[0].dragging = true;
  }
  if (mouseX > vol[1].sliderX && mouseX < vol[1].sliderX + vol[1].sliderWidth && mouseY > vol[1].sliderY && mouseY < vol[1].sliderY + vol[1].sliderHeight) {
    vol[1].dragging = true;
  }
}

void mouseReleased() {

  //Se suelta el mouse, cambian los volúmenes del juego
  vol[0].dragging = false;
  vol[1].dragging = false;
}

void mouseDragged() {
  //Si se está arrastrando la barra deslizante
  if (vol[0].dragging) {
    //Asigna a ese controlador de volumen el porcentaje escogido para cada sonido y no permite que se salga de los límites
    vol[0].volume = constrain((mouseX - vol[0].sliderX) / vol[0].sliderWidth, 0, 1);
    music.amp(vol[0].volume);
    //amp controla valores de 0 a 1, siendo 0 completo silencio y 1 el volumen máximo
  }
  if (vol[1].dragging) {
    vol[1].volume = constrain((mouseX - vol[1].sliderX) / vol[1].sliderWidth, 0, 1);
    music1.amp(vol[1].volume);
    music2.amp(vol[1].volume);
    music3.amp(vol[1].volume);
    music4.amp(vol[1].volume);
    music5.amp(vol[1].volume);
    recogerbillete.amp(vol[1].volume);
    salto.amp(vol[1].volume);
    golpe.amp(vol[1].volume);
    boton.amp(vol[1].volume);
    atodamadresound.amp(vol[1].volume);
    victoria.amp(vol[1].volume);
  }
}

void mouseMoved() {
  //Verifica si el mouse está sobre algún botón y actualiza el botón resaltado a previsualizar
  if (pantalla == 1 || pantalla == 4 || pantalla == 5 || pantalla == 6 || pantalla == 7) {
    if (mouseX > posicionx && mouseX < posicionx + 283 && mouseY > 243 && mouseY < 293) {
      botonResaltado = 1;
    } else if (mouseX > posicionx + 3 && mouseX < posicionx + 218 && mouseY > 336 && mouseY < 387) {
      botonResaltado = 2;
    } else if (mouseX > posicionx + 3 && mouseX < posicionx + 321 && mouseY > 428 && mouseY < 483) {
      botonResaltado = 3;
    } else if (mouseX > posicionx + 1 && mouseX < posicionx + 321 && mouseY > 521 && mouseY < 571) {
      botonResaltado = 4;
    } else if (mouseX > posicionx + 3 && mouseX < posicionx + 149 && mouseY > 612 && mouseY < 663) {
      botonResaltado = 5;
    } else if (mouseX > 32 && mouseX < 430 && mouseY > 707 && mouseY < 764) {
      botonResaltado = 6;
    } else {
      botonResaltado = -1; //En caso de que no esté sobre ningún botón
    }
  }
}
