
import 'package:flutter/cupertino.dart';

class SignupTextField extends StatefulWidget { 
  final String title; 
  final String placeholder; 
  final bool isValid;
  final bool obscureText;
  final String errorMessage;
  final TextEditingController controller;

  const SignupTextField({ 
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
  late CupertinoTextField _textfield;

  @override 
  void initState() { 
    super.initState();
    _titleLabel = Text(
      widget.title,
      style: const TextStyle(
        color: Color.fromARGB(255, 136, 136, 136),
        fontSize: 14
      ),
    );

    _textfield = CupertinoTextField( 
      controller: widget.controller,
      placeholder:widget.placeholder,
      obscureText: widget.obscureText,
      decoration:  const BoxDecoration( 
        border: Border(
          bottom: BorderSide(color: Color.fromARGB(255, 238, 238, 238)),
        )
      )
    );
  }


  @override 
  Widget build(BuildContext context) { 
    return SizedBox( 
      height: 63, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleLabel,
          _textfield
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