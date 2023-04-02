import 'package:flutter/material.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class HorarioScreen extends StatefulWidget {
  const HorarioScreen({Key? key}) : super(key: key);

  @override
  State<HorarioScreen> createState() => _HorarioScreenState();
}

class _HorarioScreenState extends State<HorarioScreen> {
  bool btnState = true;

  DateTime selected = DateTime.now();
  DateTime now = DateTime.now();

  bool _horaSeleccionada = false;

  Color _colorboton1000 = AppTheme.backgroundColor;

  Color _colorboton1030 = AppTheme.backgroundColor;

  Color _colorboton1100 = AppTheme.backgroundColor;

  Color _colorboton1130 = AppTheme.backgroundColor;

  Color _colorboton1200 = AppTheme.backgroundColor;

  Color _colorboton1230 = AppTheme.backgroundColor;

  Color _colorboton1300 = AppTheme.backgroundColor;

  Color _colorboton1330 = AppTheme.backgroundColor;

  Color _colorboton1700 = AppTheme.backgroundColor;

  Color _colorboton1730 = AppTheme.backgroundColor;

  Color _colorboton1800 = AppTheme.backgroundColor;

  Color _colorboton1830 = AppTheme.backgroundColor;

  Color _colorboton1900 = AppTheme.backgroundColor;

  Color _colorboton1930 = AppTheme.backgroundColor;

  Color _colorboton2000 = AppTheme.backgroundColor;

