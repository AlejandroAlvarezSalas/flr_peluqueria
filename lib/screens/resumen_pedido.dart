import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pelucapp/models/models.dart';
import 'package:pelucapp/services/services.dart';
import 'package:pelucapp/screens/screens.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ResumenPedidoScreen extends StatelessWidget {
  const ResumenPedidoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final peluqueriasServices = Provider.of<PeluqueriasServices>(context);
    final peluquerosServices = Provider.of<PeluquerosServices>(context);
    final serviciosServices = Provider.of<ServiciosServices>(context);

    final peluqueria = peluqueriasServices
        .peluquerias[0] /*peluqueriasServices.peluqueriaSeleccionada!*/;
    final peluquero = peluquerosServices.peluqueroSeleccionado!;
    final serviciosSeleccionados = serviciosServices.ServiciosSeleccionados;

    DateTime diaSeleccionado =
        ModalRoute.of(context)!.settings.arguments as DateTime;

    ResumenArgs resumen = ResumenArgs.completo(
        peluqueria, peluquero, serviciosSeleccionados, diaSeleccionado);

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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(
              text: 'Peluqueria',
              color: AppTheme.mainTextColor,
              size: 25,
            ),
            _PeluqueriaContainer(resumen: resumen),
            SizedBox(
              height: 20,
            ),
            BigText(
              text: 'Peluquero',
              color: AppTheme.mainTextColor,
              size: 25,
            ),
            _PeluqueroContainer(resumen: resumen),
            SizedBox(
              height: 20,
            ),
            BigText(
              text: 'Tus servicios',
              color: AppTheme.mainTextColor,
              size: 25,
            ),
            _ServiciosListView(resumen: resumen),
            SizedBox(
              height: 20,
            ),
            BigText(
              text: 'Subtotal',
              color: AppTheme.mainTextColor,
              size: 25,
            ),
            _SubtotalContainer(resumen: resumen),
            _BotonMetodosPago(resumen: resumen),
          ],
        ),
      ),
    );
  }
}

class _PeluqueroContainer extends StatelessWidget {
  const _PeluqueroContainer({
    super.key,
    required this.resumen,
  });

  final ResumenArgs resumen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(
        width: 1,
        color: Colors.black12,
      ))),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.only(right: 25),
            child: Icon(
              Icons.account_circle,
              size: 30,
            ),
          ),
          SmallText(
            text: resumen.peluquero.nombre,
            color: AppTheme.mainTextColor,
          ),
        ],
      ),
    );
  }
}

class _BotonMetodosPago extends StatelessWidget {
  const _BotonMetodosPago({
    super.key,
    required this.resumen,
  });

  final ResumenArgs resumen;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'metodos_de_pago', arguments: resumen);
          /*showDialog<String>(
          context: context,
          builder: (BuildContext context) => MetodosDePago(
            resumen: resumen,
          ),
        );*/
        },
        child: const Text('Metodos de pago', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

class _SubtotalContainer extends StatelessWidget {
  const _SubtotalContainer({
    super.key,
    required this.resumen,
  });

  String generarPrecio(ResumenArgs resumen) {
    String resultadoCadena;
    double sumaPrecios = 0;
    for (var servicio in resumen.servicios) {
      sumaPrecios += servicio.precio;
    }
    return sumaPrecios.toString();
  }

  final ResumenArgs resumen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmallText(
                text: 'Fecha',
                color: Color.fromRGBO(97, 97, 97, 1),
              ),
              SmallText(
                text: DateFormat('dd/MM/yyyy').format(resumen.hora),
                color: Color.fromRGBO(97, 97, 97, 1),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmallText(
                text: 'Hora',
                color: Color.fromRGBO(97, 97, 97, 1),
              ),
              SmallText(
                text: DateFormat('HH:mm').format(resumen.hora),
                color: Color.fromRGBO(97, 97, 97, 1),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmallText(
                text: 'Total',
                color: Color.fromRGBO(97, 97, 97, 1),
              ),
              SmallText(
                text: generarPrecio(resumen) + "€",
                color: Color.fromRGBO(97, 97, 97, 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ServiciosListView extends StatelessWidget {
  const _ServiciosListView({
    super.key,
    required this.resumen,
  });

  final ResumenArgs resumen;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: resumen.servicios.length,
        itemBuilder: (context, index) {
          Servicio _servicio = resumen.servicios[index];
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                border: BorderDirectional(
                    bottom: BorderSide(
              width: 1,
              color: Colors.black12,
            ))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                  text: _servicio.nombre,
                  color: AppTheme.mainTextColor,
                ),
                SmallText(
                  text: '€${_servicio.precio}',
                  color: AppTheme.mainTextColor,
                ),
              ],
            ),
          );
        });
  }
}

