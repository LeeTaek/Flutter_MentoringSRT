
import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Data/Model/home_data.dart';

class SelectStationView extends StatelessWidget {
  Station? departure;
  Station? arrival;
  final VoidCallback setStationAction;

  SelectStationView({ 
    Key? key, 
    required this.setStationAction,
    this.departure, 
    this.arrival
  }) : super(key: key);

  @override 
  Widget build(BuildContext context) { 
    return Container( 
      height: 102,
      decoration: BoxDecoration( 
        color: const Color.fromARGB(255, 61, 73, 100),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded( 
            child: Container( 
              alignment: Alignment.centerRight,
              child: Column ( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "출발역", 
                    style: TextStyle(
                      color: Color.fromARGB(255, 187, 187, 187),
                      fontSize: 13, 
                      fontFamily: 'SpoqaHanSansNeo',
                      fontWeight: FontWeight.w400                
                    ),
                  ),
                  const SizedBox(height: 6,),
                  CupertinoButton(
                    onPressed: setStationAction,
                    child: Text(
                      (departure?.stationName ?? "선택"), 
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 24, 
                        fontFamily: 'SpoqaHanSansNeo',
                        fontWeight: FontWeight.w700                
                      ),
                    ),
                  ) 
                ],
              ), 
            ),
          ),
          Expanded( 
            child: CupertinoButton( 
              onPressed:() {
                if (departure != null && arrival != null) {
                  final dep = departure;
                  departure = arrival;
                  arrival = dep; 
                }
              },
              child: Image.asset('assets/images/btn_transf_w.png', width: 48, height: 48,)
            )
          ),
          Expanded(
            child: Container( 
              alignment: Alignment.centerLeft,
              child: Column ( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "도착역", 
                    style: TextStyle(
                      color: Color.fromARGB(255, 187, 187, 187),
                      fontSize: 13, 
                      fontFamily: 'SpoqaHanSansNeo',
                      fontWeight: FontWeight.w400                
                    ),
                  ),
                  // const SizedBox(height: 6,),
                  CupertinoButton(
                    onPressed: setStationAction,
                    child: Text(
                      (arrival?.stationName ?? "선택"), 
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 24, 
                        fontFamily: 'SpoqaHanSansNeo',
                        fontWeight: FontWeight.w700                
                      ),
                    ),
                  )
                ],
              ), 
            )
          )
        ]
      )
    );
  }

}