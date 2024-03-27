import 'package:flutter/cupertino.dart';

enum NotoSansFontWeight { 
  regular(FontWeight.w300),
  medium(FontWeight.w400),
  bold(FontWeight.w700);

  final FontWeight weight;
  const NotoSansFontWeight(this.weight);
}

class NotoSansText extends StatelessWidget { 
  final String text;  
  final double size;
  final Color color;
  final NotoSansFontWeight fontWeight;
  final TextDecoration decoration;
  final TextAlign textAlign;

  const NotoSansText({ 
    Key? key,
    required this.text, 
    this.size = 16,
    this.color = const Color.fromARGB(255, 0, 0, 0),
    this.fontWeight = NotoSansFontWeight.regular, 
    this.decoration = TextDecoration.none,
    this.textAlign = TextAlign.start
  }) : super(key: key);

  @override 
  Widget build(BuildContext context) { 
    return Text( 
      text, 
      style: TextStyle( 
        color: color,
        fontFamily: 'SpoqaHanSansNeo',
        fontSize: size,
        fontWeight: fontWeight.weight,
        decoration: decoration
      ),
      textAlign: textAlign,
    );
  }
}