class _PeluqueriaContainer extends StatelessWidget {
  const _PeluqueriaContainer({
    super.key,
    required this.resumen,
  });

  final ResumenArgs resumen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(
        width: 1,
        color: Colors.black12,
      ))),
      child: SmallText(
        text: resumen.peluqueria.nombre,
        color: AppTheme.mainTextColor,
      ),
    );
  }
}

class ResumenArgs {
  final Peluqueria peluqueria;
  final Peluquero peluquero;
  final List<Servicio> servicios;
  DateTime hora = DateTime.now();

  ResumenArgs.sinFecha(this.peluqueria, this.peluquero, this.servicios);
  ResumenArgs.completo(
      this.peluqueria, this.peluquero, this.servicios, this.hora);
}

class MetodosDePago extends StatefulWidget {
  ResumenArgs resumen;

  MetodosDePago({Key? key, required this.resumen}) : super(key: key);

  @override
  _MetodosDePago createState() => _MetodosDePago(resumen);
}

class _MetodosDePago extends State<MetodosDePago> {
  //bool seleccionado = false;

  static final double radius = 20;
/*
  UniqueKey? keyTileBizum;
  UniqueKey? keyTileTarjeta;
  UniqueKey? keyTileEfectivo;
  bool isExpandedBizum = false;
  bool isExpandedTarjeta = false;
  bool isExpandedEfectivo = false;
*/
  final ResumenArgs resumen;
  _MetodosDePago(this.resumen) : super();
/*
  void expandTile(int key) {
    setState(() {
      if (key == 1) {
        isExpandedBizum = true;
        keyTileBizum = UniqueKey();
      }
      if (key == 2) {
        isExpandedTarjeta = true;
        keyTileTarjeta = UniqueKey();
      }
      if (key == 3) {
        isExpandedEfectivo = true;
        keyTileEfectivo = UniqueKey();
      }
    });
  }*/
  /*
  void shrinkTile(int key) {
    setState(() {
      if (key == 1) {
        isExpandedBizum = false;
        keyTileBizum = UniqueKey();
      }
      if (key == 2) {
        isExpandedTarjeta = false;
        keyTileTarjeta = UniqueKey();
      }
      if (key == 3) {
        isExpandedEfectivo = false;
        keyTileEfectivo = UniqueKey();
      }
    });
  }*/

