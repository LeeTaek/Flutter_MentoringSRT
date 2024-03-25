import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Data/Model/home_data.dart';

class RecentBookingView extends StatelessWidget {
  final List<RecentReservation>? infos; 
  final Function(Station dep, Station arr) callbackAction;

  const RecentBookingView({
    Key? key,
    required this.infos,
    required this.callbackAction
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return Column( 
      children: [ 
        const Align( 
          alignment: Alignment.centerLeft,
          child: Text(
            "최근 예매 구간",
            style: TextStyle( 
              color: Color.fromARGB(255, 136, 136, 136),
              fontSize: 14, 
              fontFamily: 'SpoqaHanSansNeo',
              fontWeight: FontWeight.w500       
            ),  
          ),
        ),
        const SizedBox(height: 8),
        SizedBox( 
          height: 38,
          child: ListView.builder( 
            scrollDirection: Axis.horizontal, 
            itemCount: infos?.length ?? 0,
            itemBuilder: (context, index) { 
              return CupertinoButton(
                onPressed: () {
                  if (infos != null) {
                    callbackAction(infos![index].depStation, infos![index].arrStation);
                  }
                },
                child: Container( 
                  decoration: BoxDecoration( 
                    color: const Color.fromARGB(255, 239, 240, 245),
                    borderRadius: BorderRadius.circular(2)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Text(
                      "${infos?[index].depStation.stationName} → ${infos?[index].arrStation.stationName}",
                      style: const TextStyle( 
                        fontSize: 14, 
                        fontFamily: 'SpoqaHanSansNeo',
                        fontWeight: FontWeight.w400         
                      ),
                    ),
                  )
                )
              );
            },
          )  
        ) 
      ]
    );
  }
}