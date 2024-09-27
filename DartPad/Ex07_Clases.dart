void main(){
   // Repaso de Clases en DART
   // instanciamos la Clase Hero 
    print("----------Heroe 1 -----------------");
   final wolverine = Hero("Logan","Regeneración");
   print(wolverine);
   print(wolverine.name);
   print(wolverine.power);
    print("----------Heroe 2 -----------------");
    final scarletWitch = Hero("Magia del Caos","Wanda");
    print(scarletWitch);
    print(scarletWitch.name);
    print(scarletWitch.power);

    print("---------------------------");
    final xmen = Team(type:"Heroes", name:"X-Men");
    print(xmen);
    print(xmen.name);
    print(xmen.type);

    final justiceLeague = Team(name:"La liga de la Justicia");
    print(justiceLeague);
    print(justiceLeague.name);
    print(justiceLeague.type);

    //invocando el metodo reeincrito con @overrride
    print(justiceLeague.toString());

    /*Intentamos instanciar la clase con solo el valor del tipo, que no lo permite porque la 
    propiedad de nombre es requerida*/ 
    //final hydra = Team(type:"Villano");
    
}
//Clases con propiedades posicionales
class Hero
{
    String name;
    String power;

    Hero(String pName, String pPower):
        name = pName,
        power = pPower;
}
//Clase con propiedades no pisicionales nombradas
class Team
{
    String name;
    String type;
    //El comnstructor de la clase simepre debe llavr el mismo nombre de la clase
    Team({required this.name, this.type="No definido."});
    
    @override
    String toString(){
        return 'Grupo: $name, Tipo: $type';
    }
}