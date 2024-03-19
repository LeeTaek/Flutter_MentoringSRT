
import 'package:flutter/cupertino.dart';

class SignupTextField extends StatefulWidget { 
  final String title; 
  final String placeholder; 
  final bool isValid;
  final bool obscureText;
  final String errorMessage;
  final TextEditingController controller;
  bool isTextNotEmpty = false;

  SignupTextField({ 
    Key? key,
    required this.title,
    required this.placeholder,
    required this.isValid,
    required this.obscureText,
    required this.errorMessage,
    required this.controller,
  }) : super(key: key);

  @override 
  State<StatefulWidget> createState() => SignupTextFieldState();
}

class SignupTextFieldState extends State<SignupTextField> { 
  late Text _titleLabel; 

  @override 
  void initState() { 
    super.initState();
    widget.controller.addListener(_updateTextState);
    _updateTextState();

    _titleLabel = Text(
      widget.title,
      style: const TextStyle(
        color: Color.fromARGB(255, 136, 136, 136),
        fontSize: 14,
        fontFamily: 'SpoqaHanSansNeo',
        fontWeight: FontWeight.w400
      ),
    );
  }

  void _updateTextState() { 
    setState(() { 
      widget.isTextNotEmpty = widget.controller.text.isNotEmpty;
    });
  }


  @override 
  Widget build(BuildContext context) { 
    return SizedBox( 
      height: 63, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleLabel,
          CupertinoTextField( 
                controller: widget.controller,
                placeholder:widget.placeholder,
                obscureText: widget.obscureText,
                decoration: const BoxDecoration( 
                  border: Border(
                    bottom: BorderSide(color: Color.fromARGB(255, 238, 238, 238)),
                  )
                ), 
                clearButtonMode: widget.isTextNotEmpty ? OverlayVisibilityMode.always : OverlayVisibilityMode.never,
                suffix: widget.isTextNotEmpty 
                ? CupertinoButton(
                  onPressed: () => widget.controller.clear(),
                  padding: EdgeInsets.zero,
                  child: Image.asset('assets/images/ico_textfield_clear.png', width: 20, height: 20,),
                ) : null,
              )       
           ],
      ) 
    );
  }

  @override 
  void dispose() { 
    widget.controller.dispose();
    super.dispose();
  }
}