  Color _colorboton2030 = AppTheme.backgroundColor;

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selected = day;
    });
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

    void swapSeleccionada() {
      if (_horaSeleccionada) {
        _horaSeleccionada = false;
      } else {
        setState(() {
          _horaSeleccionada = true;
        });
      }
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
              locale: 'en_US',
              rowHeight: 50,
              calendarFormat: CalendarFormat.week,
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false, titleCentered: true),
              firstDay: now,
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
                                side: const BorderSide(width: 2, color: AppTheme.primary),
                                primary: _colorboton1000,
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 10, 00, 0, 0);
                                setState(() {
                                  _horaSeleccionada = true;
                                  _colorboton1000 = AppTheme.backgroundColor;

                                  _colorboton1030 = AppTheme.backgroundColor;

                                  _colorboton1100 = AppTheme.backgroundColor;

                                  _colorboton1130 = AppTheme.backgroundColor;

                                  _colorboton1200 = AppTheme.backgroundColor;

                                  _colorboton1230 = AppTheme.backgroundColor;

                                  _colorboton1300 = AppTheme.backgroundColor;

                                  _colorboton1330 = AppTheme.backgroundColor;

                                  _colorboton1700 = AppTheme.backgroundColor;

                                  _colorboton1730 = AppTheme.backgroundColor;

                                  _colorboton1800 = AppTheme.backgroundColor;

                                  _colorboton1830 = AppTheme.backgroundColor;

                                  _colorboton1900 = AppTheme.backgroundColor;

                                  _colorboton1930 = AppTheme.backgroundColor;

                                  _colorboton2000 = AppTheme.backgroundColor;

                                  _colorboton2030 = AppTheme.backgroundColor;
                                  _colorboton1000 = AppTheme.secondary;
                                });
                                /*setState(() {
                                    _colorboton1000 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text("10:00", style: TextStyle(color: AppTheme.mainTextColor),),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(width: 2, color: AppTheme.primary),
                                primary: _colorboton1030,
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 10, 30, 0, 0);
                                setState(() {
                                  _horaSeleccionada = true;
                                  _colorboton1000 = AppTheme.backgroundColor;

                                  _colorboton1030 = AppTheme.backgroundColor;

                                  _colorboton1100 = AppTheme.backgroundColor;

                                  _colorboton1130 = AppTheme.backgroundColor;

                                  _colorboton1200 = AppTheme.backgroundColor;

                                  _colorboton1230 = AppTheme.backgroundColor;

                                  _colorboton1300 = AppTheme.backgroundColor;

                                  _colorboton1330 = AppTheme.backgroundColor;

                                  _colorboton1700 = AppTheme.backgroundColor;

                                  _colorboton1730 = AppTheme.backgroundColor;

                                  _colorboton1800 = AppTheme.backgroundColor;

                                  _colorboton1830 = AppTheme.backgroundColor;

                                  _colorboton1900 = AppTheme.backgroundColor;

                                  _colorboton1930 = AppTheme.backgroundColor;

                                  _colorboton2000 = AppTheme.backgroundColor;

                                  _colorboton2030 = AppTheme.backgroundColor;
                                  _colorboton1030 = AppTheme.secondary;
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text("10:30", style: TextStyle(color: AppTheme.mainTextColor),),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(width: 2, color: AppTheme.primary),
                                primary: _colorboton1100,
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 11, 00, 0, 0);
                                setState(() {
                                  _horaSeleccionada = true;
                                  _colorboton1000 = AppTheme.backgroundColor;

                                  _colorboton1030 = AppTheme.backgroundColor;

                                  _colorboton1100 = AppTheme.backgroundColor;

                                  _colorboton1130 = AppTheme.backgroundColor;

                                  _colorboton1200 = AppTheme.backgroundColor;

                                  _colorboton1230 = AppTheme.backgroundColor;

                                  _colorboton1300 = AppTheme.backgroundColor;

                                  _colorboton1330 = AppTheme.backgroundColor;

                                  _colorboton1700 = AppTheme.backgroundColor;

                                  _colorboton1730 = AppTheme.backgroundColor;

                                  _colorboton1800 = AppTheme.backgroundColor;

                                  _colorboton1830 = AppTheme.backgroundColor;

                                  _colorboton1900 = AppTheme.backgroundColor;

                                  _colorboton1930 = AppTheme.backgroundColor;

                                  _colorboton2000 = AppTheme.backgroundColor;

                                  _colorboton2030 = AppTheme.backgroundColor;
                                  _colorboton1100 = AppTheme.secondary;
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text("11:00", style: TextStyle(color: AppTheme.mainTextColor),),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(width: 2, color: AppTheme.primary),
                                primary: _colorboton1130,
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 11, 30, 0, 0);
                                setState(() {
                                  _horaSeleccionada = true;
                                  _colorboton1000 = AppTheme.backgroundColor;

                                  _colorboton1030 = AppTheme.backgroundColor;

                                  _colorboton1100 = AppTheme.backgroundColor;

                                  _colorboton1130 = AppTheme.backgroundColor;

                                  _colorboton1200 = AppTheme.backgroundColor;

                                  _colorboton1230 = AppTheme.backgroundColor;

                                  _colorboton1300 = AppTheme.backgroundColor;

                                  _colorboton1330 = AppTheme.backgroundColor;

                                  _colorboton1700 = AppTheme.backgroundColor;

                                  _colorboton1730 = AppTheme.backgroundColor;

                                  _colorboton1800 = AppTheme.backgroundColor;

                                  _colorboton1830 = AppTheme.backgroundColor;

                                  _colorboton1900 = AppTheme.backgroundColor;

                                  _colorboton1930 = AppTheme.backgroundColor;

                                  _colorboton2000 = AppTheme.backgroundColor;

                                  _colorboton2030 = AppTheme.backgroundColor;
                                  _colorboton1130 = AppTheme.secondary;
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text("11:30", style: TextStyle(color: AppTheme.mainTextColor),),
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
                                side: const BorderSide(width: 2, color: AppTheme.primary),
                                primary: _colorboton1200,
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 12, 00, 0, 0);

                                setState(() {
                                  _horaSeleccionada = true;
                                  _colorboton1000 = AppTheme.backgroundColor;

                                  _colorboton1030 = AppTheme.backgroundColor;

                                  _colorboton1100 = AppTheme.backgroundColor;

                                  _colorboton1130 = AppTheme.backgroundColor;

                                  _colorboton1200 = AppTheme.backgroundColor;

                                  _colorboton1230 = AppTheme.backgroundColor;

                                  _colorboton1300 = AppTheme.backgroundColor;

                                  _colorboton1330 = AppTheme.backgroundColor;

                                  _colorboton1700 = AppTheme.backgroundColor;

                                  _colorboton1730 = AppTheme.backgroundColor;

                                  _colorboton1800 = AppTheme.backgroundColor;

                                  _colorboton1830 = AppTheme.backgroundColor;

                                  _colorboton1900 = AppTheme.backgroundColor;

                                  _colorboton1930 = AppTheme.backgroundColor;

                                  _colorboton2000 = AppTheme.backgroundColor;

                                  _colorboton2030 = AppTheme.backgroundColor;
                                  _colorboton1200 = AppTheme.secondary;
                                });

                                /*setState(() {
                                    _colorboton1000 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text("12:00", style: TextStyle(color: AppTheme.mainTextColor),),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(width: 2, color: AppTheme.primary),
                                primary: _colorboton1230,
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 12, 30, 0, 0);
                                setState(() {
                                  _horaSeleccionada = true;
                                  _colorboton1000 = AppTheme.backgroundColor;

                                  _colorboton1030 = AppTheme.backgroundColor;

                                  _colorboton1100 = AppTheme.backgroundColor;

                                  _colorboton1130 = AppTheme.backgroundColor;

                                  _colorboton1200 = AppTheme.backgroundColor;

                                  _colorboton1230 = AppTheme.backgroundColor;

                                  _colorboton1300 = AppTheme.backgroundColor;

                                  _colorboton1330 = AppTheme.backgroundColor;

                                  _colorboton1700 = AppTheme.backgroundColor;

                                  _colorboton1730 = AppTheme.backgroundColor;

                                  _colorboton1800 = AppTheme.backgroundColor;

                                  _colorboton1830 = AppTheme.backgroundColor;

                                  _colorboton1900 = AppTheme.backgroundColor;

                                  _colorboton1930 = AppTheme.backgroundColor;

                                  _colorboton2000 = AppTheme.backgroundColor;

                                  _colorboton2030 = AppTheme.backgroundColor;
                                  _colorboton1230 = AppTheme.secondary;
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text("12:30", style: TextStyle(color: AppTheme.mainTextColor),),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(width: 2, color: AppTheme.primary),
                                primary: _colorboton1300,
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 13, 00, 0, 0);
                                setState(() {
                                  _horaSeleccionada = true;
                                  _colorboton1000 = AppTheme.backgroundColor;

                                  _colorboton1030 = AppTheme.backgroundColor;

                                  _colorboton1100 = AppTheme.backgroundColor;

                                  _colorboton1130 = AppTheme.backgroundColor;

                                  _colorboton1200 = AppTheme.backgroundColor;

                                  _colorboton1230 = AppTheme.backgroundColor;

                                  _colorboton1300 = AppTheme.backgroundColor;

                                  _colorboton1330 = AppTheme.backgroundColor;

                                  _colorboton1700 = AppTheme.backgroundColor;

                                  _colorboton1730 = AppTheme.backgroundColor;

                                  _colorboton1800 = AppTheme.backgroundColor;

                                  _colorboton1830 = AppTheme.backgroundColor;

                                  _colorboton1900 = AppTheme.backgroundColor;

                                  _colorboton1930 = AppTheme.backgroundColor;

                                  _colorboton2000 = AppTheme.backgroundColor;

                                  _colorboton2030 = AppTheme.backgroundColor;
                                  _colorboton1300 = AppTheme.secondary;
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text("13:00", style: TextStyle(color: AppTheme.mainTextColor),),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(width: 2, color: AppTheme.primary),
                                primary: _colorboton1330,
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 13, 30, 0, 0);
                                setState(() {
                                  _horaSeleccionada = true;
                                  _colorboton1000 = AppTheme.backgroundColor;

                                  _colorboton1030 = AppTheme.backgroundColor;

                                  _colorboton1100 = AppTheme.backgroundColor;

                                  _colorboton1130 = AppTheme.backgroundColor;

                                  _colorboton1200 = AppTheme.backgroundColor;

                                  _colorboton1230 = AppTheme.backgroundColor;

                                  _colorboton1300 = AppTheme.backgroundColor;

                                  _colorboton1330 = AppTheme.backgroundColor;

                                  _colorboton1700 = AppTheme.backgroundColor;

                                  _colorboton1730 = AppTheme.backgroundColor;

                                  _colorboton1800 = AppTheme.backgroundColor;

                                  _colorboton1830 = AppTheme.backgroundColor;

                                  _colorboton1900 = AppTheme.backgroundColor;

                                  _colorboton1930 = AppTheme.backgroundColor;

                                  _colorboton2000 = AppTheme.backgroundColor;

                                  _colorboton2030 = AppTheme.backgroundColor;
                                  _colorboton1330 = AppTheme.secondary;
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text("13:30", style: TextStyle(color: AppTheme.mainTextColor),),
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
                                side: const BorderSide(width: 2, color: AppTheme.primary),
                                primary: _colorboton1700,
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 17, 00, 0, 0);
                                setState(() {
                                  _horaSeleccionada = true;
                                  _colorboton1000 = AppTheme.backgroundColor;

                                  _colorboton1030 = AppTheme.backgroundColor;

                                  _colorboton1100 = AppTheme.backgroundColor;

                                  _colorboton1130 = AppTheme.backgroundColor;

                                  _colorboton1200 = AppTheme.backgroundColor;

                                  _colorboton1230 = AppTheme.backgroundColor;

                                  _colorboton1300 = AppTheme.backgroundColor;

                                  _colorboton1330 = AppTheme.backgroundColor;

                                  _colorboton1700 = AppTheme.backgroundColor;

                                  _colorboton1730 = AppTheme.backgroundColor;

                                  _colorboton1800 = AppTheme.backgroundColor;

                                  _colorboton1830 = AppTheme.backgroundColor;

                                  _colorboton1900 = AppTheme.backgroundColor;

                                  _colorboton1930 = AppTheme.backgroundColor;

                                  _colorboton2000 = AppTheme.backgroundColor;

                                  _colorboton2030 = AppTheme.backgroundColor;
                                  _colorboton1700 = AppTheme.secondary;
                                });
                                /*setState(() {
                                    _colorboton1000 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text("17:00", style: TextStyle(color: AppTheme.mainTextColor),),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(width: 2, color: AppTheme.primary),
                                primary: _colorboton1730,
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 17, 30, 0, 0);
                                setState(() {
                                  _horaSeleccionada = true;
                                  _colorboton1000 = AppTheme.backgroundColor;

                                  _colorboton1030 = AppTheme.backgroundColor;

                                  _colorboton1100 = AppTheme.backgroundColor;

                                  _colorboton1130 = AppTheme.backgroundColor;

                                  _colorboton1200 = AppTheme.backgroundColor;

                                  _colorboton1230 = AppTheme.backgroundColor;

                                  _colorboton1300 = AppTheme.backgroundColor;

                                  _colorboton1330 = AppTheme.backgroundColor;

                                  _colorboton1700 = AppTheme.backgroundColor;

                                  _colorboton1730 = AppTheme.backgroundColor;

                                  _colorboton1800 = AppTheme.backgroundColor;

                                  _colorboton1830 = AppTheme.backgroundColor;

                                  _colorboton1900 = AppTheme.backgroundColor;

                                  _colorboton1930 = AppTheme.backgroundColor;

                                  _colorboton2000 = AppTheme.backgroundColor;

                                  _colorboton2030 = AppTheme.backgroundColor;
                                  _colorboton1730 = AppTheme.secondary;
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text("17:30", style: TextStyle(color: AppTheme.mainTextColor),),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(width: 2, color: AppTheme.primary),
                                primary: _colorboton1800,
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 18, 00, 0, 0);
                                setState(() {
                                  _horaSeleccionada = true;
                                  _colorboton1000 = AppTheme.backgroundColor;

                                  _colorboton1030 = AppTheme.backgroundColor;

                                  _colorboton1100 = AppTheme.backgroundColor;

                                  _colorboton1130 = AppTheme.backgroundColor;

                                  _colorboton1200 = AppTheme.backgroundColor;

                                  _colorboton1230 = AppTheme.backgroundColor;

                                  _colorboton1300 = AppTheme.backgroundColor;

                                  _colorboton1330 = AppTheme.backgroundColor;

                                  _colorboton1700 = AppTheme.backgroundColor;

                                  _colorboton1730 = AppTheme.backgroundColor;

                                  _colorboton1800 = AppTheme.backgroundColor;

                                  _colorboton1830 = AppTheme.backgroundColor;

                                  _colorboton1900 = AppTheme.backgroundColor;

                                  _colorboton1930 = AppTheme.backgroundColor;

                                  _colorboton2000 = AppTheme.backgroundColor;

                                  _colorboton2030 = AppTheme.backgroundColor;
                                  _colorboton1800 = AppTheme.secondary;
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text("18:00", style: TextStyle(color: AppTheme.mainTextColor),),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(width: 2, color: AppTheme.primary),
                                primary: _colorboton1830,
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 18, 30, 0, 0);
                                setState(() {
                                  _horaSeleccionada = true;
                                  _colorboton1000 = AppTheme.backgroundColor;

                                  _colorboton1030 = AppTheme.backgroundColor;

                                  _colorboton1100 = AppTheme.backgroundColor;

                                  _colorboton1130 = AppTheme.backgroundColor;

                                  _colorboton1200 = AppTheme.backgroundColor;

                                  _colorboton1230 = AppTheme.backgroundColor;

                                  _colorboton1300 = AppTheme.backgroundColor;

                                  _colorboton1330 = AppTheme.backgroundColor;

                                  _colorboton1700 = AppTheme.backgroundColor;

                                  _colorboton1730 = AppTheme.backgroundColor;

                                  _colorboton1800 = AppTheme.backgroundColor;

                                  _colorboton1830 = AppTheme.backgroundColor;

                                  _colorboton1900 = AppTheme.backgroundColor;

                                  _colorboton1930 = AppTheme.backgroundColor;

                                  _colorboton2000 = AppTheme.backgroundColor;

                                  _colorboton2030 = AppTheme.backgroundColor;
                                  _colorboton1830 = AppTheme.secondary;
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text("18:30", style: TextStyle(color: AppTheme.mainTextColor),),
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
                                side: const BorderSide(width: 2, color: AppTheme.primary),
                                primary: _colorboton1900,
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 19, 00, 0, 0);
                                setState(() {
                                  _horaSeleccionada = true;
                                  _colorboton1000 = AppTheme.backgroundColor;

                                  _colorboton1030 = AppTheme.backgroundColor;

                                  _colorboton1100 = AppTheme.backgroundColor;

                                  _colorboton1130 = AppTheme.backgroundColor;

                                  _colorboton1200 = AppTheme.backgroundColor;

                                  _colorboton1230 = AppTheme.backgroundColor;

                                  _colorboton1300 = AppTheme.backgroundColor;

                                  _colorboton1330 = AppTheme.backgroundColor;

                                  _colorboton1700 = AppTheme.backgroundColor;

                                  _colorboton1730 = AppTheme.backgroundColor;

                                  _colorboton1800 = AppTheme.backgroundColor;

                                  _colorboton1830 = AppTheme.backgroundColor;

                                  _colorboton1900 = AppTheme.backgroundColor;

                                  _colorboton1930 = AppTheme.backgroundColor;

                                  _colorboton2000 = AppTheme.backgroundColor;

                                  _colorboton2030 = AppTheme.backgroundColor;
                                  _colorboton1900 = AppTheme.secondary;
                                });
                                /*setState(() {
                                    _colorboton1000 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text("19:00", style: TextStyle(color: AppTheme.mainTextColor),),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(width: 2, color: AppTheme.primary),
                                primary: _colorboton1930,
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 19, 30, 0, 0);
                                setState(() {
                                  _horaSeleccionada = true;
                                  _colorboton1000 = AppTheme.backgroundColor;

                                  _colorboton1030 = AppTheme.backgroundColor;

                                  _colorboton1100 = AppTheme.backgroundColor;

                                  _colorboton1130 = AppTheme.backgroundColor;

                                  _colorboton1200 = AppTheme.backgroundColor;

                                  _colorboton1230 = AppTheme.backgroundColor;

                                  _colorboton1300 = AppTheme.backgroundColor;

                                  _colorboton1330 = AppTheme.backgroundColor;

                                  _colorboton1700 = AppTheme.backgroundColor;

                                  _colorboton1730 = AppTheme.backgroundColor;

                                  _colorboton1800 = AppTheme.backgroundColor;

                                  _colorboton1830 = AppTheme.backgroundColor;

                                  _colorboton1900 = AppTheme.backgroundColor;

                                  _colorboton1930 = AppTheme.backgroundColor;

                                  _colorboton2000 = AppTheme.backgroundColor;

                                  _colorboton2030 = AppTheme.backgroundColor;
                                  _colorboton1930 = AppTheme.secondary;
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text("19:30", style: TextStyle(color: AppTheme.mainTextColor),),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(width: 2, color: AppTheme.primary),
                                primary: _colorboton2000,
                              ),
                              onPressed: () {
                                selected = DateTime(selected.year,
                                    selected.month, selected.day, 20, 00, 0, 0);
                                setState(() {
                                  _horaSeleccionada = true;
                                  _colorboton1000 = AppTheme.backgroundColor;

                                  _colorboton1030 = AppTheme.backgroundColor;

                                  _colorboton1100 = AppTheme.backgroundColor;

                                  _colorboton1130 = AppTheme.backgroundColor;

                                  _colorboton1200 = AppTheme.backgroundColor;

                                  _colorboton1230 = AppTheme.backgroundColor;

                                  _colorboton1300 = AppTheme.backgroundColor;

                                  _colorboton1330 = AppTheme.backgroundColor;

                                  _colorboton1700 = AppTheme.backgroundColor;

                                  _colorboton1730 = AppTheme.backgroundColor;

                                  _colorboton1800 = AppTheme.backgroundColor;

                                  _colorboton1830 = AppTheme.backgroundColor;

                                  _colorboton1900 = AppTheme.backgroundColor;

                                  _colorboton1930 = AppTheme.backgroundColor;

                                  _colorboton2000 = AppTheme.backgroundColor;

                                  _colorboton2030 = AppTheme.backgroundColor;
                                  _colorboton2000 = AppTheme.secondary;
                                });
                                /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                              },
                              child: Text("20:00", style: TextStyle(color: AppTheme.mainTextColor),),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                          child: SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(width: 2, color: AppTheme.primary),
                                primary: _colorboton2030,
                              ),
                              onPressed: () {
                                if (!_horaSeleccionada) {
                                  selected = DateTime(
                                      selected.year,
                                      selected.month,
                                      selected.day,
                                      20,
                                      30,
                                      0,
                                      0);
                                  setState(() {
                                    _horaSeleccionada = true;
                                    _colorboton1000 = AppTheme.primary;

                                    _colorboton1030 = AppTheme.primary;

                                    _colorboton1100 = AppTheme.primary;

                                    _colorboton1130 = AppTheme.primary;

                                    _colorboton1200 = AppTheme.primary;

                                    _colorboton1230 = AppTheme.primary;

                                    _colorboton1300 = AppTheme.primary;

                                    _colorboton1330 = AppTheme.primary;

                                    _colorboton1700 = AppTheme.primary;

                                    _colorboton1730 = AppTheme.primary;

                                    _colorboton1800 = AppTheme.primary;

                                    _colorboton1830 = AppTheme.primary;

                                    _colorboton1900 = AppTheme.primary;

                                    _colorboton1930 = AppTheme.primary;

                                    _colorboton2000 = AppTheme.primary;

                                    _colorboton2030 = AppTheme.primary;
                                    _colorboton2030 = AppTheme.secondary;
                                  });
                                  /*setState(() {
                                    _colorboton1015 = AppTheme.secondary;
                                  });*/
                                }
                              },
                              child: Text("20:30", style: TextStyle(color: AppTheme.mainTextColor),),
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
                onPressed: !_horaSeleccionada
                    ? null
                    : () => {
                          Navigator.pushNamed(context, 'resumen',
                              arguments: selected)
                        },
                child: const Text('Siguiente', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ));
  }
}
