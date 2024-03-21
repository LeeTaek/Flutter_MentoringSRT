
import 'package:flutter/cupertino.dart';

class SignupTextField extends StatefulWidget { 
  final String title; 
  final String placeholder; 
  final String errorMessage;
  final TextEditingController controller;
  final bool isValid;
  final bool? obscureText;
  final int? maxLength;
  bool isTextNotEmpty = false;
  bool? enabled;
  TextInputType? textInputType;
  VoidCallback? validation;

  SignupTextField({ 
    Key? key,
    required this.title,
    required this.placeholder,
    required this.errorMessage,
    required this.controller,
    required this.isValid,
    this.obscureText,
    this.maxLength,
    this.enabled,
    this.textInputType,
    this.validation,
  }) : super(key: key);

  @override 
  State<StatefulWidget> createState() => SignupTextFieldState();
}

class SignupTextFieldState extends State<SignupTextField> { 
  late Text _titleLabel; 
  late Text _errorLabel;
  final focusNode = FocusNode();

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

    _errorLabel = Text( 
      widget.errorMessage,
      style: const TextStyle( 
        color: Color.fromARGB(255, 218, 29, 29), 
        fontSize: 12, 
      ),
    );

    if (widget.validation != null)  { 
      focusNode.addListener(widget.validation!);
    }
  }

  void _updateTextState() { 
    setState(() { 
      widget.isTextNotEmpty = widget.controller.text.isNotEmpty;
    });
  }


  @override 
  Widget build(BuildContext context) { 
    return SizedBox( 
      height: 84, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleLabel,
          CupertinoTextField( 
              focusNode: focusNode,
              controller: widget.controller,
              placeholder:widget.placeholder,
              obscureText: (widget.obscureText ?? false),
              enabled: (widget.enabled ?? true),
              keyboardType: widget.textInputType,
              decoration: BoxDecoration( 
                border: Border(
                  bottom: BorderSide(
                    color: (widget.isValid) ? const Color.fromARGB(255, 238, 238, 238) 
                                            : const Color.fromARGB(255, 218, 29, 29)
                    )
                  )
              ), 
              clearButtonMode: widget.isTextNotEmpty ? OverlayVisibilityMode.always : OverlayVisibilityMode.never,
              suffix: widget.isTextNotEmpty 
              ? CupertinoButton(
                onPressed: () => widget.controller.clear(),
                padding: EdgeInsets.zero,
                child: Image.asset('assets/images/ico_textfield_clear.png', width: 20, height: 20,),
              ) : null, 
              maxLength: widget.maxLength,
            ), 
           (widget.isValid) ? const SizedBox(height: 16) : _errorLabel,           
        ],
      ) 
    );
  }

  @override 
  void dispose() { 
    widget.controller.dispose();
    focusNode.dispose();
    super.dispose();
  }
}