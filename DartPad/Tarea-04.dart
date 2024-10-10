void main() {
  // Primer caso: Paciente activo
  // Creación objeto Paciente
  print("Caso 1: Paciente activo");
  print("------------------------------------------------------");
  final paciente1 = Paciente(
      id: 101,
      nombre: 'Sofía',
      primer_apellido: 'Martínez',
      segundo_apellido: 'Ramírez',
      genero: 'Femenino',
      grupoSanguineo: 'O+',
      fechaNacimiento: DateTime(1995, 05, 15),
      curp: 'MARL950515MDFRRA01',
      estatus: 'Activo',
      nss: '9876543210',
      tipoSeguro: 'Privado',
      estatusVida: EstatusVida.Vivo,
      estatusMedico: 'Activo',
      fechaRegistro: DateTime.now(),
      fechaUltimaCita: DateTime.now(),
      tipoUsuario: usuario.Nuevo);
  paciente1.imprimirDatosPaciente();
  
  // Segundo caso: Paciente que fue trabajador del hospital
  print("\nCaso 2: Paciente que fue trabajador del hospital");
  print("------------------------------------------------------");
  final paciente2 = Paciente(
      id: 102,
      nombre: 'Alexis',
      primer_apellido: 'Pérez',
      segundo_apellido: 'Sánchez',
      genero: 'Masculino',
      grupoSanguineo: 'AB+',
      fechaNacimiento: DateTime(1980, 11, 22),
      curp: 'PESC801122HDFRRL01',
      estatus: 'Activo',
      nss: '6543210987',
      tipoSeguro: 'Publico IMSS',
      estatusVida: EstatusVida.Vivo,
      estatusMedico: 'Activo',
      fechaRegistro: DateTime(2015, 04, 10),
      fechaUltimaCita: DateTime.now(),
      tipoUsuario: usuario.Registrado);
  
  paciente2.imprimirDatosPaciente();

  // Tercer caso: Paciente fallecido
  print("\nCaso 3: Paciente fallecido");
  print("------------------------------------------------------");
  final paciente3 = Paciente(
      id: 103,
      nombre: 'Elena',
      primer_apellido: 'Gutiérrez',
      segundo_apellido: 'Cruz',
      genero: 'Femenino',
      grupoSanguineo: 'A-',
      fechaNacimiento: DateTime(1975, 07, 30),
      curp: 'GUCE750730MDFCRL02',
      estatus: 'Activo',
      nss: '123456789',
      tipoSeguro: 'Seguro Popular',
      estatusVida: EstatusVida.Vivo,
      estatusMedico: 'Activo',
      fechaRegistro: DateTime(2020, 01, 15),
      fechaUltimaCita: DateTime.now(),
      tipoUsuario: usuario.Registrado);

  // Registrar defunción del paciente
  paciente3.registrarDefuncion();

  // Llamada a método para imprimir datos 
  paciente3.imprimirDatosPaciente();
}

// Enumeración para el tipo de usuario
enum usuario { Nuevo, Registrado, Finado }

// Enumeración para el estatus de vida
enum EstatusVida { Vivo, Fallecido, Desconocido }

// Clase abstracta Persona
abstract class Persona {
  int id;
  String nombre;
  String primer_apellido;
  String segundo_apellido;
  String genero;
  String grupoSanguineo;
  DateTime fechaNacimiento;
  String curp;
  String estatus;
  DateTime fechaRegistro;
  
  // Constructor para inicializar los atributos de la persona
  Persona({
    required this.id,
    required this.nombre,
    required this.primer_apellido,
    required this.segundo_apellido,
    required this.genero,
    required this.grupoSanguineo,
    required this.fechaNacimiento,
    required this.curp,
    required this.estatus,
    required this.fechaRegistro,
  });

  void imprimirDatosPersona() {
    print('ID: $id');
    print('Nombre: $nombre');
    print('Primer Apellido: $primer_apellido');
    print('Segundo Apellido: $segundo_apellido');
    print('Género: $genero');
    print('Grupo Sanguíneo: $grupoSanguineo');
    print('Fecha de Nacimiento: ${fechaNacimiento.year}-${_twoDigits(fechaNacimiento.month)}-${_twoDigits(fechaNacimiento.day)}');
    print('CURP: $curp');
    print('Estatus: $estatus');
  }
  
  // Método auxiliar para formatear números a dos dígitos
  String _twoDigits(int n) {
    return n >= 10 ? '$n' : '0$n';
  }
}

// Clase Paciente que hereda de Persona
class Paciente extends Persona {
  String nss;
  String tipoSeguro;
  EstatusVida estatusVida;
  String estatusMedico;
  DateTime fechaUltimaCita;
  usuario tipoUsuario;

  // Constructor para inicializar los atributos del paciente
  Paciente({
    required int id,
    required String nombre,
    required String primer_apellido,
    required String segundo_apellido,
    required String genero,
    required String grupoSanguineo,
    required DateTime fechaNacimiento,
    required String curp,
    required String estatus,
    required this.nss,
    required this.tipoSeguro,
    required this.estatusVida,
    required this.estatusMedico,
    required DateTime fechaRegistro,
    required this.fechaUltimaCita,
    required this.tipoUsuario,
  }) : super(
            id: id,
            nombre: nombre,
            primer_apellido: primer_apellido,
            segundo_apellido: segundo_apellido,
            genero: genero,
            grupoSanguineo: grupoSanguineo,
            fechaNacimiento: fechaNacimiento,
            curp: curp,
            estatus: estatus,
            fechaRegistro: fechaRegistro);

  @override
  void imprimirDatosPersona() {
    super.imprimirDatosPersona();
    print('Paciente: ${tipoUsuario.toString().split('.').last}');
    print('NSS: $nss');
    print('Tipo de Seguro: $tipoSeguro');
    print('Estatus de Vida: ${estatusVida.toString().split('.').last}');
    print('Estatus Médico: $estatusMedico');
    print('Fecha de Registro: ${fechaRegistro.year}-${_twoDigits(fechaRegistro.month)}-${_twoDigits(fechaRegistro.day)}');
  }

  // Método que imprime los datos de la persona y los del paciente
  void imprimirDatosPaciente() {
    imprimirDatosPersona();
    print('Fecha Última Cita: ${fechaUltimaCita.year}-${_twoDigits(fechaUltimaCita.month)}-${_twoDigits(fechaUltimaCita.day)}');
  }

  void registrarDefuncion() {
    estatusVida = EstatusVida.Fallecido;
    estatusMedico = 'Inactivo';
    tipoUsuario = usuario.Finado;
  }
}
