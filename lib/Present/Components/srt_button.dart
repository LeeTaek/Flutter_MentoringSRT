import 'package:flutter/cupertino.dart';

class SRTButton extends StatelessWidget { 
  double width;
  final double height;
  final String title; 
  final VoidCallback onPressed;
  bool? enable; 
  

 SRTButton({
    Key? key, 
    this.width = double.infinity,
    required this.height, 
    required this.title,
    required this.onPressed,
    this.enable,
  }) : super(key: key);

  @override 
  Widget build(BuildContext context) { 
    return SizedBox(
      height: height,
      width: width,
      child: CupertinoButton(
        minSize: 0.0,
        padding: const EdgeInsets.all(0),
        onPressed: (enable ?? true) ? onPressed : null, 
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