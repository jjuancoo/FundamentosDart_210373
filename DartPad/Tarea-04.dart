void main() {
  final pacienteManager = PacienteManager();

  // Crear pacientes con valores del código anterior
  final paciente1 = Paciente(
    cortesyTitle: "Sra",
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
    tipoUsuario: usuario.Nuevo,
  );

  final paciente2 = Paciente(
    cortesyTitle: "Sra",
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
    tipoUsuario: usuario.Registrado,
  );

  final paciente3 = Paciente(
    cortesyTitle: "Sra",
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
    tipoUsuario: usuario.Registrado,
  );

  pacienteManager.create(paciente1);
  pacienteManager.create(paciente2);
  pacienteManager.create(paciente3);

  // Leer pacientes
  print("\nLista inicial de pacientes:");
  pacienteManager.readAll();

  // Actualizar paciente2
  pacienteManager.update(102, (paciente) {
    paciente.nombre = 'Alexis actualizado';
  });

  // Registrar defunción de paciente3
  paciente3.registrarDefuncion();
  pacienteManager.update(103, (paciente) {
    // Aquí podrías agregar lógica adicional si es necesario
  });

  // Eliminar paciente1
  pacienteManager.delete(101);

  // Leer pacientes después de las actualizaciones
  print("\nLista de pacientes después de las actualizaciones:");
  pacienteManager.readAll();
}

class PacienteManager {
  final List<Paciente> _pacientes = [];

  void create(Paciente paciente) {
    _pacientes.add(paciente);
    print('Paciente creado: ${paciente.nombre}');
  }

  void readAll() {
    for (var paciente in _pacientes) {
      paciente.imprimirDatosPaciente();
      print('------------------------------------------------------');
    }
  }

  void update(int id, void Function(Paciente) updateFunction) {
    final paciente = _pacientes.firstWhere(
      (p) => p.id == id,
      orElse: () => throw Exception('Paciente no encontrado'),
    );
    updateFunction(paciente);
    print('Paciente actualizado: ${paciente.nombre}');
  }

  void delete(int id) {
    _pacientes.removeWhere((p) => p.id == id);
    print('Paciente eliminado con ID: $id');
  }
}

// Enumeración para el tipo de usuario
enum usuario { Nuevo, Registrado, Finado }

// Enumeración para el estatus de vida
enum EstatusVida { Vivo, Fallecido, Desconocido }

// Clase Abstracta Persona
abstract class Persona {
  int id;
  String cortesyTitle;
  String nombre;
  String primer_apellido;
  String segundo_apellido;
  String genero;
  String grupoSanguineo;
  DateTime fechaNacimiento;
  String curp;
  String estatus;
  DateTime fechaRegistro;

  Persona({
    required this.id,
    required this.cortesyTitle,
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
    print('$cortesyTitle. $nombre $primer_apellido $segundo_apellido');
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

  String _twoDigits(int n) {
    return n >= 10 ? '$n' : '0$n';
  }
}

// Clase Paciente
class Paciente extends Persona {
  String nss;
  String tipoSeguro;
  EstatusVida estatusVida;
  String estatusMedico;
  DateTime fechaUltimaCita;
  usuario tipoUsuario;

  Paciente({
    required int id,
    required String cortesyTitle,
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
          cortesyTitle: cortesyTitle,
          nombre: nombre,
          primer_apellido: primer_apellido,
          segundo_apellido: segundo_apellido,
          genero: genero,
          grupoSanguineo: grupoSanguineo,
          fechaNacimiento: fechaNacimiento,
          curp: curp,
          estatus: estatus,
          fechaRegistro: fechaRegistro,
        );

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

  void imprimirDatosPaciente() {
    imprimirDatosPersona();
    print('Fecha Última Cita: ${fechaUltimaCita.year}-${_twoDigits(fechaUltimaCita.month)}-${_twoDigits(fechaUltimaCita.day)}');
  }

  void registrarDefuncion() {
    estatusVida = EstatusVida.Fallecido;
    estatusMedico = 'Inactivo';
    tipoUsuario = usuario.Finado;
    print('Defunción registrada para: $nombre $primer_apellido');
  }
}
