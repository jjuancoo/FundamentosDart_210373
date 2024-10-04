void main() {
  //Construcutores Nombrados 
  //Caso Prueba 1

  final juanPerez = Person(
    ID: 256, 
    cortesyTitle: "Sr.",
    name: "Juan Perez", 
    firstLastname: "Rodrigrez", 
    gender: "Male", 
    bloodGroup: "O+", 
    curp: "ANSISISNN12233",
    birthdate: DateTime(1992,08,05),
    isActive: true,
    createAt: DateTime(2024,09,2024,11,05,16),
);

print(juanPerez);

// Caso de Prueba 2 -- Enviando los obligatorios
final marthaFlores = Person(
  ID: 221, 
  name: "Martha", 
  firstLastname: "Flores", 
  gender: "Famele", 
  bloodGroup:"O-", 
  birthdate: DateTime(1995,08,12));

print(marthaFlores);

}

class Person
  {
    int ID;
    //Establece un parametro predefinido
    String? cortesyTitle;
    String name;
    String firstLastname;
    String? secondLastname;
    String gender;
    String bloodGroup;
    String? curp;
    DateTime birthdate;
    bool isActive;
    DateTime createAt;
    DateTime? updateAt;
    
    Person(
      {
      required this.ID,
      this.cortesyTitle,
      required this.name,
      required this.firstLastname,
      this.secondLastname,
      required this.gender,
      required this.bloodGroup,
      this.curp,
      required this.birthdate,
      this.isActive = true,
      DateTime? createAt,
      this.updateAt}) 
      : createAt = createAt ?? DateTime.now();


@override
  String toString()
  {
    //Norta: no esta inicilizada esta funcion 
    // final String formatedBrirthDate = 
    //   "${birthdate.day.toString().padLeft(2,'0')}/" + 
    //   "${birthdate.month.toString().padLeft(2,'0')}/${birthdate.year} "; 

    final String formatedCreateDate = 
      "${createAt.day.toString().padLeft(2,'0')}/" + 
                        "${createAt.day.toString().padLeft(2,'0')}/" +
                        "${createAt.month.toString().padLeft(2,'0')}/${createAt.year}/" + 
                        "${createAt.hour.toString().padLeft(2,'0')}:" + 
                        "${createAt.minute.toString().padLeft(2,'0')}:"+
                        "${createAt.second.toString().padLeft(2,'0')}";

          curp ??= "No registrado";
          if(curp == "") curp = "No registrado";

          String status = "Sin Definir";
          if(isActive)
              status = "Activo";
            else
              status =  "inactivo";

          return """
          -----------------------------------------------------------------------------
          Datos de la Persona
          -----------------------------------------------------------------------------
          ID: $ID,
          Nombre: $name $firstLastname $secondLastname,
          Género: $gender
          Grupo Sanguíneo: $bloodGroup
          Fecha de Nacimiento: $birthdate
          CURP: $curp
          Estatus: $status
          Fecha de Registro: $formatedCreateDate
        """;
  }
}