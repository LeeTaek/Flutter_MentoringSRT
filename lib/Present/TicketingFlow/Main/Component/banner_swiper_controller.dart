import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';

class BannerSwiperControl extends SwiperPlugin { 
  const BannerSwiperControl({ 
    this.key,
    required this.previousImage,
    required this.nextImage,
    required this.size,
    this.padding = const EdgeInsets.all(0),
  });

  final Key? key;
  final Image previousImage;
  final Image nextImage;
  final double size; 
  final EdgeInsetsGeometry padding;

  Widget buildButton({ 
    required SwiperPluginConfig? config, 
    required Image image, 
    required int quarterTurns,
    required bool previous,
  }) { 
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async { 
        if (previous) { 
          await config!.controller.previous(animation: true);
        } else { 
          await config!.controller.next(animation: true);
        }
      }, 
      child: Padding( 
        padding: padding,
        child: SizedBox( 
          width: size,
          height: size,      
          child: (previous) ? previousImage : nextImage
        )
      )
    );
  }
  
  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    Widget child;
    if (config.scrollDirection == Axis.horizontal) {
      child = Row(
        key: key,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildButton(
            config: config,
            quarterTurns: 0,
            previous: true,
            image: previousImage
          ),
          buildButton(
            config: config,
            quarterTurns: 0,
            previous: false,
            image: nextImage
          )
        ],
      );
    } else {
      child = Column(
        key: key,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildButton(
            config: config,
            quarterTurns: -3,
            previous: true,
            image: previousImage
          ),
          buildButton(
            config: config,
            quarterTurns: -3,
            previous: false,
            image: nextImage
          )
        ],
      );
    }

    return SizedBox.expand(
      child: child,
    );
  }
}