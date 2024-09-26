void main () {

// declaracion de la variable
  // final double totalCarList; 

// 1. Llamado de un funcion sin prarámetros
greetEveryone();

// 2. Llamado de una funcion que retorna valores
// a) Sin almacenar el valor en una variable
    print("Hoy es el dia numero: ${getDayNumber()} del mes");
// b) Almacenando el valor de la funcion en una nueva variable
    final int diaMes; 
    diaMes = getDayNumber();
    print("En tres dias será: ${diaMes+3}");

  print("----------------------------------------------------");
    print("---- Parametos con Dynamic ---- ");
// 3. Llamado de una funcion con un solo parametro obligatorio
//a. Llamado correcto
  print(greetSomeone("Carlos C."));
//b. En caso de que la funcion este declarada con dynamic
  print(greetSomeone1(4));
  print(greetSomeone1(-312));
  print(greetSomeone1(3.1416));
  print(greetSomeone1(true));
  print("----------------------------------------------------");
    print("---- Parametos Tipados ---- ");
// 3.1 Tipando el Parametro de entrada
// Mismo experimnto pero hahora con la funcion con parametros tipados
  print(greetSomeoneTypy("4"));
  print(greetSomeoneTypy("-312"));
  print(greetSomeoneTypy("3.1416"));
  print(greetSomeoneTypy("true"));

print("-------------------------------------------");
// 3.2 

  // print(greetSomeone());
// Esta no se puede ejecura po que si no se definen los parametros 
// de un funcion por default estan definidos como obligatorios

  print("----------------------------------------------------");
    print("---- Funciones con parametos Opcionales ---- ");
// 4.Llamado de una funcion con parametros opcionales.
// 4.1 Enviamos ambos parametros
  String name = "Juan";
  int? hora = 12;
  print(greetHourOfDay(name, hora));

// 4.2 solo enviando el obligatorio
  print(greetHourOfDay2("Juanco", null));
  print("Hora: $hora");
  print("----------------------------------------------------");
    print("---- Funciones Lambda ---- ");
// 5. funciones LAMBDA - Las funciuones lambda, mejor conocidas como funciones anonimas o funciones 
//simplificadas, se ejecutan de manera simple y no frecuente en la ejecucion de un programa o sistema

var calcularCosto = (double productQueantity, double productPrice, double percentageDisscount) => { 
(productQueantity * productPrice) * (100 - percentageDisscount)};

// nota las LAMBDA fuction solo deben de llevar una intruccion a la vez

double cantidadProducto = 5;
double precioProducto = 125.50;
double descuento = 2.5;

print("""
    Costo del producto ${precioProducto}
    Cantidad ${cantidadProducto}
    Descuento ${descuento}
    ------------------------------------------------------
    Costo del Carrito de Compras: ${calcularCosto(cantidadProducto, precioProducto, descuento)}""");
  print("----------------------------------------------------");
    print("---- Parametos Nombrados ---- ");
// 6 Funciones con parametros Nombrados

print(infoCarListStatus(buyerName: "Manuel"));

// 6.1 llammado de  una funcion con parametros nulos
print(infoCarListStatus(
  status: "En espera de pago",
  amounutCarList: 2416.20,
  buyerName: "Alexia" 
));
// ---------------------------------------------------------------------------------------------------
}
//Funciones y Parametros

// Declaracion
//?: 1. Funcion Sin Parametros
void greetEveryone()
{
  print("Hola a Todas y Todos :D");
}

//? 2. Funciones sin Parámetros, que retorna datos
getDayNumber()
{
  DateTime now = DateTime.now();
  int day = now.day;
  return day;
}

//? 3. Funciones que reciben un parametrom en DART sin ni se especifica como opcional simpres sera obligatorio
String greetSomeone(String name) {
  return "Hola, $name";
}

dynamic greetSomeone1(name) {
  return "Hola, $name";
}

//?3.1 tipamos el parametro de entrada

String greetSomeoneTypy(String name){
  return "Hola, $name";
}

//?4. Función que reciben mas de un parametros 

String greetSomeoneHourOfDay(String name, [int? hourDay]){
  String greeting = "Hola, $name";
  return greeting;
}

// int? Puede ser opcional - NullSafety
String greetHourOfDay(String name, [int? hora]){
  hora ??= DateTime.now().hour;
  String saludo;

  if(hora >= 6 && hora < 12){
    print("Hora: ${hora}");
  saludo = "Buenos dias";
  }
  else if(hora > 12 && hora < 18){
    saludo = "Buenas tardes";
  }
  else{
    saludo = "Buenas noches";
  }

  return "${saludo}, ${name}";

}  


String greetHourOfDay2(String name, int? hora){
  hora ??= DateTime.now().hour;
  String saludo;

  if(hora >= 6 && hora < 12){
  saludo = "Buenos dias";
  }
  else if(hora > 12 && hora < 18){
    saludo = "Buenas tardes";
  }
  else{
    saludo = "Buenas noches";
  }
  return "${saludo}, ${name}";
}  

//? 5. Funciones con parametros Nombrados
String infoCarListStatus({
  required String buyerName,
  double amounutCarList = 0.0,
  String status = "Seleccion de Productos"}) {
  return "El Carrito de compras de: ${buyerName}, tiene un total de \$${amounutCarList} y actualmente está en estatus: ${status}";
}