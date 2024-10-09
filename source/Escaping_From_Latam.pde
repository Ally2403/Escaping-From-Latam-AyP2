import gifAnimation.*;
import processing.sound.*;
import processing.video.*;
int op; // Variable que controla los personajes

//Imágenes y fuente
PImage fondo, mapa, vida1, helicoptero, restart1, latino2, granada, pausa1, dollar, desaparecer, latino5, latino8, latino11, latino14, botella, botella_negra, victoria1, victoriaChoice, meta;
PImage principal, personajes, como_jugar, argentina, configuracion, botonback;
PImage mexico, venezuela, peru, letsgo, trump;
PImage previc, previm, previa, previv, previp;
PFont font;

//Interfaz
int pantalla = 0, pantalla1 = 0;
int botonResaltado = -1;
int posicionx = 122;
int seleccionpersonaje = 1;
int tiempoInicio1;
int duracion = 2000, creditscount = 0;

//Variables personaje y fondo
int xpos = 0, ypos = 482, speed = 8, speed2 = 12, latinox, latinoy;
int xpos1 = 0, ypos1 = 0, colision = 3, i, vidax;
boolean derecha = false, abajo = false, izquierda = false, arriba = false, saltando = false, aTodaMadre = false;
boolean spaceWhileDown = false;
boolean spacePressed = false;
int lastTime; // Último tiempo en el que se aumentó la velocidad
int pausaelapsed = 0;
boolean speedboolean = false;
boolean muerto = false;
boolean win = false;
boolean movimiento = false; // Variable para controlar el movimiento
long tiempoInicio = 0; // Variable para almacenar el tiempo de inicio del movimiento

//Botón restart
int x = 630; // Coordenada x del botón
int y = 515; // Coordenada y del botón
int w = 310; // Ancho del botón
int h = 55;  // Alto del botón

//Plataformas
int platy, platx, yposplat, xposplat;
float yspeed = 0, gravity = 1;

//Helicóptero
int velheli = 2;

//Enemigos
int tamx, tamy;

//Pausa
boolean pausa;

//Vulnerabilidad de colisión
boolean invulnerable = false;
int tiempoInvulnerable = 2000; // Duración de la invulnerabilidad en milisegundos
int tiempoColision = 0; // Variable para almacenar el tiempo en que ocurrió la última colisión

//Billetes
int dollars = 0;
int dollarcount = 0;

//Gifs personajes con la librería gifAnimation
Gif latino, latino1, imgLeft, imgRight, atodamadre1, atodamadre2, atodamadre3, atodamadre4, atodamadre5, latino3, latino4, latino6, latino7, latino9, latino10, latino12, latino13, personajec, personajem, personajea, personajev, personajep;

//Intancio las clases a usar en el videojuego junto con su tamaño
Timer sw;
enemigos[] ene = new enemigos[18];
billetes[] bille = new billetes[42];
granada[] gran = new granada[14];
helicoptero[] heli = new helicoptero[7];
obstaculos[] obst = new obstaculos[20];
plataformas[] plat = new plataformas[5];
volumen[] vol = new volumen[2];
objetoespecial[] obj = new objetoespecial[3];

//Sonidos con la librería processing.sound y Videos con la librería processing.video
SoundFile music, music1, music2, music3, music4, music5, recogerbillete, salto, golpe, boton, atodamadresound, muerte, victoria;
Movie creditos1, pantallainicio;

