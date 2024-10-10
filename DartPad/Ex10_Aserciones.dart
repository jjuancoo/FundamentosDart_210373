void main(){
  final mySquare = Square(side:-7);
  print("El lado del cuadrado es de: ${mySquare._side}");
  print("su àrea es de: ${mySquare.area}");

  mySquare._side = -32;
  print("""
  Lado del cuadrado: ${mySquare._side}
  Area que ocupa: ${mySquare.area}
  """);
}

class Square {
  double _side; // Formula para calcular el Area lado*lado
    Square({required double side})
    : assert(side > 0, 'El valor del lado debe de ser mayor a 0'),
    _side= side;

  double get area{
    return _side*_side;
  }

  set side(double value){
    print("setting new value $value");
    if (value<0) throw 'Value must be >= 0';
    _side= value;
  }

  double calculateArea(){
    return area;
  }
}