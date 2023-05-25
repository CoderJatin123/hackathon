
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trend_tracker/Screens/Onboarding%20Screen/First%20Onboarding%20Screen.dart';
import 'package:trend_tracker/Screens/Onboarding%20Screen/StartUp%20Screen.dart';

class OnboardingScree extends StatefulWidget{
  const OnboardingScree({super.key});


  @override
  _OnboardingState createState ()=> _OnboardingState();
  
}

class _OnboardingState extends State<OnboardingScree>{
   
  final _pageController =PageController();
  bool isLast=false;

    @override
    void dispose() {
    _pageController.dispose();
    super.dispose();
  }

    @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: 
        PageView(
           controller: _pageController,
          onPageChanged: (value){
            
              setState(()=>isLast = value == 1);

             
          },
         
          children: [

            OnboardingModel( title: "Real-time Trend Updates" , description: "Instantly access global trends. From fashion to tech, stay informed with up-to-date information.", color: Colors.orangeAccent, gradientColor: Colors.pinkAccent,icon: Icons.check),
            
            OnboardingModel(title: "Personalized Trend Recommendations", description: "Personalized trend discovery. Algorithms analyze your interests for tailored recommendations.", color: Colors.blue, gradientColor: Colors.purpleAccent,icon: Icons.track_changes)
            
          ],
        )
      ),
      bottomSheet: isLast?
        Container(
          height: 80,
          alignment: Alignment.center,
          child:  Center(
          child: 
          TextButton(child: const Text("Get Started", style: TextStyle(fontSize: 24,color: Colors.black87)),
          onPressed: ()async{

            final pref = await SharedPreferences.getInstance();
            pref.setBool("isFirstTime", false);
            
              Navigator.of(context).pushReplacement(
              MaterialPageRoute( builder: (context)=>const StartupScreen()));
          },),
        ),
        )
       :
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 80,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
              Center(
                child: SmoothPageIndicator(
                  count: 2,
                  effect: const WormEffect(),
                  controller: _pageController
                  ),
              ),

                
               TextButton(child: const Text("NEXT",style: TextStyle(fontSize: 18,color: Colors.black87)),onPressed: (){
              _pageController.nextPage(duration: const Duration(microseconds: 500), 
              curve:  Curves.easeInOut);
              },)
              
          ],
        ),
      ),
    
    );
  }
  }