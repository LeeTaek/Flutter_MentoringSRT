import 'package:flutter/cupertino.dart';

class SRTButton extends StatelessWidget { 
  final double width;
  final double height;
  final String title; 
  final VoidCallback onPressed; 
  

 const SRTButton({
    Key? key, 
    required this.width,
    required this.height, 
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override 
  Widget build(BuildContext context) { 
    return SizedBox(
      height: height,
      width: width,
      child: CupertinoButton(
        minSize: 0.0,
        padding: const EdgeInsets.all(0),
        onPressed: onPressed, 
        color: const Color(0xFF476EFF),
        borderRadius: BorderRadius.circular(4),
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 16, 
            fontFamily: 'SpoqaHanSansNeo',
            fontWeight: FontWeight.w400
          ),
        ),
      ),
    );
  }
}