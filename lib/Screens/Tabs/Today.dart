import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Providers/DataProvider.dart';

class TodayTrend extends StatelessWidget{
  TodayTrend({super.key});

  

final List<String> instagramHashtags = [
    '#love',
    '#instagood',
    '#photooftheday',
    '#fashion',
    // Add more Instagram hashtags
  ];

  final List<String> facebookHashtags = [
    '#love',
    '#happybirthday',
    '#friends',
    '#family',
    // Add more Facebook hashtags
  ];

  final List<String> twiterHashtags = [
    '#COVID19',
    '#BlackLivesMatter',
    '#MAGA',
    '#Bitcoin',
    // Add more Facebook hashtags
  ];

  

  @override
  Widget build(BuildContext context) {


    DataProvider().fetchData();

    // TODO: implement build
    return MultiProvider(providers: [ChangeNotifierProvider(create:(context)=> DataProvider())],
    child:
       Consumer<DataProvider>(builder: (context, value, child) =>
    
     Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              SizedBox(height: 20),
              

                    TrendCard(
                      platform: 'Instagram',
                      hashtags: instagramHashtags,
                      icon: Icons.camera_alt,
                      iconColor: Colors.pink,
                    ),

                    SizedBox(height: 20),
                    TrendCard(
                      platform: 'Facebook',
                      hashtags: facebookHashtags,
                      icon: Icons.thumb_up,
                      iconColor: Colors.blue,
                    ),

                    SizedBox(height: 20),
                    TrendCard(
                      platform: 'Twitter',
                      hashtags: twiterHashtags,
                      icon: FontAwesomeIcons.twitter,
                      iconColor: Colors.blue,
                    ),

                    // ListView.builder(itemCount: value.list.length, 
                    // itemBuilder: (context,index){
                    //   Text(value.list[index]);
                    // }),

                    SizedBox(height: 20),
                    
                  ],
                ),
              )
    );
     
    
    
  }

}
class TrendCard extends StatelessWidget {
  final String platform;
  final List<String> hashtags;
  final IconData icon;
  final Color iconColor;

  const TrendCard({
    required this.platform,
    required this.hashtags,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: iconColor,
                  size: 24,
                ),
                SizedBox(width: 8),
                Text(
                  platform,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: hashtags.map((hashtag) {
                return Text(
                  hashtag,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.6,
                    color: Colors.black,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}