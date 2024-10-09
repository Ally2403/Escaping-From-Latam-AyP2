//Clase de las granadas lanzadas desde los helicópteros
class granada {
  float posinicialx, yinicial;
  float x1 = posinicialx, y1 = yinicial, posx; //Posición de la granada
  float vx, vy; //Velocidades en x y en y
  float g = 0.5; //Gravedad
  float r = 20;
  float friccion = 0.95; //Coeficiente de fricción
  boolean enMovimiento; //Variable para controlar si la granada está en movimiento
  int tiempoAnterior = millis(); //Variable para almacenar el tiempo en que se lanzó la granada anteriormente
  int tiempoEspera = int(random(1000, 4000)); //Tiempo de espera aleatorio antes de lanzar la granada nuevamente

  //Constructor
  granada(int posx, float posinicialx, float yinicial) {
    this.posx = posx;
    this.posinicialx = posinicialx;
    this.yinicial = yinicial;
  }

  void moveGranada() {
    yinicial = yinicial + velheli;
    posx = xpos1 + x1;
    image(granada, xpos1 + x1, y1, r*3, r*3);
    colisiongranada();
    //Si la granada se encuentra en movimiento
    if (enMovimiento) {
      x1 += vx;
      y1 += vy;
      vy += g;

      //Revisa si la granada llega al suelo
      if (y1 + r >= 900-290) {
        y1 = 900-290 - r; //Ajusta la posición para que la granada esté justo en el suelo
        vy = 0; //Detiene el movimiento vertical

        //Aplica fricción al movimiento horizontal
        vx *= friccion;

        //Si la velocidad horizontal es muy baja, detiene la granada
        if (abs(vx) < 0.1) {
          enMovimiento = false;

          //Actualiza el tiempo anterior y el tiempo de espera
          tiempoAnterior = millis();
          tiempoEspera = int(random(1000, 4000));
        }
      }
    }

    //Verifica si ha pasado el tiempo de espera y lanza la granada nuevamente
    if (!enMovimiento && millis() - tiempoAnterior >= tiempoEspera) {
      lanzarBolita(posinicialx+200);
    }
  }

  void lanzarBolita(float posinicialx) {
    //Genera un número aleatorio que determina la dirección del lanzamiento (-1 para izquierda, 1 para derecha)
    float direccion = random(-1, 1);

    //Asigna la velocidad inicial en x en función de la dirección del lanzamiento
    vx = direccion * random(3, 8); //Velocidad aleatoria entre 3 y 8

    //Asigna la velocidad inicial en y
    vy = random(-10, -20); //Velocidad aleatoria entre -10 y -20

    //Reinicia la posición de la granada
    x1 = posinicialx;
    y1 = yinicial;

    //Reinicia la variable del movimiento
    enMovimiento = true;
  }

  //Se verifica la colisión entre la granada y el personaje
  void colisiongranada() {

    //Si no se encuentra en el tiempo en el que puede chocarse sin recibir daño (cooldown)
    if (!invulnerable) {

      //Si colisiona con el objeto
      if (xpos + latinox >= posx &&
        xpos <= posx + r*3 &&
        ypos + latinoy >= y1 &&
        ypos <= y1 + r*3) {
        invulnerable = true; //Activar la invulnerabilidad

        //Cuando colisiona va a saltar ya sea a la derecha o a la izquierda
        saltar();
        if (derecha) {
          xpos = xpos - 150;
        }
        if (izquierda) {
          xpos = xpos + 150;
        }

        //Reduce una vida
        colision = colision - 1;
        //Reinicia la velocidad
        speed = 8;
        speed2 = 12;

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

        //Reinicia la posición de la granada
        x1 = posinicialx;
        y1 = yinicial;

        tiempoColision = millis(); //Actualiza el tiempo desde la última colisión
      }
    }
  }
}
