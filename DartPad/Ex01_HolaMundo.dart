void main() {
  //Var se crea en tiempo de ejecucion
  var myName = "Juanco";
  String myLastName = "Cruz";
  //Crea una constante en tiempo de construccion
  const myNameConst = 'Juancomania';
  
  //No se le asigna el valor
  //late final myName2;
  
  final int myDNI = 210373;
  late final int myAge;
  
  myName = "Juan";
  //   myDNI = 210373;
  
  print('Hola, $myName $myLastName, tu matricula es: $myDNI y tu edad aún no la conozco porque no se cuando naciste');
  
   print('\nHola, $myName ${myLastName.toUpperCase()}, tu matricula es: $myDNI y tu edad aún no la conozco porque no se cuando naciste');
}