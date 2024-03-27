import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Present/Components/notosans_text.dart';

class NavigationBar extends StatelessWidget { 
   final String title;
   final CupertinoButton? leadingButton; 
   final CupertinoButton? trailingButton;

  const NavigationBar({ 
    Key? key, 
    required this.title,
    this.leadingButton, 
    this.trailingButton,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) { 
    return SizedBox( 
      height: 56,
      width: double.infinity, 
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 16, 16, 19),
        child: Row ( 
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ 
            SizedBox( 
              width: 24,
              height: 24,
              child: (leadingButton != null) ? leadingButton! : const SizedBox(width: 24, height: 24,),
            ),
            Expanded( 
              child: NotoSansText(
                text: title, 
                size: 18,
                fontWeight: NotoSansFontWeight.bold,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox( 
              width: 24, 
              height: 24, 
              child: (trailingButton != null) ? trailingButton! : const SizedBox(width: 24, height: 24,)
            ),
          ],
        )
      )
    );
  }
}