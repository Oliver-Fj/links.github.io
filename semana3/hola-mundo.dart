import 'dart:io';
import 'dart:math';  

class Cilindro{
  final double radio;
  finaldouble altura;
  
  Cilindro(this.radio, this.altura);
  
  double calcularArea(){
  return 2 * pi * radio * (radio + altura);
  }
  
  double calcularVolumen(){
  return pi * pow(radio, 2)* altura;
  }
}

void main(){ 
  print("programa para calcular area y volumen de un cilindro");
  stdout.write("ingrese el radio del cilindro: ");
  String? inputRadio = stdin.readLineSync();
  double radio = double.parse(inputRadio!);

  stdout.write("ingrese la altura del cilindro: ");
  String? inputAltura = stdin.readLineSync();
  double altura = double.parse(inputAltura!);

  Cilindro cilindro = Cilindro(radio, altura);

  print("\nResulatados:");
  print ("Área total: ${cilindro.calcularArea().toStringAsFixed(2)}");
  print ("Volumen: ${cilindro.calcularVolumen().toStringAsFixed(2)}");
}
