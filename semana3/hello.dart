import 'dart:io';
// void main() {
//   print("Calculadora de pensiones universitarias");
  
//   String categoria = solicitarCategoria();
//   double notaPromedio = solicitarNotaPromedio();
  
//   double pensionActual = obtenerPension(categoria);
//   double descuento = calcularDescuento(notaPromedio);
//   double nuevoMonto = pensionActual - (pensionActual * descuento / 100);
  
//   mostrarResultados(pensionActual, descuento, nuevoMonto);
// }

// String solicitarCategoria() {
//   print("Ingrese la categoría del estudiante (A, B, C o D):");
//   return stdin.readLineSync()!.toUpperCase();
// }

// double solicitarNotaPromedio() {
//   print("Ingrese la nota promedio del estudiante:");
//   return double.parse(stdin.readLineSync()!);
// }

// double obtenerPension(String categoria) {
//   Map<String, double> pensiones = {
//     'A': 550,
//     'B': 500,
//     'C': 460,
//     'D': 400
//   };
  
//   return pensiones[categoria] ?? 0;
// }
// double calcularDescuento(double notaPromedio) {
//   if (notaPromedio >= 14 && notaPromedio <= 15.99) return 10;
//   if (notaPromedio >= 16 && notaPromedio <= 17.99) return 12;
//   if (notaPromedio >= 18 && notaPromedio <= 20) return 15;
  
//   return 0;
// }
// void mostrarResultados(double pensionActual, double descuento, double nuevoMonto) {
//   print("\nResultados:");
//   print("Pensión actual: S/. ${pensionActual.toStringAsFixed(2)}");
//   print("Descuento: $descuento%");
//   print("Nuevo monto: S/. ${nuevoMonto.toStringAsFixed(2)}");
// }

import 'dart:io';

// void main() {
//   print("Calculadora de costo de libreta militar");
//   int edad = solicitarEdad();
//   int nivelBeneficio = solicitarNivelBeneficio();
//   double precioBase = obtenerPrecioBase(edad);
//   double descuento = calcularDescuento(edad, nivelBeneficio);
//   double valorFinal = aplicarDescuento(precioBase, descuento);
//   mostrarResultados(edad, nivelBeneficio, precioBase, descuento, valorFinal);
// }

// int solicitarEdad() {
//   print("Ingrese su edad:");
//   return int.parse(stdin.readLineSync()!);
// }

// int solicitarNivelBeneficio() {
//   print("Ingrese su nivel del sistema de beneficio (1, 2, 3 o otro número para otros estratos):");
//   return int.parse(stdin.readLineSync()!);
// }

// double obtenerPrecioBase(int edad) {
//   return edad > 18 ? 350 : 200;
// }

// double calcularDescuento(int edad, int nivelBeneficio) {
//   if (edad > 18) {
//     switch (nivelBeneficio) {
//       case 1: return 40;
//       case 2: return 30;
//       case 3: return 15;
//       default: return 0;
//     }
//   } else {
//     switch (nivelBeneficio) {
//       case 1: return 60;
//       case 2: return 40;
//       case 3: return 20;
//       default: return 0;
//     }
//   }
// }

// double aplicarDescuento(double precioBase, double descuento) {
//   return precioBase - (precioBase * descuento / 100);
// }

// void mostrarResultados(int edad, int nivelBeneficio, double precioBase, double descuento, double valorFinal) {
//   print("\nResultados:");
//   print("Edad: $edad años");
//   print("Nivel de beneficio: $nivelBeneficio");
//   print("Precio base: S/. ${precioBase.toStringAsFixed(2)}");
//   print("Descuento: $descuento%");
//   print("Valor final a pagar: S/. ${valorFinal.toStringAsFixed(2)}");
// }


import 'dart:io';

void main() {
  print("Calcu de salarios vendedores");
  
  double impVendido = solicitarImpVendido();
  int numHijos = solicitarNumHijos();
  
  double basSalario = calBasSalario();
  double comis = calComis(impVendido);
  double boni = calBoni(numHijos);
  double brutSalario = calBrutSalario(basSalario, comis, boni);
  double descuent = calDescuent(brutSalario);
  double netSalario = calNetSalario(brutSalario, descuent);
  
  mostraResul(basSalario, comis, boni, brutSalario, descuent, netSalario);
}

double solicitarImpVendido() {
  print("Ingre el imp tot vendido:");
  return double.parse(stdin.readLineSync()!);
}

int solicitarNumHijos() {
  print("Ingre el núm de hijos:");
  return int.parse(stdin.readLineSync()!);
}

double calBasSalario() {
  return 600;
}

double calComis(double impVendido) {
  return impVendido > 15000 ? impVendido * 0.07 : impVendido * 0.05;
}

double calBoni(int numHijos) {
  return numHijos < 5 ? numHijos * 25 : numHijos * 22;
}

double calBrutSalario(double basSalario, double comis, double boni) {
  return basSalario + comis + boni;
}

double calDescuent(double brutSalario) {
  return brutSalario > 3500 ? brutSalario * 0.15 : brutSalario * 0.11;
}

double calNetSalario(double brutSalario, double descuent) {
  return brutSalario - descuent;
}

void mostraResul(double basSalario, double comis, double boni, double brutSalario, double descuent, double netSalario) {
  print("\nRes del cal de salarios:");
  print("Bas Salario: S/. ${basSalario.toStringAsFixed(2)}");
  print("Comis: S/. ${comis.toStringAsFixed(2)}");
  print("Boni: S/. ${boni.toStringAsFixed(2)}");
  print("Brut Salario: S/. ${brutSalario.toStringAsFixed(2)}");
  print("Descuent: S/. ${descuent.toStringAsFixed(2)}");
  print("Net Salario: S/. ${netSalario.toStringAsFixed(2)}");
}