void setup() {
  size(1580, 900);

  //CONFIGURACIONES DE IMÁGENES, PERSONAJES Y FONDO
  fondo = loadImage("fondo juego.png");
  fondo.resize(width, height);
  mapa = loadImage("mapa.png");
  mapa.resize(24000, 900);
  vida1 = loadImage("vida.png");
  vida1.resize(50, 50);
  helicoptero = loadImage("Helicoptero.png");
  helicoptero.resize(446, 190);
  restart1 = loadImage("restart.png");
  restart1.resize(width, height);
  granada = loadImage("granada.png");
  granada.resize(100, 110);
  pausa1 = loadImage("pausa.png");
  pausa1.resize(470, 306);
  dollar = loadImage("dollar.png");
  dollar.resize(80, 70);
  botella = loadImage("botella.png");
  botella_negra = loadImage("botella negra.png");
  botella_negra.resize(botella.width, botella.height);
  victoria1 = loadImage("victoria.png");
  victoria1.resize(width, height);
  victoriaChoice = loadImage("victoriaChoice.png");
  victoriaChoice.resize(470, 306);
  principal = loadImage("InicialScreen.png");
  principal.resize(width, height);
  personajes = loadImage("/Data/Seleccion_de_jugadores.jpg");
  personajes.resize(width, height);
  mexico = loadImage("/Data/Seleccion_de_mexico.jpg");
  mexico.resize(width, height);
  argentina = loadImage("/Data/Seleccion_de_argentina.jpg");
  argentina.resize(width, height);
  venezuela = loadImage("/Data/Seleccion_de_venezuela.jpg");
  venezuela.resize(width, height);
  peru = loadImage("/Data/Seleccion_de_peru.jpg");
  peru.resize(width, height);
  personajec = new Gif(this, "Colombia.gif");
  personajec.play();
  personajem = new Gif(this, "Mexico.gif");
  personajem.play();
  personajea = new Gif(this, "Argentina-Messi.gif");
  personajea.play();
  personajev = new Gif(this, "Venezuela.gif");
  personajev.play();
  personajep = new Gif(this, "Peru.gif");
  personajep.play();
  como_jugar = loadImage("/Data/how_to_play.png");
  como_jugar.resize(width, height);
  letsgo = loadImage("/Data/Let's_go.jpg");
  letsgo.resize(width, height);
  previc = loadImage("/Data/Columbia.jpg");
  previc.resize(380, 96);
  previm = loadImage("/Data/Mechico.jpg");
  previm.resize(320, 80);
  previa = loadImage("/Data/Arjentina.jpg");
  previa.resize(380, 83);
  previv = loadImage("/Data/Venezuela11.jpg");
  previv.resize(380, 83);
  previp = loadImage("/Data/Penu.jpg");
  previp.resize(230, 75);
  configuracion = loadImage("/Data/configuracion.jpg");
  configuracion.resize(width, height);
  meta = loadImage("meta.png");
  meta.resize(200, 300);
  trump = loadImage("trump.png");
  trump.resize(300, 280);
  botonback = loadImage("botonback.png");

  creditos1 = new Movie(this, "creditos.mp4");
  pantallainicio = new Movie(this, "Gameplay.mp4");

  //CONFIGURACIONES DE LOS PERSONAJES

  //Colombia
  latino3 = new Gif(this, "latino7.gif");
  latino3.play();
  latino4 = new Gif(this, "latino8.gif");
  latino4.play();
  latino5 = loadImage("latino9.png");
  //Mexico
  latino = new Gif(this, "latino5.gif");
  latino.play();
  latino1 = new Gif(this, "latino4.gif");
  latino1.play();
  latino2 = loadImage("latino6.png");
  //Argentina
  latino6 = new Gif(this, "latino10.gif");
  latino6.play();
  latino7 = new Gif(this, "latino11.gif");
  latino7.play();
  latino8 = loadImage("latino12.png");
  //Venezuela
  latino9 = new Gif(this, "latino13.gif");
  latino9.play();
  latino10 = new Gif(this, "latino14.gif");
  latino10.play();
  latino11 = loadImage("latino15.png");
  //Peru
  latino12 = new Gif(this, "latino16.gif");
  latino12.play();
  latino13 = new Gif(this, "latino17.gif");
  latino13.play();
  latino14 = loadImage("latino18.png");
  latinox = latino.width;
  latinoy = latino.height;

  //Movimiento especial de los personajes
  atodamadre1 = new Gif(this, "atodamadre1.gif");
  atodamadre1.play();
  atodamadre2 = new Gif(this, "atodamadre2.gif");
  atodamadre2.play();
  atodamadre3 = new Gif(this, "atodamadre3.gif");
  atodamadre3.play();
  atodamadre4 = new Gif(this, "atodamadre4.gif");
  atodamadre4.play();
  atodamadre5 = new Gif(this, "atodamadre5.gif");
  atodamadre5.play();

  //CONFIGURACIONES DE LA FUENTE
  font = createFont("PressStart2P.ttf", 96);
  textFont(font);

  //CONFIGURACIONES DEL TIMER
  sw = new Timer();
  sw.start();

  //CONFIGURACIONES ENEMIGOS Y CREACIÓN DE OBJETOS
  imgLeft = new Gif(this, "Policia1.gif");
  imgLeft.play();
  imgRight = new Gif(this, "Policia.gif");
  imgRight.play();
  tamy = imgLeft.height;
  tamx = imgLeft.width;

  //                                 posx                         posy     limizquieda limderecha
  ene[0] = new enemigos(random(2905, 3685-imgLeft.width), 470-imgLeft.height, 2905, 3685-imgLeft.width);
  ene[1] = new enemigos(random(3815, 4855-imgLeft.width), 470-imgLeft.height, 3815, 4855-imgLeft.width);
  ene[2] = new enemigos(random(5132, 6732-imgLeft.width), 654-imgLeft.height, 5132, 6732-imgLeft.width);
  ene[3] = new enemigos(random(16150, 18579-imgLeft.width), 654-imgLeft.height, 16150, 18579-imgLeft.width);
  ene[4] = new enemigos(random(16150, 18579-imgLeft.width), 654-imgLeft.height, 16150, 18579-imgLeft.width);
  ene[5] = new enemigos(random(18681, 20086-imgLeft.width), 470-imgLeft.height, 18681, 20086-imgLeft.width);
  ene[6] = new enemigos(random(20641+imgLeft.width, 21570-imgLeft.width), 654-imgLeft.height, 20641+imgLeft.width, 21570-imgLeft.width);
  ene[7] = new enemigos(random(21703, 23200-imgLeft.width), 654-imgLeft.height, 21703, 23200-imgLeft.width);
  ene[8] = new enemigos(random(5132, 6732-imgLeft.width), 654-imgLeft.height, 5132, 6732-imgLeft.width);
  ene[9] = new enemigos(random(7180, 8759-imgLeft.width), 470-imgLeft.height, 7180, 8759-imgLeft.width);
  ene[10] = new enemigos(random(7180, 8759-imgLeft.width), 470-imgLeft.height, 7180, 8759-imgLeft.width);
  ene[11] = new enemigos(random(7180, 8759-imgLeft.width), 470-imgLeft.height, 7180, 8759-imgLeft.width);
  ene[12] = new enemigos(random(13677, 14708-imgLeft.width), 470-imgLeft.height, 13677, 14708-imgLeft.width);
  ene[13] = new enemigos(random(13677, 14708-imgLeft.width), 470-imgLeft.height, 13677, 14708-imgLeft.width);
  ene[14] = new enemigos(random(14848, 16016-imgLeft.width), 654-imgLeft.height, 14848, 16016-imgLeft.width);
  ene[15] = new enemigos(random(14848, 16016-imgLeft.width), 654-imgLeft.height, 14848, 16016-imgLeft.width);
  ene[16] = new enemigos(random(10513, 11390-imgLeft.width), 470-imgLeft.height, 10513, 11390-imgLeft.width);
  ene[17] = new enemigos(random(18681, 20086-imgLeft.width), 470-imgLeft.height, 18681, 20086-imgLeft.width);

  //CONFIGURACIONES DEL VOLUMEN, SONIDO Y CREACIÓN DE OBJETOS
  music = new SoundFile(this, "Cancion Juego.mp3");
  music1 = new SoundFile(this, "Sonido Colombiano.mp3");
  music2 = new SoundFile(this, "Sonido Mexicano.mp3");
  music3 = new SoundFile(this, "Sonido Argentino.mp3");
  music4 = new SoundFile(this, "Sonido Venezolano.mp3");
  music5 = new SoundFile(this, "Sonido Peruano.mp3");
  recogerbillete = new SoundFile(this, "Recoger billete.mp3");
  salto = new SoundFile(this, "Sonido Salto.mp3");
  golpe = new SoundFile(this, "Sonido Golpe.mp3");
  boton = new SoundFile(this, "Sonido boton.mp3");
  atodamadresound = new SoundFile(this, "Sonido Atodamadre.mp3");
  muerte = new SoundFile(this, "Sonido Muerte.mp3");
  victoria = new SoundFile(this, "Sonido Victoria.mp3");
  music.loop();
  vol[0] = new volumen(0.1, 680, 100, 200, 50, false);
  music.amp(vol[0].volume);

  vol[1] = new volumen(0.1, 680, 220, 200, 50, false);
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
  muerte.amp(vol[1].volume);
  victoria.amp(vol[1].volume);

  //CONFIGURACIONES BILLETES Y OBJETOS ESPECIALES Y CREACIÓN DE OBJETOS
  //                    limizquierda  limderecha          posy
  bille[0] = new billetes(random(100, 1200-dollar.width), 500);
  bille[1] = new billetes(random(100, 1200-dollar.width), 500);
  bille[2] = new billetes(random(100, 1200-dollar.width), 500);
  bille[3] = new billetes(random(1330, 2850-dollar.width), 500);
  bille[4] = new billetes(random(1330, 2850-dollar.width), 500);
  bille[5] = new billetes(random(1330, 2850-dollar.width), 500);
  bille[6] = new billetes(random(2900, 3680-dollar.width), 318);
  bille[7] = new billetes(random(2900, 3680-dollar.width), 318);
  bille[8] = new billetes(random(3800, 4850-dollar.width), 318);
  bille[9] = new billetes(random(3800, 4850-dollar.width), 318);
  bille[10] = new billetes(random(5132, 6732-dollar.width), 500);
  bille[11] = new billetes(random(5132, 6732-dollar.width), 500);
  bille[12] = new billetes(random(5132, 6732-dollar.width), 500);
  bille[13] = new billetes(random(5132, 6732-dollar.width), 500);
  bille[14] = new billetes(random(7180, 8750-dollar.width), 318);
  bille[15] = new billetes(random(7180, 8750-dollar.width), 318);
  bille[16] = new billetes(random(7180, 8750-dollar.width), 318);
  bille[17] = new billetes(random(7180, 8750-dollar.width), 318);
  bille[18] = new billetes(random(9022, 9979-dollar.width), 500);
  bille[19] = new billetes(random(9022, 9979-dollar.width), 500);
  bille[20] = new billetes(random(10512, 11390-dollar.width), 318);
  bille[21] = new billetes(random(10512, 11390-dollar.width), 318);
  bille[22] = new billetes(random(11524, 12643-dollar.width), 500);
  bille[23] = new billetes(random(11524, 12643-dollar.width), 500);
  bille[24] = new billetes(random(11524, 12643-dollar.width), 500);
  bille[25] = new billetes(random(13183, 13545-dollar.width), 318);
  bille[26] = new billetes(random(13675, 14710-dollar.width), 318);
  bille[27] = new billetes(random(13675, 14710-dollar.width), 318);
  bille[28] = new billetes(random(14832, 16017-dollar.width), 500);
  bille[29] = new billetes(random(14832, 16017-dollar.width), 500);
  bille[30] = new billetes(random(14832, 16017-dollar.width), 500);
  bille[31] = new billetes(random(16150, 18579-dollar.width), 500);
  bille[32] = new billetes(random(16150, 18579-dollar.width), 500);
  bille[33] = new billetes(random(16150, 18579-dollar.width), 500);
  bille[34] = new billetes(random(16150, 18579-dollar.width), 500);
  bille[35] = new billetes(random(18683, 20087-dollar.width), 318);
  bille[36] = new billetes(random(18683, 20087-dollar.width), 318);
  bille[37] = new billetes(random(18683, 20087-dollar.width), 318);
  bille[38] = new billetes(random(20773, 21570-dollar.width), 500);
  bille[39] = new billetes(random(20773, 21570-dollar.width), 500);
  bille[40] = new billetes(random(21703, 21970-dollar.width), 500);
  bille[41] = new billetes(random(21703, 21970-dollar.width), 500);
  obj[0] = new objetoespecial(6980, 318, 50, 100);
  obj[1] = new objetoespecial(15500, 500, 120, 100);
  obj[2] = new objetoespecial(21502, 500, 190, 100);

  //CONFIGURACIONES GRANADA Y CREACIÓN DE OBJETOS
  //               posx+200  posinicialx yinicial
  gran[0] = new granada(1800+200, 1700, 300);
  gran[1] = new granada(1800+200, 1700, 300);
  gran[2] = new granada(17017+200, 17017, 300);
  gran[3] = new granada(17017+200, 17017, 300);
  gran[4] = new granada(21106+200, 21106, 300);
  gran[5] = new granada(21106+200, 21106, 300);
  gran[6] = new granada(5790+200, 5790, 300);
  gran[7] = new granada(5790+200, 5790, 300);
  gran[8] = new granada(9200+200, 9200, 300);
  gran[9] = new granada(9200+200, 9200, 300);
  gran[10] = new granada(11835+200, 11835, 300);
  gran[11] = new granada(11835+200, 11835, 300);
  gran[12] = new granada(15200+200, 15200, 300);
  gran[13] = new granada(15200+200, 15200, 300);

  //CONFIGURACIONES HELICOPTERO Y CREACIÓN DE OBJETOS
  //                       posx  posy  alturamax
  heli[0] = new helicoptero(1800, 300, 470);
  heli[1] = new helicoptero(17017, 300, 470);
  heli[2] = new helicoptero(21106, 300, 470);
  heli[3] = new helicoptero(5790, 300, 470);
  heli[4] = new helicoptero(9200, 300, 470);
  heli[5] = new helicoptero(11835, 300, 470);
  heli[6] = new helicoptero(15200, 300, 470);

  //CONFIGURACIONES OBSTACULOS Y CREACIÓN DE OBJETOS
  //                       posx  posy tamañox tamañoy
  obst[0] = new obstaculos(1200, 550, 130, 100);
  obst[1] = new obstaculos(2850, 520, 100, 130);
  obst[2] = new obstaculos(3685, 370, 130, 100);
  obst[3] = new obstaculos(4870, 550, 260, 100);
  obst[4] = new obstaculos(16017, 550, 133, 100);
  obst[5] = new obstaculos(18579, 520, 100, 130);
  obst[6] = new obstaculos(20087, 370, 132, 100);
  obst[7] = new obstaculos(20641, 550, 132, 100);
  obst[8] = new obstaculos(21570, 550, 133, 100);
  obst[9] = new obstaculos(6750, 520, 100, 130);
  obst[10] = new obstaculos(7045, 370, 130, 100);
  obst[11] = new obstaculos(11394, 550, 130, 100);
  obst[12] = new obstaculos(12643, 525, 100, 130);
  obst[13] = new obstaculos(13550, 370, 120, 100);
  obst[14] = new obstaculos(14727, 570, 120, 100);
  obst[15] = new obstaculos(8762, 555, 260, 100);
  obst[16] = new obstaculos(9979, 542, 100, 130);
  obst[17] = new obstaculos(10382, 368, 130, 100);
  obst[18] = new obstaculos(13053, 368, 130, 100);
  obst[19] = new obstaculos(13545, 368, 130, 100);

  //CONFIGURACIONES PLATAFORMAS Y CREACIÓN DE OBJETOS
  //                        posx  posy tamañox tamañoy
  plat[0] = new plataformas(2905, 470, 1950, 180);
  plat[1] = new plataformas(18683, 470, 1950, 180);
  plat[2] = new plataformas(6812, 470, 1950, 180);
  plat[3]= new plataformas(10059, 470, 1331, 180);
  plat[4]= new plataformas(12718, 470, 1992, 180);
}

