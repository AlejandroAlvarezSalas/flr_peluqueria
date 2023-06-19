import 'package:flutter/material.dart';
import 'package:pelucapp/screens/screens.dart';
import 'package:pelucapp/services/peluquero_services.dart';
import 'package:pelucapp/services/reservas_services.dart';
import 'package:pelucapp/services/services.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../models/models.dart';

class HorarioScreen extends StatefulWidget {
  const HorarioScreen({Key? key}) : super(key: key);

  @override
  State<HorarioScreen> createState() => _HorarioScreenState();
}

class _HorarioScreenState extends State<HorarioScreen> {
  bool btnState = true;

  DateTime selected = DateTime.now();
  DateTime now = DateTime.now();

  bool _fechaOcupada = false;

  bool _horaSeleccionada = false;

  Color _colorboton1000 = Colors.white;
  Color _colorboton1030 = Colors.white;
  Color _colorboton1100 = Colors.white;
  Color _colorboton1130 = Colors.white;
  Color _colorboton1200 = Colors.white;
  Color _colorboton1230 = Colors.white;
  Color _colorboton1300 = Colors.white;
  Color _colorboton1330 = Colors.white;
  Color _colorboton1700 = Colors.white;
  Color _colorboton1730 = Colors.white;
  Color _colorboton1800 = Colors.white;
  Color _colorboton1830 = Colors.white;
  Color _colorboton1900 = Colors.white;
  Color _colorboton1930 = Colors.white;
  Color _colorboton2000 = Colors.white;
  Color _colorboton2030 = Colors.white;

  Color _colortexto1000 = Colors.black;
  Color _colortexto1030 = Colors.black;
  Color _colortexto1100 = Colors.black;
  Color _colortexto1130 = Colors.black;
  Color _colortexto1200 = Colors.black;
  Color _colortexto1230 = Colors.black;
  Color _colortexto1300 = Colors.black;
  Color _colortexto1330 = Colors.black;
  Color _colortexto1700 = Colors.black;
  Color _colortexto1730 = Colors.black;
  Color _colortexto1800 = Colors.black;
  Color _colortexto1830 = Colors.black;
  Color _colortexto1900 = Colors.black;
  Color _colortexto1930 = Colors.black;
  Color _colortexto2000 = Colors.black;
  Color _colortexto2030 = Colors.black;

  List<DateTime> fechaSeleccionadas = [];

