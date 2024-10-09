//Clase del volumen del juego
class volumen {
  float volume; //Variable que controla el valor del volumen como un valor de 0 a 1
  float sliderX;
  float sliderY;
  float sliderWidth;
  float sliderHeight;
  boolean dragging;
  
  //Constructor
  volumen(float volume, float sliderX, float sliderY, float sliderWidth, float sliderHeight, boolean dragging) {
    this.volume = volume;
    this.sliderX = sliderX;
    this.sliderY = sliderY;
    this.sliderWidth = sliderWidth;
    this.sliderHeight = sliderHeight;
    this.dragging = dragging;
  }
  
  void volumen1() {
    //Calcular el porcentaje de volumen
    int percent = int(volume * 100);

    //Dibujar la barra de volumen
    fill(#694433); //Color antes de la barra
    rect(sliderX, sliderY, volume * sliderWidth, sliderHeight);

    //volume * sliderWidth es el ancho de la barra

    fill(#FFDE00); //Color después de la barra
    rect(sliderX + volume * sliderWidth, sliderY, (1 - volume) * sliderWidth, sliderHeight);

    //Mostrar el texto del porcentaje de volumen
    fill(255);
    textAlign(CENTER, CENTER);
    text(percent + "%", sliderX + sliderWidth / 2, sliderY + sliderHeight / 2);

    //Dibujar el control deslizante
    fill(255);
    rect(constrain(sliderX + volume * sliderWidth - 5, sliderX, sliderX + sliderWidth - 5), sliderY, 5, sliderHeight);
    
    //Escribir controles de volumen
    textAlign(CENTER);
    textSize(40);
    fill(255);
    text("Music", 780, 100);
    text("Sound Efects", 800, 220);
  }
}
