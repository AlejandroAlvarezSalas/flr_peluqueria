
import 'package:flutter/material.dart';

class CardSlider extends StatelessWidget {
  const CardSlider({super.key, required this.novedades});

  final List<Widget> novedades;

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return Container( 
      width: double.infinity,
      height: 275,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: novedades.length,
              itemBuilder: (context, index) {
                final novedad = novedades[index];
                return _NovedadPoster(novedad: novedad,);
              },
            ),
          )
        ]
      ),
    );
  }
}
class _NovedadPoster extends StatelessWidget {
  const _NovedadPoster({
    super.key, required this.novedad,
  });

  final novedad;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          //Poster
          GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage('https://images.pexels.com/photos/209807/pexels-photo-209807.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox( height: 10,),
          //Titulo
          Text(
            'novedad.text',
            //Acortar el texto a dos lineas
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            
          )

        ],
      ),
    );
  }
}