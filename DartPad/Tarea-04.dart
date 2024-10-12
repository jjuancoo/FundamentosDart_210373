  // Clase abstracta que representa a una persona con atributos básicos.
  abstract class Persona {
    String titulo;
    String nombre;
    String primerApellido;
    String segundoApellido;
    String genero;
    String grupoSanguineo;
    DateTime fechaNacimiento;
    String curp;

    Persona({
      required this.titulo,
      required this.nombre,
      required this.primerApellido,
      required this.segundoApellido,
      required this.genero,
      required this.grupoSanguineo,
      required this.fechaNacimiento,
      this.curp = 'No aplica',
    });

    @override
    String toString() {
      return '''
      Datos de la persona:
      
      Título: $titulo
      Nombre completo: $nombre $primerApellido $segundoApellido
      CURP: $curp
      Género: $genero, Grupo Sanguíneo: $grupoSanguineo
      Fecha de nacimiento: $fechaNacimiento
      ''';
    }
  }

  // Clase que extiende la clase abstracta Persona para representar a un paciente.
  class Paciente extends Persona {
    String nss;
    String tipoSeguro;
    String estatusVida;
    String estatusMedico;
    DateTime fechaRegistro;
    DateTime fechaUltimaCita;

    Paciente({
      required String titulo,
      required String nombre,
      required String primerApellido,
      required String segundoApellido,
      required String genero,
      required String grupoSanguineo,
      required DateTime fechaNacimiento,
      String curp = 'No aplica',
      this.nss = 'No aplica',
      required this.tipoSeguro,
      required this.estatusVida,
      required this.estatusMedico,
      required this.fechaRegistro,
      required this.fechaUltimaCita,
    }) : super(
              titulo: titulo,
              nombre: nombre,
              primerApellido: primerApellido,
              segundoApellido: segundoApellido,
              genero: genero,
              grupoSanguineo: grupoSanguineo,
              fechaNacimiento: fechaNacimiento,
              curp: curp);

    void registrarDefuncion() {
      estatusVida = 'Fallecido';
      estatusMedico = 'No aplica';
      fechaUltimaCita = DateTime.now();
      print('Se ha registrado la defunción del paciente');
    }

    @override
    String toString() {
      return '''
      ${super.toString()}
      Datos del paciente:
      NSS: $nss
      Tipo Seguro: $tipoSeguro
      Estatus de Vida: $estatusVida
      Estatus Médico: $estatusMedico
      Fecha Registro: $fechaRegistro
      Fecha Última Cita: $fechaUltimaCita
      ''';
    }
  }

  //?: Implementa un sistema basico de gestión de pacientes mediante una iterfaz llamada RegistroPaciente 

  // Interfaz para la gestión de pacientes
  //* abstract class: Sirve como base para otras clases que pueden heredar su comportamiento o implementar sus metodos.
  abstract class RegistroPaciente {
    void registrar(Paciente paciente);
    void eliminar(String nss, String nombre);
    List<Paciente> listarPacientes();
  }

  // Clase que implementa la interfaz RegistroPaciente
  class SistemaRegistro implements RegistroPaciente {
    List<Paciente> pacientes = [];

    @override
    void registrar(Paciente paciente) {
      pacientes.add(paciente);
      print('Paciente registrado: ${paciente.nombre}');
    }

    @override
    void eliminar(String nss, String nombre) {
      //removeWhere: eliminar el primer paciente que cumpla con la condicion como un filter
      pacientes.removeWhere((p) => p.nss == nss);
      print('Paciente llamado $nombre con NSS $nss eliminado.');
    }

    @override
    List<Paciente> listarPacientes() {
      return pacientes;
    }
  }

  // Función principal
  void main() {
    SistemaRegistro sistema = SistemaRegistro();

    // Paciente 1
    Paciente ana = Paciente(
      titulo: 'Lic.',
      nombre: 'Ana',
      primerApellido: 'López',
      segundoApellido: 'Gómez',
      genero: 'Femenino',
      grupoSanguineo: 'O+',
      fechaNacimiento: DateTime(1995, 4, 21),
      curp: 'LOGA950421MDFZNR02',
      nss: '654321987',
      tipoSeguro: 'Público',
      estatusVida: 'Vivo',
      estatusMedico: 'Estable',
      fechaRegistro: DateTime.now(),
      fechaUltimaCita: DateTime.now(),
    );

    sistema.registrar(ana);

    // Paciente 2
    Paciente roberto = Paciente(
      titulo: 'Dr.',
      nombre: 'Roberto',
      primerApellido: 'Fernández',
      segundoApellido: 'Sánchez',
      genero: 'Masculino',
      grupoSanguineo: 'A-',
      fechaNacimiento: DateTime(1980, 7, 15),
      curp: 'FESR800715HDFNRB07',
      nss: '111222333',
      tipoSeguro: 'Privado',
      estatusVida: 'Vivo',
      estatusMedico: 'Estable',
      fechaRegistro: DateTime(2023, 5, 15),
      fechaUltimaCita: DateTime(2024, 3, 10),
    );

    sistema.registrar(roberto);

    // Paciente 3
    Paciente maria = Paciente(
      titulo: 'Sra.',
      nombre: 'María',
      primerApellido: 'Ramírez',
      segundoApellido: 'Ortiz',
      genero: 'Femenino',
      grupoSanguineo: 'AB-',
      fechaNacimiento: DateTime(1965, 12, 5),
      curp: 'RAMO651205MDFXNR03',
      nss: '987654321',
      tipoSeguro: 'Público',
      estatusVida: 'Vivo',
      estatusMedico: 'Crítico',
      fechaRegistro: DateTime(2020, 8, 1),
      fechaUltimaCita: DateTime(2023, 9, 20),
    );

    sistema.registrar(maria);

    // Listar pacientes
    print('Lista de pacientes:');
    sistema.listarPacientes().forEach((paciente) => print(paciente));

    // Registrar defunción
    maria.registrarDefuncion();

    // Eliminar un paciente
    sistema.eliminar(ana.nss, ana.nombre);
    print('Lista de pacientes después de la eliminación:');
    sistema.listarPacientes().forEach((paciente) => print(paciente));
  }
