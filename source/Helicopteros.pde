//Clase que controla los movimientos del helicóptero
class helicoptero {
  int posinicialx, yinicial, alturamax;
  helicoptero(int posinicialx, int yinicial, int alturamax) {
    this.posinicialx = posinicialx;
    this.yinicial = yinicial;
    this.alturamax = alturamax;
  }
  void MoveHelicoptero() {
    // Actualizar la posición vertical
    yinicial = yinicial + velheli;
    // Cambiar la dirección si alcanza los límites superior o inferior
    if (yinicial > alturamax || yinicial < 0) {
      velheli = -velheli;
    }
    image(helicoptero, xpos1 + posinicialx, yinicial);
  }
}
