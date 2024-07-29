import 'package:com.classic.classicparts/Auth/sign_up_Screen.dart';
import 'package:com.classic.classicparts/constants.dart';
import 'package:flutter/material.dart';

class StartupPage extends StatefulWidget {
  @override
  _StartupPageState createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  Page(color: CustomColor.WhiteColor, text: 'Turning Dreams into Reality with Top-Notch Spare Parts'),
                  Page(color: CustomColor.WhiteColor, text: 'Elevate Your Ride with Our Unmatched Spare Parts'),
                  Page(color: CustomColor.WhiteColor, text: 'Revive,Restore And Ride On....!'),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: () {
                      // Handle skip button action
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignUpScreen()));

                    },
                    child: Text('Skip'),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: GestureDetector(
                  onTap: (){
                    if (_currentPage < 2) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }else
                      {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignUpScreen()));

                      }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 16),
                    margin: const EdgeInsets.all(10.0),

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: CustomColor.GradientColor
                      ),
                      child: Text('Get Started',style: CustomColor.StyleWhitebold,),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      3,
                          (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? Colors.blue
                                : CustomColor.TextGreyColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final Color color;
  final String text;

  const Page({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),

    color: color,
      child: Column(
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage('https://tse2.mm.bing.net/th?id=OIP.8ShHXiq7smZaVyKk3FdRBgHaDf&pid=Api&P=0&h=180.png'),
                   fit:BoxFit.fill
              )
            ),
          ),
          SizedBox(height: 20,),
          Text(
            text,
            style: TextStyle(fontSize: 30, color: CustomColor.BlackColor,fontFamily: 'Poppins'),
          ),
        ],
      ),
    );
  }
}
