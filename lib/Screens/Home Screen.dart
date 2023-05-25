import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trend_tracker/Providers/DataProvider.dart';
import 'package:trend_tracker/Screens/Tabs/Today.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

 
  @override
  _HomeScreenState createState()=>_HomeScreenState();
  
}

 class _HomeScreenState extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, value, child) => 
  
       Padding(padding: EdgeInsets.all(10),
       child:
       TodayTrend()
       )
     );
        
      
    
  }
 }