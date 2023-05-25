import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Providers/DataProvider.dart';
import 'Tabs/Today.dart';

class Mynews extends StatelessWidget {

  final List<String> newsList = [
    '1. Zelda: Tears Of The Kingdom - Guides Hub - GameSpot - https://www.gamespot.com/articles/zelda-tears-of-the-kingdom-guides-hub/1100-6513966/',
    '2. Watch the 2025 Porsche Boxster EV test at the Nurburgring - MotorBiscuit - https://www.motorbiscuit.com/watch-the-2025-porsche-boxster-ev-test-at-the-nurburgring/',
    '3. Download: Here are all the new wallpapers from the Google Pixel 7a - XDA Developers - https://www.xda-developers.com/google-pixel-7a-wallpapers-download/',

  ];

    final List<String> twitch = [
    'Python FastAPI Tutorial for Beginners" by Krunal Lathiya',
    'Python Type Hints: The What, Why, and How" by Sahil Sareen',
    'Python Generators: How to use them and the benefits you get" by Madhubala',
  
  ];


  Mynews({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(providers: [ChangeNotifierProvider(create:(context)=> DataProvider())],
    child:
    Consumer<DataProvider>(builder: (context, value, child) => 

    Column(
      children:[ Padding(padding: const EdgeInsets.only(top: 20.0),
      child: TrendCard(
                      platform: 'News',
                      hashtags: newsList,
                      icon: FontAwesomeIcons.newspaper,
                      iconColor: Colors.grey,
                    ),
      ),
      Padding(padding: const EdgeInsets.only(top: 20.0),
      child: TrendCard(
                      platform: 'Medium',
                      hashtags: twitch,
                      icon:FontAwesomeIcons.medium,
                      iconColor: Colors.black,
                    ),
      )
      ]
    )
    )
    
    );
  }
}
