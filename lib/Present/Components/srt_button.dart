import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Present/Components/notosans_text.dart';

class SRTButton extends StatelessWidget { 
  final double width;
  final double height;
  final String title; 
  final VoidCallback onPressed;
  final bool? enable; 
  

 const SRTButton({
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
        child: NotoSansText(
          text: title,
          color: const Color(0xFFFFFFFF),
          fontWeight: NotoSansFontWeight.medium
        ),
      ),
    );
  }
}