//Leer video a reproducir en la pestaña de créditos
void movieEvent(Movie creditos1) {
  creditos1.read();
}

//Leer video a reproducir en la pantalla principal
void movieEvent1(Movie pantallainicio) {
  pantallainicio.read();
}

void draw () {
  background (0);

  //DEFINICIÓN DE EL VOLUMEN DE LOS SONIDOS DEL VIDEOJUEGO
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

  //PANTALLAS A SELECCIONAR
  switch (pantalla) {
  case 0:
    image(pantallainicio, 0, 0, width, height);
    pantallainicio.play();

    image(principal, 0, 0);
    break;
  case 1:
    //Colombia Y selección de demás personajes
    reset();
    image(personajes, 0, 0);
    image(previc, 113, 217);
    break;
  case 2:
    //Controles del juego
    image(como_jugar, 0, 0);
    break;
  case 3:
    image(creditos1, 0, 0, width, height);
    creditos1.play();
    image(botonback, 0, 20, 200, 150);
    break;
  case 4:
    //Personaje Mexico
    image(mexico, 0, 0);
    image(previm, 117, 322);
    break;
  case 5:
    //Personaje Argentina
    image(argentina, 0, 0);
    image(previa, 119, 408);
    break;
  case 6:
    //Personaje Venezuela
    image(venezuela, 0, 0);
    image(previv, 113, 499);
    break;
  case 7:
    //Personaje Perú
    image(peru, 0, 0);
    image(previp, 112, 596);
    break;
  case 8:
    switch (seleccionpersonaje) {
    case 1:
      image(letsgo, 0, 0);
      image(personajec, 980, 353);
      op = 1;
      break;
    case 2:
      image(letsgo, 0, 0);
      image(personajem, 980, 353);
      op = 2;
      break;
    case 3:
      image(letsgo, 0, 0);
      image(personajea, 1010, 353);
      op = 3;
      break;
    case 4:
      image(letsgo, 0, 0);
      image(personajev, 1025, 353);
      op = 4;
      break;
    case 5:
      image(letsgo, 0, 0);
      image(personajep, 1028, 353);
      op = 5;
      break;
    }
    break;
  case 9:
    //Pestaña de configuraciones
    image(configuracion, 0, 0);
    noStroke();
    vol[0].volumen1();
    vol[1].volumen1();
    break;
  }
  //Previsualización de los personajes
  if (botonResaltado != -1) {
    switch (botonResaltado) {
    case 1:
      pantalla1 = 1;
      break;
    case 2:
      pantalla1 = 4;
      break;
    case 3:
      pantalla1 = 5;
      break;
    case 4:
      pantalla1 = 6;
      break;
    case 5:
      pantalla1 = 7;
      break;
    case 6:
      pantalla1 = 8;
      break;
    }
    switch (pantalla1) {
    case 1:
      image(personajes, 0, 0);
      image(previc, 113, 217);
      break;
    case 4:
      image(mexico, 0, 0);
      image(previm, 117, 322);
      break;
    case 5:
      image(argentina, 0, 0);
      image(previa, 119, 408);
      break;
    case 6:
      image(venezuela, 0, 0);
      image(previv, 113, 499);
      break;
    case 7:
      image(peru, 0, 0);
      image(previp, 112, 596);
      break;
    }
  }

  //Reinicio del video de créditos a la posición inicial si se vuelve a la pantalla principal
  if (pantalla == 0 && creditscount == 1) {
    creditos1.jump(1);
  }

  //Controla que no se reproduzca el video inicial si se está jugando para tener un mejor rendimiento de juego
  if (pantalla == 8) {
    pantallainicio.stop();
  } else if (pantalla != 0) {
    pantallainicio.jump(1);
  }

  //Tiempo de previsualización del personaje antes de comenzar el videojuego (gif saltando)
  if (pantalla == 8 && millis() - tiempoInicio1 >= duracion) {
    ganador();

    //VIDEOJUEGO COMIENZA//
    //Pestaña si se llega al final del juego
    if (win) {
      image(victoria1, 0, 0);
      image(victoriaChoice, 555, 297);

      //Define nuevas posiciones para las botellas recogidas y no recogidas en la pantalla de victoria
      obj[0].posfinalx =130;
      obj[0].posfinaly = 400;
      obj[1].posfinalx =230;
      obj[1].posfinaly = 400;
      obj[2].posfinalx =330;
      obj[2].posfinaly = 400;

      //Dibujar botellas conseguidas y no conseguidas a lo largo del mapa
      for (i=0; i<=2; i++) {
        if (obj[i].botella1) {
          obj[i].botella();
        } else if (obj[i].botella2 == false) {
          //Dibujar objeto en nueva posición después de recogido
          image(botella, obj[i].posfinalx, obj[i].posfinaly);
        }
      }
    } else if (pausa == true) {
      //Pestaña si el juego se encuentra en pausa junto con los controles de volumen
      image(fondo, 0, 0);
      image(pausa1, 555, 297);
      noStroke();
      vol[0].volumen1();
      vol[1].volumen1();
    } else if (colision == 0 || colision == -1) {
      //Si el personaje muere se ejecutan los siguientes procedimientos
      botonrestart();
      muerte.amp(vol[1].volume);
      muerte();
    } else {
      background(0);
      //Movimiento del mapa con respecto al personaje
      image(mapa, xpos1, ypos1);

      //Dibujar objetos de obstáculos
      for (i=0; i<obst.length; i++) {
        obst[i].obstaculos1();
      }

      //Dibujar objetos de billetes
      for (i=0; i<bille.length; i++) {
        if (bille[i].billete) {
          bille[i].billetes1();
        }
      }
      //Dibujar objetos especiales
      for (i=0; i<obj.length; i++) {
        if (obj[i].botella1) {
          obj[i].botella();
        } else if (obj[i].botella2 == false) {
          //Dibujar objeto en nueva posición después de recogido
          image(botella, obj[i].posfinalx, obj[i].posfinaly, 70, 90);
        }
      }

      //Mostrar número de billetes recolectados
      textAlign(CENTER);
      textSize(40);
      fill(255);
      text("x"+dollars, 1480, 90);

      //Dependiendo del persobaje dibujar sus imágenes y movimientos especiales
      //Dibujar dependiendo de si se mueven a la derecha o a la izquierda para seguir la continuidad del movimiento
      switch(op) {
      case 1:
        if (derecha) {
          image(latino4, xpos, ypos);
        } else {
          if (izquierda) {
            image(latino3, xpos, ypos);
          } else if (!aTodaMadre) {
            image(latino5, xpos, ypos);
          }
        }
        break;
      case 2:
        if (derecha) {
          image(latino, xpos, ypos);
        } else {
          if (izquierda) {
            image(latino1, xpos, ypos);
          } else if (!aTodaMadre) {
            image(latino2, xpos, ypos);
          }
        }
        break;
      case 3:
        if (derecha) {
          image(latino7, xpos, ypos);
        } else {
          if (izquierda) {
            image(latino6, xpos, ypos);
          } else if (!aTodaMadre) {
            image(latino8, xpos, ypos);
          }
        }
        break;
      case 4:
        if (derecha) {
          image(latino10, xpos, ypos);
        } else {
          if (izquierda) {
            image(latino9, xpos, ypos);
          } else if (!aTodaMadre) {
            image(latino11, xpos, ypos);
          }
        }
        break;
      case 5:
        if (derecha) {
          image(latino13, xpos, ypos);
        } else {
          if (izquierda) {
            image(latino12, xpos, ypos);
          } else if (!aTodaMadre) {
            image(latino14, xpos, ypos);
          }
        }
        break;
      }

      //Ejecutar movimiento especial
      aTodaMadre();

      //Dibujar objetos de helicópteros
      for (i=0; i<heli.length; i++) {
        heli[i].MoveHelicoptero();
      }

      //Ejecutar aumento de velocidad cada 15 segundos
      aumentoVel();

      //Movimiento del personaje y del mapa
      movelatino();
      movemapa();

      //Muestra el tiempo transcurrido
      time();

      //Dibuja los corazones de vidas constantemente
      vidas();

      //Reinicia el contador al llegar a las 10 monedas necesarias para aumentar una vida al jugador
      dollar_vida();

      //Dibuja objetos de granadas
      for (i=0; i<gran.length; i++) {
        gran[i].moveGranada();
      }

      //Dibujar objetos de enemigos si se encuentran vivos
      for (i=0; i<ene.length; i++) {
        if (ene[i].vivo) {
          ene[i].enemigos3();
        }
      }

      // Verifica si el personaje está invulnerable y si ha pasado suficiente tiempo desde la última colisión
      if (invulnerable && millis() - tiempoColision >= tiempoInvulnerable) {
        invulnerable = false; // Termina la invulnerabilidad después del tiempo puesto
      }

      //Dibuja imágenes estáticas en el juego
      image(dollar, 1330, 40);
      image(meta, xpos1 + 22700, 360);
      image(trump, xpos1 + 22700 + meta.width, 380);
    }
  }
}
