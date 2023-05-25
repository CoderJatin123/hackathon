import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trend_tracker/Models/appsData.dart';

class DataProvider extends ChangeNotifier{

  
    List<String> list=[];
    List<App> appsDatalist=[
    App("Instragarm",const Icon(FontAwesomeIcons.instagram)),
    App("Snapchat",const Icon(FontAwesomeIcons.snapchat)),
    App("Facebook",const Icon(FontAwesomeIcons.facebook))
    ];
    


  void fetchData() async {

  print(">>>>>>>>>>>>>>>>>>>>>>     I am called      <<<<<<<<<<<<<");

  final DatabaseReference dbRef = FirebaseDatabase.instance.ref().child("/Youtube/");

  DataSnapshot latestSnapshot;

  await dbRef.orderByKey().limitToLast(1).once().then((DatabaseEvent x){

    Object? y=x.snapshot.value;
   var data=x.snapshot.children.first.children.first.value;

   list= data.toString().split(' ');
   
   list.forEach((element) {
    print(element);
   });
  
  
  });

   notifyListeners();

}
  
}