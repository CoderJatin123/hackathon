import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trend_tracker/Providers/DataProvider.dart';
import 'package:trend_tracker/Screens/Home%20Screen.dart';
import 'package:trend_tracker/Screens/Onboarding%20Screen/Onboarding%20Screen.dart';
import 'Notification Services/local_notification_service.dart';
import 'Screens/News Screen.dart';
import 'Screens/Setting Screen.dart';
import 'firebase_options.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
Future<void> backgroundHandler(RemoteMessage message) async {
  
  print(message.data.toString());
  print(message.notification!.title);

}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();



Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  final isFirstTime= pref.getBool("isFirstTime") ?? true;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
 //await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  getDeviceTokenToSendNotification();

 // DataProvider().fetchData();
  runApp(MyApp(isFirstTime:isFirstTime));

}


class MyApp extends StatelessWidget {
  
  final bool isFirstTime;
  const MyApp({Key?key, required  this.isFirstTime}) :super(key: key);

  void initState() {
    initState();
    
    //message receives on not opened state
    FirebaseMessaging.instance.getInitialMessage().then(
            (message) {
          print("FirebaseMessaging.instance.getInitialMessage");
          if (message != null) {
            print("New Notification");
            // if (message.data['_id'] != null) {
            //   Navigator.of(context).push(
            //     MaterialPageRoute(
            //       builder: (context) => DemoScreen(
            //         id: message.data['_id'],
            //       ),
            //     ),
            //   );
            // }
          }
        });

    //message receives on running state
    FirebaseMessaging.onMessage.listen(
          (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
           LocalNotificationService.createanddisplaynotification(message);

        }
      },
    );
    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }


  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [ChangeNotifierProvider(create:(context)=> DataProvider())],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isFirstTime ? const OnboardingScree() :  MyHomePage(),
      //
    )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;
  late PageController _pageController;

  final List<Widget> _screens = [
    
    HomeScreen(),
     NewsScreen(),
     Mynews(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);

    FirebaseMessaging.instance.subscribeToTopic('all_users');
    /*
    message receives on not opened state
    FirebaseMessaging.instance.getInitialMessage().then(
            (message) {
          print("FirebaseMessaging.instance.getInitialMessage");
          if (message != null) {
            print("New Notification");
            // if (message.data['_id'] != null) {
            //   Navigator.of(context).push(
            //     MaterialPageRoute(
            //       builder: (context) => DemoScreen(
            //         id: message.data['_id'],
            //       ),
            //     ),
            //   );
            // }
          }
        });

    //message receives on running state
    FirebaseMessaging.onMessage.listen(
          (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
           LocalNotificationService.createanddisplaynotification(message);

        }
      },
    );
    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
    */
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
      appBar: AppBar(
        title:  Text('Trend Tracker'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _screens,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon:Icon(FontAwesomeIcons.hashtag),
            label: 'Tags',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.video),
            label: 'Videos',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.newspaper),
            label: 'News',

          ),
        ],
      ),
      );
    
  }

}

 Future<void> getDeviceTokenToSendNotification() async {
     final FirebaseMessaging _fcm = FirebaseMessaging.instance;
     final token = await _fcm.getToken();
     var deviceTokenToSendPushNotification = token.toString();
     print("Token Value :$deviceTokenToSendPushNotification");
   }



