import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

// Widgets
import 'package:love_app/src/widgets/custom_appbar.dart';

class LetterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                CustomAppBar(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: _Texts(),
                )
              ],
            ),
          )),
    );
  }
}

class _Texts extends StatelessWidget {
  final TextStyle style = TextStyle(
      fontSize: 18,
      color: Colors.white.withOpacity(0.9),
      fontWeight: FontWeight.bold);

  final List<String> texts = <String>[
    'Princesaaa',
    'Este es un regalo para ti.',
    'Para ti que te mereces todo lo hermoso que pueda existir.',
    'Para ti que haces de mi vida la más bonita.',
    'Espero poder un día casarme contigo, y vivir bien feliz a tu lado por siempre.',
    'Siempre estaré para ti, en todo lo que necesites, cuidandote, consintiendote y haciendote bien feliz.',
    'Me encantas muchoooo.',
    'Te amo al infinito, y mucho más.',
    'Entre más pase el tiempo más te amaré, más te querré hacer feliz, cada vez estaré más seguro de que contigo quiero pasar cada día.',
    'Te amo mucho, y para siempre.'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...texts.map((text) {
          return Column(
            children: [
              Text(
                text,
                style: style,
              ),
              SizedBox(height: 10),
            ],
          );
        }),
        Center(
          child: SvgPicture.asset(
            'assets/svg/staying_in.svg',
            height: 200,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
