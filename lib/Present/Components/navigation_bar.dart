import 'package:flutter/cupertino.dart';

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
            (leadingButton != null) ? leadingButton! : const SizedBox(width: 24),
            Expanded( 
              child: Text(
                title, 
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'SpoqaHanSansNeo',
                  fontWeight: FontWeight.w500
                ),
                textAlign: TextAlign.center,
              ),
            ),
            (trailingButton != null) ? trailingButton! : const SizedBox(width: 24)
          ],
        )
        )
    );
  }
}