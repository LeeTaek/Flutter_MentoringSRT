import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class PopupPage extends StatelessWidget { 
  final String description;
  // final double height;

  const PopupPage({ 
    Key? key,
    required this.description,
    // required this.height,
  }) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Center (
      child: SingleChildScrollView( 
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 42),
          decoration: BoxDecoration( 
            color: const Color.fromARGB(255, 238, 238, 238),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ 
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 34, 32, 19),
                child: Text(
                  description,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                    fontFamily: 'SpoqaHanSansNeo',
                    fontWeight: FontWeight.w400
                  ),
                )
              ),
              Padding( 
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Container( 
                  height: 1.0,
                  width: double.infinity, 
                  color: const Color.fromARGB(255, 151, 151, 151)
                ),
              ),
              CupertinoButton(
                onPressed: () { 
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "확인",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                    fontFamily: 'SpoqaHanSansNeo',
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}