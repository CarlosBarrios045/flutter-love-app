import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:provider/provider.dart';

// Models
import 'package:love_app/src/models/sliders_model.dart';

// Widgets
import 'package:love_app/src/widgets/custom_appbar.dart';

class _ViewsModel {
  final String text;
  final String nameSvg;

  _ViewsModel(this.nameSvg, this.text);
}

class SlidersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<_ViewsModel> views = [
      _ViewsModel('inspiration', 'Había una vez un chico guapo, pero solito.'),
      _ViewsModel('romantic',
          'Que estaba muy enamorado de una chica, para él no había nadie como ella.'),
      _ViewsModel('feeling_blue',
          'Ella no estaba pasando por buenos momentos, había mucha tristeza en su corazón.'),
      _ViewsModel('superhero',
          'Entonces el chico de una vez quiso hacer algo para ayudarla y no estuviera más triste.'),
      _ViewsModel('movie_night',
          'La invitó por varios fines de semana a ver películas, el chico no podía esperar a que llegara otro fin de semana para volverla a ver.'),
      _ViewsModel('love_is_in_the_air',
          'Luego fue avanzando y avanzando, la fue enamorando, el chico era muy cursi y detallista, quería llenarla de todo el amor y felicidad que se merecía.'),
      _ViewsModel('forever',
          'Hasta que un día esa chica pudo volver a ser feliz, su felicidad era ese chico, se hicieron novios, y el amor que se tenían era todo poderoso y lindisímo, qué goals.'),
      _ViewsModel('moment_to_relax',
          'Pasaron los meses y ya el chico no le bastaba con ver al amor de su vida solo por ratos a la semana, ninguno podía vivir sin el otro, así que empezaron a pensar en hacer una vida juntos.'),
      _ViewsModel('at_home',
          'El chico empezó a buscar alguna casa, departamento o cualquier sitio en el cual pudiera vivir con su gran amor, igualmente compró todo lo que necesitaban para su nueva vida juntos.'),
      _ViewsModel('wedding',
          'Cuando todo estuvo listo ya pudieron casarse, su boda fue la mejor boda que pudo haber existido.'),
      _ViewsModel('staying_in',
          'Ya casados se la pasaban más felices, ya estaban juntos, nunca se tenían que extrañar de nuevo el uno al otro, se la pasaban acostados, junticos y abrazaditos, amándose cada día más.'),
      _ViewsModel('programming',
          'La vida del chico era trabajar, trabajaba desde temprano para salir temprano y estar con su esposa.'),
      _ViewsModel(
          'sleep_analysis', 'La vida de la chica era dormir, dormir y dormir.'),
      _ViewsModel('studying',
          'Y habían ratos donde hacía tareas del hogar, cosas de su vida como mujer y muchas cosas más, no es tan floja como piensan.'),
      _ViewsModel('horror_movie',
          'Juntos veían muchas películas y series en Netflix y Disney+, han pasado toda su vida de novios y esposos haciendolo.'),
      _ViewsModel('travelers',
          'De vacaciones iban a todos lados juntos viajando, iban a cines, playas, lugares turísticos, y muchos sitios increíbles más.'),
      _ViewsModel('cup_of_tea',
          'Por las mañanas el chico le hacía una gran taza de café porque a ella le encantaba.'),
      _ViewsModel('ice_cream',
          'Le compraba el helado más grande que hubiera, la consentía en todo lo que quería.'),
      _ViewsModel('hamburger',
          'La hamburguesas que le compraba para ella también eran las más gigantes que hubieran, a él le encantaba verla feliz.'),
      _ViewsModel('deliveries',
          'El chico siempre quería verla feliz, su prioridad era ella y solo ella, le compraba muchos regalos, ropa, vestidos, en vez de una esposa tenía una niña consentida que cuidaba, tenía una princesa que adoraba.'),
      _ViewsModel('dog_walking', 'Adoptaron un perrito juntos.'),
      _ViewsModel('baby', 'Muchos años después tuvieron un bebé.'),
      _ViewsModel('back_to_school',
          'Ya eran toda una familia, era toda una vida que ninguno se imaginaba, eran cada vez mucho más felices.'),
      _ViewsModel('fatherhood',
          'Ya el chico no solo tenía una niña la cual era su esposa, sino también un hijo al cual enseñarle todo lo que sabía, como por ejemplo como enamorar a una princesa, así como lo hizo con su esposa.'),
      _ViewsModel('romantic',
          'Ya la historia de ese chico solitario y esa chica triste tuvo el mejor final, el final que no se esperaban pero que se merecían, una vida muy feliz, porque siempre estuvieron juntos, amandose el uno al otro.'),
      _ViewsModel('appreciation',
          'Y ese amor fue como ningún otro, un amor único en la vida, porque ese chico y esa chica se amaban al infinito, no hubo límites en ese amor, no hubo defectos, estaban destinados el uno al otro, Dios los unió, y gracias a él todo sucedió.'),
    ];

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
            Colors.purple,
            Colors.purpleAccent,
          ]),
        ),
        child: Column(
          children: [
            CustomAppBar(),
            Expanded(
              child: Swiper(
                  physics: BouncingScrollPhysics(),
                  fade: 0.1,
                  itemBuilder: (BuildContext context, int i) {
                    final view = views[i];

                    return Container(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FadeIn(
                            duration: Duration(milliseconds: 800),
                            child: Text(
                              '${view.text}',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white.withOpacity(0.8)),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                              height: 400.0,
                              child: SvgPicture.asset(
                                  'assets/svg/${view.nameSvg}.svg')),
                        ],
                      ),
                    );
                  },
                  itemCount: views.length,
                  onIndexChanged: (int i) {
                    Provider.of<SliderModel>(context, listen: false)
                        .currentPage = i;
                  },
                  pagination: SwiperPagination(builder: SwiperCustomPagination(
                      builder:
                          (BuildContext context, SwiperPluginConfig config) {
                    return _CustomPagination(views: views);
                  }))),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomPagination extends StatelessWidget {
  const _CustomPagination({
    @required this.views,
  });

  final List views;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(views.length, (i) => _Dot(i)),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<SliderModel>(context);
    final color = (ssModel.currentPage == index)
        ? Colors.purple[800]
        : Colors.white.withOpacity(0.6);
    final size = (ssModel.currentPage == index) ? 12.0 : 6.0;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.symmetric(horizontal: 3.0),
        width: size,
        height: size,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
