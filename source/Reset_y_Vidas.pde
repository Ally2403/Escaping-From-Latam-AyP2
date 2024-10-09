
//Con este procedimiento reiniciamos todas las variables utilizadas en el videojuego para que el jugador pueda volver a jugar
//También se dibujan nuevamente los objetos recolectados
void reset() {
  xpos = 0;
  ypos = 482;
  speed = 8;
  speed2 = 12;
  xpos1 = 0;
  ypos1 = 0;
  colision = 3;
  derecha = false;
  abajo = false;
  izquierda = false;
  arriba = false;
  saltando = false;
  aTodaMadre = false;
  spaceWhileDown = false;
  spacePressed = false;
  pausaelapsed = 0;
  speedboolean = false;
  movimiento = false;
  tiempoInicio = 0;
  yspeed = 0;
  gravity = 1;
  velheli = 2;
  invulnerable = false;
  tiempoInvulnerable = 2000;
  tiempoColision = 0;
  dollars = 0;
  dollarcount = 0;
  muerto = false;
  win = false;
  for (i=0; i<ene.length; i++) {
    ene[i].vivo = true;
  }
  for (i=0; i<bille.length; i++) {
    bille[i].billete = true;
    bille[i].billetes1();
  }
  
  //Reinicia variables de posición final de los objetos especiales
  obj[0].posfinalx =50;
  obj[0].posfinaly = 100;
  obj[1].posfinalx =120;
  obj[1].posfinaly = 100;
  obj[2].posfinalx =190;
  obj[2].posfinaly = 100;
  //Dibujar objetos especiales
  for (i=0; i<obj.length; i++) {
    obj[i].botella1 = true;
    obj[i].botella2 = true;
    obj[i].botella();
  }
  //Reinicia el temporizador
  sw.restart();
  lastTime=0;
}

//Este botón aparece en la pantalla de muerte del personaje
void botonrestart() {
  image(restart1, 0, 0);
  noFill();
  noStroke();
  rect(x, y, w, h);
  //Botón exit en menú restart
  rect(695, 580, 180, 57);
}

//Dibuja los corazones de las vidas
void vidas() {
  vidax = 0;
  for (i=1; i<=colision; i++) {
    vidax = vidax + 60;
    image(vida1, vidax, 40);
  }
}

//Detecta cuando muere y reproduce el sonido de muerte
void muerte() {
  if (colision == 0 && muerto == false) {
    muerte.play(1, vol[1].volume);
    muerto = true;
  }
  if (muerto) {
    muerto = false;
    //Se pone diferente a 0 pero igual muerto para que el sonido no se reproduzca infinitamente
    colision = -1;
  }
}