  String generarCodigo(ResumenArgs resumen) {
    String resultadoCadena = resumen.peluqueria.toString();
    resultadoCadena += resumen.peluquero.toString();
    resultadoCadena += DateFormat('ddMMyy').format(resumen.hora);
    //si lo hago como int me quita los primeros digitos si estos son 0
    return resultadoCadena;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Seleccione un método de pago'),
      contentPadding: EdgeInsets.fromLTRB(
          24.0, 20.0, 24.0, 0.0), // increase the padding at the top
      content: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: BorderSide(color: Colors.black, width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(radius),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) => AlertDialog(
                                title: const Text('Código de operación'),
                                content: Text(generarCodigo(resumen)),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, 'home');
                                      //seleccionado = true;
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ));
                      //seleccionado = true;
                      //isExpandedBizum ? shrinkTile(1) : expandTile(1),
                    },
                    child: buildImage(
                        'https://taigua.cat/wp-content/uploads/2023/01/bizum-2.jpg'),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: BorderSide(color: Colors.black, width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(radius),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'home'),
                    //isExpandedTarjeta ? shrinkTile(2) : expandTile(2),
                    child: buildImage(
                      'https://imagenes.lainformacion.com/files/twitter_thumbnail/uploads/imagenes/2022/04/29/tarjetas-de-credito.jpeg',
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: BorderSide(color: Colors.black, width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(radius),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) => AlertDialog(
                                title: const Text('Advertencia'),
                                content: Text(
                                    'Debe realizar el pago previo servicio'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, 'home');
                                      //seleccionado = true;
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ));

                      //isExpandedEfectivo ? shrinkTile(3) : expandTile(3),
                    },
                    child: buildImage(
                      'https://blog.selfbank.es/wp-content/uploads/2020/09/GettyImages-1195108001.jpg',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//tiene que recibir por parametros algo para saber que foto crear
  Widget buildImage(String url) => Image.network(
        url,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 100,
      );
/*
  Widget buildText(BuildContext context, String type, ResumenArgs resumen) {
    switch (type) {
      case "Tarjeta":
        return Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            key: keyTileTarjeta,
            initiallyExpanded: isExpandedTarjeta,
            childrenPadding: EdgeInsets.all(6).copyWith(top: 0),
            title: Text(
              'Tarjeta',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            children: [
              ElevatedButton(
                  onPressed: () {
                    //seleccionado = true;
                    Navigator.pushNamed(context, 'home');
                  },
                  child: Text('Pagar')),
            ],
            /*onExpansionChanged: (isExpanded) => Utils.showSnackBar(
context,
text: isExpanded ? 'Expand Tile' : 'Shrink Tile',
color: isExpanded ? Colors.green : Colors.red,
),*/
          ),
        );
        break;

      case "Bizum":
        return Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            key: keyTileBizum,
            initiallyExpanded: isExpandedBizum,
            childrenPadding: EdgeInsets.all(6).copyWith(top: 0),
            title: Text(
              'Bizum',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            children: [
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text('Código de operación'),
                              content: Text(generarCodigo(resumen)),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'home');
                                    //seleccionado = true;
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ));
                    //seleccionado = true;
                  },
                  child: Text('Mostrar código')),
            ],
            /*onExpansionChanged: (isExpanded) => Utils.showSnackBar(
              context,
              text: isExpanded ? 'Expand Tile' : 'Shrink Tile',
              color: isExpanded ? Colors.green : Colors.red,
            ),*/
          ),
        );
        break;

      case "Efectivo":
        return Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            key: keyTileEfectivo,
            initiallyExpanded: isExpandedEfectivo,
            childrenPadding: EdgeInsets.all(6).copyWith(top: 0),
            title: Text(
              'Efectivo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            children: [
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text('Advertencia'),
                              content:
                                  Text('Debe realizar el pago previo servicio'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'home');
                                    //seleccionado = true;
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ));
                  },
                  child: Text('Pagar en caja')),
            ],
            /*onExpansionChanged: (isExpanded) => Utils.showSnackBar(
            context,
            text: isExpanded ? 'Expand Tile' : 'Shrink Tile',
            color: isExpanded ? Colors.green : Colors.red,
            ),*/
          ),
        );
        break;
      default:
        return Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            key: keyTileBizum,
            initiallyExpanded: isExpandedBizum,
            childrenPadding: EdgeInsets.all(6).copyWith(top: 0),
            title: Text(
              'DEFAULT',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            children: [
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text('DEFAULT'),
                              content: Text('DEFAULTMSG'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'home');
                                    //seleccionado = true;
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ));
                  },
                  child: Text('DEFAULTBUTTON')),
            ],
            /*onExpansionChanged: (isExpanded) => Utils.showSnackBar(
            context,
            text: isExpanded ? 'Expand Tile' : 'Shrink Tile',
            color: isExpanded ? Colors.green : Colors.red,
            ),*/
          ),
        );
        break;
    }
  }*/
}
