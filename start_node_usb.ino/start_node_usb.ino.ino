// ┌───────────────────────────┐
// │ Developed by ladopixel    │
// │ Execute Ergo node v5.0.13 │
// └───────────────────────────┘

// I am currently working on this file...


#include <Keyboard.h>

void setup() {
  Keyboard.begin();
}

void loop() {
  // Keyboard.press(KEY_LEFT_ALT);
  // Keyboard.press(KEY_RIGHT_ALT);
  // Keyboard.press(KEY_RETURN);
  // Keyboard.releaseAll();

  delay(5000);

  ////////// Comando cd || exit
  Keyboard.print("cd ");
  Keyboard.press(KEY_LEFT_ALT);
  Keyboard.press(49); // Del número 1 en ASCII
  delay(200);
  Keyboard.releaseAll();
  Keyboard.press(KEY_LEFT_ALT);
  Keyboard.press(49); // Del número 1 en ASCII
  delay(200);
  Keyboard.releaseAll();
  Keyboard.print(" exit");
  Keyboard.press(KEY_RETURN);
  delay(200);
  Keyboard.releaseAll();

  ////////// Descargo el archivo .sh
  Keyboard.print("curl /LJO https");
  Keyboard.press(KEY_LEFT_SHIFT);
  Keyboard.press(46);
  delay(200);
  Keyboard.releaseAll();
  Keyboard.print("&&raw.githubusercontent.com&ladopixel&ergo/node/sh&main&start");
  Keyboard.print('?');
  delay(200);
  Keyboard.releaseAll(); 
  Keyboard.print("node.sh");
  delay(200);
  Keyboard.press(KEY_RETURN);
  Keyboard.releaseAll(); 

  ////////// Espero que descargue
  delay(2000);

  ////////// Doy permisos de ejecución y ajecuto
  Keyboard.print("chmod 755 start");
  Keyboard.print('?');
  delay(200);
  Keyboard.releaseAll(); 
  Keyboard.print("node.sh");
  delay(200);
  Keyboard.press(KEY_RETURN);
  Keyboard.releaseAll();

  ////////// Ejecuto el archivo
  Keyboard.print(".&start");
  Keyboard.print('?');
  delay(200);
  Keyboard.releaseAll(); 
  Keyboard.print("node.sh");
  delay(200);
  Keyboard.press(KEY_RETURN);
  Keyboard.releaseAll();

  
  // Termino
  exit(0);
  
}