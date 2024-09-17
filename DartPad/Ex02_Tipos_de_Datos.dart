void main() {
  //Tipos de datos en Dart
  final String pokemon = "Pikachu";
  final int hp = 100;
  final bool isAlive = true;
  final List <String> abilities = ['ataque rapido', 'Cola de Hierro', 'Ataque ràpido'];
  final sprites = <String>['Pikachu_front.png', 'Pikachu_back.png'];
  
  print("""
     El pokemon que elegiste es: $pokemon
  ---------------------------------------------
     Las estadìsticas de $pokemon son:
     Vida (HP): $hp
     Estatus de vida: $isAlive
     Habilidades: $abilities
     Imagenes: $sprites
  """);
  
}
