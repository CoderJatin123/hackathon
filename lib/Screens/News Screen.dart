import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Providers/DataProvider.dart';
import 'Tabs/Today.dart';

class NewsScreen extends StatelessWidget {

  final List<String> newsList = [
    '1. How the Warriors were in the Locker Room after losing to the Lakers - https://www.youtube.com/watch?v=rVus1ZcMHYU',
    '2. Lil Durk - All My Life ft. J. Cole (Official Video) - https://www.youtube.com/watch?v=Z4N8lzKNfy4',
    '3. FlightReacts To #6 WARRIORS at #7 LAKERS | FULL GAME 6 HIGHLIGHTS | May 12, 2023! - https://www.youtube.com/watch?v=jCPCsHGKoXw',

  ];

    final List<String> twitch = [
    '1. How the Warriors were in the Locker Room after losing to the Lakers - https://www.youtube.com/watch?v=rVus1ZcMHYU',
    '2. Lil Durk - All My Life ft. J. Cole (Official Video) - https://www.youtube.com/watch?v=Z4N8lzKNfy4',
    '3. FlightReacts To #6 WARRIORS at #7 LAKERS | FULL GAME 6 HIGHLIGHTS | May 12, 2023! - https://www.youtube.com/watch?v=jCPCsHGKoXw',
  
  ];


  NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(providers: [ChangeNotifierProvider(create:(context)=> DataProvider())],
    child:
    Consumer<DataProvider>(builder: (context, value, child) => 

    Column(
      children:[ Padding(padding: const EdgeInsets.only(top: 20.0),
      child: TrendCard(
                      platform: 'Youtube',
                      hashtags: newsList,
                      icon: FontAwesomeIcons.youtube,
                      iconColor: Colors.redAccent,
                    ),
      ),
      Padding(padding: const EdgeInsets.only(top: 20.0),
      child: TrendCard(
                      platform: 'Twitch',
                      hashtags: newsList,
                      icon:FontAwesomeIcons.twitch,
                      iconColor: Colors.purpleAccent,
                    ),
      )
      ]
    )
    )
    
    );
  }
}