  reiniciarColores() {
    _colorboton1000 = Colors.white;
    _colorboton1030 = Colors.white;
    _colorboton1100 = Colors.white;
    _colorboton1130 = Colors.white;
    _colorboton1200 = Colors.white;
    _colorboton1230 = Colors.white;
    _colorboton1300 = Colors.white;
    _colorboton1330 = Colors.white;
    _colorboton1700 = Colors.white;
    _colorboton1730 = Colors.white;
    _colorboton1800 = Colors.white;
    _colorboton1830 = Colors.white;
    _colorboton1900 = Colors.white;
    _colorboton1930 = Colors.white;
    _colorboton2000 = Colors.white;
    _colorboton2030 = Colors.white;

    _colortexto1000 = Colors.black;
    _colortexto1030 = Colors.black;
    _colortexto1100 = Colors.black;
    _colortexto1130 = Colors.black;
    _colortexto1200 = Colors.black;
    _colortexto1230 = Colors.black;
    _colortexto1300 = Colors.black;
    _colortexto1330 = Colors.black;
    _colortexto1700 = Colors.black;
    _colortexto1730 = Colors.black;
    _colortexto1800 = Colors.black;
    _colortexto1830 = Colors.black;
    _colortexto1900 = Colors.black;
    _colortexto1930 = Colors.black;
    _colortexto2000 = Colors.black;
    _colortexto2030 = Colors.black;
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selected = day;
    });
    reiniciarColores();
    fechaSeleccionadas.clear();
  }

  @override
  Widget build(BuildContext context) {
    /*List<Color> colorArray = [
      _colorboton1000,
      _colorboton1030,
      _colorboton1100,
      _colorboton1130,
      _colorboton1200,
      _colorboton1230,
      _colorboton1300,
      _colorboton1330,
      _colorboton1700,
      _colorboton1730,
      _colorboton1800,
      _colorboton1830,
      _colorboton1900,
      _colorboton1930,
    ];*/

    /*void resetearColores() {
      for (var color in colorArray) {
        if (color != AppTheme.primary) color = AppTheme.primary;
      }
    }*/
    final reservasServices = Provider.of<ReservaServices>(context);
    final peluquerosServices = Provider.of<PeluquerosServices>(context);
    final serviciosServices = Provider.of<ServiciosServices>(context);

    void swapSeleccionada() {
      if (_horaSeleccionada) {
        _horaSeleccionada = false;
      } else {
        setState(() {
          _horaSeleccionada = true;
        });
      }
    }

    bool fechaOcupada() {
      List<Reserva> reservas = reservasServices.reservas;
      List<DateTime> fechaSeleccionadas = this.fechaSeleccionadas;
      String peluqueroSeleccionadoId =
          peluquerosServices.peluqueroSeleccionado!.id!;

      List<String> fechasReservas = reservas
          .where((reserva) =>
              reserva.peluquero == peluqueroSeleccionadoId &&
              !reserva.cancelada)
          .expand((reserva) => reserva.fecha)
          .map((fecha) => fecha.toString())
          .toList();

      List<String> fechasFormateadas =
          fechaSeleccionadas.map((fecha) => fecha.toString()).toList();

      for (var fechaReserva in fechasReservas) {
        if (fechasFormateadas.contains(fechaReserva)) {
          return true;
        }
      }

      return false;
    }

    tipoFecha() {
      for (var reserva in reservasServices.reservas) {
        for (var fecha in reserva.fecha) {
          if (fecha is! String) {
            print(fecha);
          }
        }
      }
    }

    /*cambiarColores(Color fondo, Color texto) {
      if (fondo == Colors.white) {
        fondo = Colors.black;
      } else {
        fondo = Colors.white;
      }

      if (texto == Colors.white) {
        texto = Colors.black;
      } else {
        texto = Colors.white;
      }
    }*/

    actualizarfechas(DateTime fecha) {
      if (fechaSeleccionadas.contains(fecha)) {
        fechaSeleccionadas.remove(fecha);
      } else {
        fechaSeleccionadas.add(fecha);
      }

      fechaSeleccionadas.sort();
    }

    int calcularDiferenciaEnMinutos() {
      if (fechaSeleccionadas.isEmpty) {
        return 0;
      }

      DateTime primeraFecha = fechaSeleccionadas.first;
      DateTime ultimaFecha = fechaSeleccionadas.last;

      Duration diferencia = ultimaFecha.difference(primeraFecha);
      int diferenciaEnMinutos = diferencia.inMinutes;

      return diferenciaEnMinutos;
    }

    bool verificarSeparacion() {
      if (fechaSeleccionadas.length < 2) {
        // No hay suficientes elementos en la lista para verificar la separación
        return true;
      }

      for (int i = 0; i < fechaSeleccionadas.length - 1; i++) {
        DateTime fechaActual = fechaSeleccionadas[i];
        DateTime fechaSiguiente = fechaSeleccionadas[i + 1];

        Duration diferencia = fechaSiguiente.difference(fechaActual);
        int diferenciaEnMinutos = diferencia.inMinutes;

        if (diferenciaEnMinutos != 30) {
          // La separación entre fechas es diferente a 30 minutos
          return false;
        }
      }

      // Todas las fechas cumplen con la separación mínima de 30 minutos
      return true;
    }

    /*bool horasValidas() {
      bool resultado = false;

      int totalMinutos = 0;
      int diferenciaMinutos = calcularDiferenciaEnMinutos();

      for (var servicio in serviciosServices.ServiciosSeleccionados) {
        totalMinutos += servicio.tiempo;
      }

      if (totalMinutos == diferenciaMinutos) {
        resultado = true;
      }

      return resultado;
    }*/

    int calcularHoras() {
      int totalMinutos = 0;
      int numeroTramos = 0;

      //Sumo el tiempo total
      for (var servicio in serviciosServices.ServiciosSeleccionados) {
        totalMinutos += servicio.tiempo;
      }

      //calculo el número de tramos
      numeroTramos = (totalMinutos / 30).truncate();
      if (totalMinutos % 30 != 0) {
        numeroTramos++;
      }

      return numeroTramos;
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new, color: AppTheme.mainTextColor),
          ),
          title: BigText(
            text: 'PELUCAPP',
            color: AppTheme.primary,
            size: 25,
          ),
        ),
        body: Column(
          children: [
            TableCalendar(
              startingDayOfWeek: StartingDayOfWeek.monday,
              locale: 'es_ES' /*'en_US'*/,
              rowHeight: 50,
              calendarFormat: CalendarFormat.week,
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false, titleCentered: true),
              firstDay: now /*now*/,
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, selected),
              focusedDay: selected,
              lastDay: DateTime.utc(2030, 3, 14),
              onDaySelected: _onDaySelected,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 4.0,
                                backgroundColor: _colorboton1000,
                                side: BorderSide(color: Colors.black),
                              ),
                              onPressed: () {
                                //tipoFecha();
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 10, 00, 0, 0);

                                actualizarfechas(selected);

                                _fechaOcupada = fechaOcupada();
                                setState(() {
                                  _horaSeleccionada = true;

                                  Color nuevoFondo =
                                      _colorboton1000 == Colors.white
                                          ? Colors.black
                                          : Colors.white;
                                  Color nuevoTexto =
                                      _colortexto1000 == Colors.white
                                          ? Colors.black
                                          : Colors.white;

                                  _colorboton1000 = nuevoFondo;
                                  _colortexto1000 = nuevoTexto;

                                  //reiniciarColores();
                                  /*cambiarColores(
                                      _colorboton1000, _colortexto1000);*/
                                  /*_colorboton1000 = Colors.black;
                                  _colortexto1000 = Colors.white;*/
                                });
                                /*setState(() {
                                    _colorboton1000 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text(
                                "10:00",
                                style: TextStyle(color: _colortexto1000),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 4.0,
                                backgroundColor: _colorboton1030,
                                side: BorderSide(color: Colors.black),
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 10, 30, 0, 0);

                                actualizarfechas(selected);

                                _fechaOcupada = fechaOcupada();
                                setState(() {
                                  _horaSeleccionada = true;

                                  Color nuevoFondo =
                                      _colorboton1030 == Colors.white
                                          ? Colors.black
                                          : Colors.white;
                                  Color nuevoTexto =
                                      _colortexto1030 == Colors.white
                                          ? Colors.black
                                          : Colors.white;

                                  _colorboton1030 = nuevoFondo;
                                  _colortexto1030 = nuevoTexto;

                                  //reiniciarColores();
                                  /*cambiarColores(
                                      _colorboton1030, _colortexto1030);*/
                                  /*_colorboton1030 = Colors.black;
                                  _colortexto1030 = Colors.white;*/
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text(
                                "10:30",
                                style: TextStyle(color: _colortexto1030),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 4.0,
                                backgroundColor: _colorboton1100,
                                side: BorderSide(color: Colors.black),
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 11, 00, 0, 0);

                                actualizarfechas(selected);

                                _fechaOcupada = fechaOcupada();
                                setState(() {
                                  _horaSeleccionada = true;

                                  Color nuevoFondo =
                                      _colorboton1100 == Colors.white
                                          ? Colors.black
                                          : Colors.white;
                                  Color nuevoTexto =
                                      _colortexto1100 == Colors.white
                                          ? Colors.black
                                          : Colors.white;

                                  _colorboton1100 = nuevoFondo;
                                  _colortexto1100 = nuevoTexto;

                                  //reiniciarColores();
                                  /*cambiarColores(
                                      _colorboton1100, _colortexto1100);*/
                                  /*_colorboton1100 = Colors.black;
                                  _colortexto1100 = Colors.white;*/
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text(
                                "11:00",
                                style: TextStyle(color: _colortexto1100),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 4.0,
                                backgroundColor: _colorboton1130,
                                side: BorderSide(color: Colors.black),
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 11, 30, 0, 0);

                                actualizarfechas(selected);

                                _fechaOcupada = fechaOcupada();
                                setState(() {
                                  _horaSeleccionada = true;

                                  Color nuevoFondo =
                                      _colorboton1130 == Colors.white
                                          ? Colors.black
                                          : Colors.white;
                                  Color nuevoTexto =
                                      _colortexto1130 == Colors.white
                                          ? Colors.black
                                          : Colors.white;

                                  _colorboton1130 = nuevoFondo;
                                  _colortexto1130 = nuevoTexto;

                                  //reiniciarColores();
                                  /*cambiarColores(
                                      _colorboton1130, _colortexto1130);*/
                                  /*_colorboton1130 = Colors.black;
                                  _colortexto1130 = Colors.white;*/
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text(
                                "11:30",
                                style: TextStyle(color: _colortexto1130),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 4.0,
                                backgroundColor: _colorboton1200,
                                side: BorderSide(color: Colors.black),
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 12, 00, 0, 0);

                                actualizarfechas(selected);

                                _fechaOcupada = fechaOcupada();
                                setState(() {
                                  _horaSeleccionada = true;

                                  Color nuevoFondo =
                                      _colorboton1200 == Colors.white
                                          ? Colors.black
                                          : Colors.white;
                                  Color nuevoTexto =
                                      _colortexto1200 == Colors.white
                                          ? Colors.black
                                          : Colors.white;

                                  _colorboton1200 = nuevoFondo;
                                  _colortexto1200 = nuevoTexto;

                                  //reiniciarColores();
                                  /*cambiarColores(
                                      _colorboton1200, _colortexto1200);*/
                                  /* _colorboton1200 = Colors.black;
                                  _colortexto1200 = Colors.white;*/
                                });

                                /*setState(() {
                                    _colorboton1000 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text(
                                "12:00",
                                style: TextStyle(color: _colortexto1200),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 4.0,
                                backgroundColor: _colorboton1230,
                                side: BorderSide(color: Colors.black),
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 12, 30, 0, 0);

                                actualizarfechas(selected);

                                _fechaOcupada = fechaOcupada();
                                setState(() {
                                  _horaSeleccionada = true;

                                  Color nuevoFondo =
                                      _colorboton1230 == Colors.white
                                          ? Colors.black
                                          : Colors.white;
                                  Color nuevoTexto =
                                      _colortexto1230 == Colors.white
                                          ? Colors.black
                                          : Colors.white;

                                  _colorboton1230 = nuevoFondo;
                                  _colortexto1230 = nuevoTexto;

                                  //reiniciarColores();
                                  /*cambiarColores(
                                      _colorboton1230, _colortexto1230);*/
                                  /*_colorboton1230 = Colors.black;
                                  _colortexto1230 = Colors.white;*/
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text(
                                "12:30",
                                style: TextStyle(color: _colortexto1230),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 4.0,
                                backgroundColor: _colorboton1300,
                                side: BorderSide(color: Colors.black),
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 13, 00, 0, 0);

                                actualizarfechas(selected);

                                _fechaOcupada = fechaOcupada();
                                setState(() {
                                  _horaSeleccionada = true;

                                  Color nuevoFondo =
                                      _colorboton1300 == Colors.white
                                          ? Colors.black
                                          : Colors.white;
                                  Color nuevoTexto =
                                      _colortexto1300 == Colors.white
                                          ? Colors.black
                                          : Colors.white;

                                  _colorboton1300 = nuevoFondo;
                                  _colortexto1300 = nuevoTexto;

                                  //reiniciarColores();
                                  /*cambiarColores(
                                      _colorboton1300, _colortexto1300);*/
                                  /*_colorboton1300 = Colors.black;
                                  _colortexto1300 = Colors.white;*/
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text(
                                "13:00",
                                style: TextStyle(color: _colortexto1300),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 4.0,
                                backgroundColor: _colorboton1330,
                                side: BorderSide(color: Colors.black),
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 13, 30, 0, 0);

                                actualizarfechas(selected);

                                _fechaOcupada = fechaOcupada();
                                setState(() {
                                  _horaSeleccionada = true;

                                  Color nuevoFondo =
                                      _colorboton1330 == Colors.white
                                          ? Colors.black
                                          : Colors.white;
                                  Color nuevoTexto =
                                      _colortexto1330 == Colors.white
                                          ? Colors.black
                                          : Colors.white;

                                  _colorboton1330 = nuevoFondo;
                                  _colortexto1330 = nuevoTexto;

                                  //reiniciarColores();
                                  /*cambiarColores(
                                      _colorboton1330, _colortexto1330);*/
                                  /*_colorboton1330 = Colors.black;
                                  _colortexto1330 = Colors.white;*/
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text(
                                "13:30",
                                style: TextStyle(color: _colortexto1330),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 4.0,
                                backgroundColor: _colorboton1700,
                                side: BorderSide(color: Colors.black),
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 17, 00, 0, 0);

                                actualizarfechas(selected);

                                _fechaOcupada = fechaOcupada();
                                setState(() {
                                  _horaSeleccionada = true;

                                  Color nuevoFondo =
                                      _colorboton1700 == Colors.white
                                          ? Colors.black
                                          : Colors.white;
                                  Color nuevoTexto =
                                      _colortexto1700 == Colors.white
                                          ? Colors.black
                                          : Colors.white;

                                  _colorboton1700 = nuevoFondo;
                                  _colortexto1700 = nuevoTexto;

                                  //reiniciarColores();
                                  /*cambiarColores(
                                      _colorboton1700, _colortexto1700);*/
                                  /*_colorboton1700 = Colors.black;
                                  _colortexto1700 = Colors.white;*/
                                });
                                /*setState(() {
                                    _colorboton1000 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text(
                                "17:00",
                                style: TextStyle(color: _colortexto1700),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 4.0,
                                backgroundColor: _colorboton1730,
                                side: BorderSide(color: Colors.black),
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 17, 30, 0, 0);

                                actualizarfechas(selected);

                                _fechaOcupada = fechaOcupada();
                                setState(() {
                                  _horaSeleccionada = true;

                                  Color nuevoFondo =
                                      _colorboton1730 == Colors.white
                                          ? Colors.black
                                          : Colors.white;
                                  Color nuevoTexto =
                                      _colortexto1730 == Colors.white
                                          ? Colors.black
                                          : Colors.white;

                                  _colorboton1730 = nuevoFondo;
                                  _colortexto1730 = nuevoTexto;

                                  //reiniciarColores();
                                  /*cambiarColores(
                                      _colorboton1730, _colortexto1730);*/
                                  /*_colorboton1730 = Colors.black;
                                  _colortexto1730 = Colors.white;*/
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text(
                                "17:30",
                                style: TextStyle(color: _colortexto1730),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 4.0,
                                backgroundColor: _colorboton1800,
                                side: BorderSide(color: Colors.black),
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 18, 00, 0, 0);

                                actualizarfechas(selected);

                                _fechaOcupada = fechaOcupada();
                                setState(() {
                                  _horaSeleccionada = true;

                                  Color nuevoFondo =
                                      _colorboton1800 == Colors.white
                                          ? Colors.black
                                          : Colors.white;
                                  Color nuevoTexto =
                                      _colortexto1800 == Colors.white
                                          ? Colors.black
                                          : Colors.white;

                                  _colorboton1800 = nuevoFondo;
                                  _colortexto1800 = nuevoTexto;

                                  //reiniciarColores();
                                  /*cambiarColores(
                                      _colorboton1800, _colortexto1800);*/
                                  /*_colorboton1800 = Colors.black;
                                  _colortexto1800 = Colors.white;*/
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text(
                                "18:00",
                                style: TextStyle(color: _colortexto1800),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 4.0,
                                backgroundColor: _colorboton1830,
                                side: BorderSide(color: Colors.black),
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 18, 30, 0, 0);

                                actualizarfechas(selected);

                                _fechaOcupada = fechaOcupada();
                                setState(() {
                                  _horaSeleccionada = true;

                                  Color nuevoFondo =
                                      _colorboton1830 == Colors.white
                                          ? Colors.black
                                          : Colors.white;
                                  Color nuevoTexto =
                                      _colortexto1830 == Colors.white
                                          ? Colors.black
                                          : Colors.white;

                                  _colorboton1830 = nuevoFondo;
                                  _colortexto1830 = nuevoTexto;

                                  //reiniciarColores();
                                  /*cambiarColores(
                                      _colorboton1830, _colortexto1830);*/
                                  /*_colorboton1830 = Colors.black;
                                  _colortexto1830 = Colors.white;*/
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text(
                                "18:30",
                                style: TextStyle(color: _colortexto1830),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 4.0,
                                backgroundColor: _colorboton1900,
                                side: BorderSide(color: Colors.black),
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 19, 00, 0, 0);

                                actualizarfechas(selected);

                                _fechaOcupada = fechaOcupada();
                                setState(() {
                                  _horaSeleccionada = true;

                                  Color nuevoFondo =
                                      _colorboton1900 == Colors.white
                                          ? Colors.black
                                          : Colors.white;
                                  Color nuevoTexto =
                                      _colortexto1900 == Colors.white
                                          ? Colors.black
                                          : Colors.white;

                                  _colorboton1900 = nuevoFondo;
                                  _colortexto1900 = nuevoTexto;

                                  //reiniciarColores();
                                  /*cambiarColores(
                                      _colorboton1900, _colortexto1900);*/
                                  /*_colorboton1900 = Colors.black;
                                  _colortexto1900 = Colors.white;*/
                                });
                                /*setState(() {
                                    _colorboton1000 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text(
                                "19:00",
                                style: TextStyle(color: _colortexto1900),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 4.0,
                                backgroundColor: _colorboton1930,
                                side: BorderSide(color: Colors.black),
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 19, 30, 0, 0);

                                actualizarfechas(selected);

                                _fechaOcupada = fechaOcupada();
                                setState(() {
                                  _horaSeleccionada = true;

                                  Color nuevoFondo =
                                      _colorboton1930 == Colors.white
                                          ? Colors.black
                                          : Colors.white;
                                  Color nuevoTexto =
                                      _colortexto1930 == Colors.white
                                          ? Colors.black
                                          : Colors.white;

                                  _colorboton1930 = nuevoFondo;
                                  _colortexto1930 = nuevoTexto;

                                  //reiniciarColores();
                                  /*cambiarColores(
                                      _colorboton1930, _colortexto1930);*/
                                  /*_colorboton1930 = Colors.black;
                                  _colortexto1930 = Colors.white;*/
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text(
                                "19:30",
                                style: TextStyle(color: _colortexto1930),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 4.0,
                                backgroundColor: _colorboton2000,
                                side: BorderSide(color: Colors.black),
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 20, 00, 0, 0);

                                actualizarfechas(selected);

                                _fechaOcupada = fechaOcupada();
                                setState(() {
                                  _horaSeleccionada = true;

                                  Color nuevoFondo =
                                      _colorboton2000 == Colors.white
                                          ? Colors.black
                                          : Colors.white;
                                  Color nuevoTexto =
                                      _colortexto2000 == Colors.white
                                          ? Colors.black
                                          : Colors.white;

                                  _colorboton2000 = nuevoFondo;
                                  _colortexto2000 = nuevoTexto;

                                  //reiniciarColores();
                                  /*cambiarColores(
                                      _colorboton2000, _colortexto2000);*/
                                  /*_colorboton2000 = Colors.black;
                                  _colortexto2000 = Colors.white;*/
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text(
                                "20:00",
                                style: TextStyle(color: _colortexto2000),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 4.0,
                                backgroundColor: _colorboton2030,
                                side: BorderSide(color: Colors.black),
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 20, 30, 0, 0);

                                actualizarfechas(selected);

                                _fechaOcupada = fechaOcupada();
                                setState(() {
                                  _horaSeleccionada = true;

                                  Color nuevoFondo =
                                      _colorboton2030 == Colors.white
                                          ? Colors.black
                                          : Colors.white;
                                  Color nuevoTexto =
                                      _colortexto2030 == Colors.white
                                          ? Colors.black
                                          : Colors.white;

                                  _colorboton2030 = nuevoFondo;
                                  _colortexto2030 = nuevoTexto;

                                  //reiniciarColores();
                                  /*cambiarColores(
                                      _colorboton2030, _colortexto2030);*/
                                  /*_colorboton2030 = Colors.black;
                                  _colortexto2030 = Colors.white;*/
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text(
                                "20:30",
                                style: TextStyle(color: _colortexto2030),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: (fechaSeleccionadas
                            .isEmpty || //compruebo los casos excluyentes, si alguno es true no me valen las fechas
                        fechaSeleccionadas.length != calcularHoras() ||
                        fechaSeleccionadas.first.isBefore(
                            now) || //compruebo si la primera hora ya ha pasado
                        !verificarSeparacion() ||
                        _fechaOcupada)
                    ? null
                    : () => {
                          Navigator.pushNamed(context, 'resumen',
                              arguments: fechaSeleccionadas)
                        },
                child: const Text('Siguiente', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ));
  }
}
