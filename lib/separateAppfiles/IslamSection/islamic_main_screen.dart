import 'package:com.classic.classicparts/constants.dart';
import 'package:flutter/material.dart';



class IslamicMainScreen extends StatelessWidget {
  const IslamicMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(

              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("")

                )
              ),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                padding: EdgeInsets.all(16.0),
                children: const [
                  BoxItem( title: 'Prayer Time'),
                  BoxItem( title: 'Qibla Direction'),
                  BoxItem( title: 'Allah Names'),
                  BoxItem( title: 'Tasbeeh'),
                  BoxItem( title: 'Kalma Shahadat'),
                  BoxItem( title: 'Supplication'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BoxItem extends StatelessWidget {

  final String title;

  const BoxItem({ required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: CustomColor.GradientColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8.0,
            offset: Offset(0.0, 4.0),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -8,
            left: -8,
            child: Icon(
              Icons.star,
              color: Colors.white.withOpacity(0.3),
              size: 30.0,
            ),
          ),
          Positioned(
            top: -8,
            right: -8,
            child: Icon(
              Icons.star,
              color: Colors.white.withOpacity(0.3),
              size: 30.0,
            ),
          ),
          Positioned(
            bottom: -8,
            left: -8,
            child: Icon(
              Icons.star,
              color: Colors.white.withOpacity(0.3),
              size: 30.0,
            ),
          ),
          Positioned(
            bottom: -8,
            right: -8,
            child: Icon(
              Icons.star,
              color: Colors.white.withOpacity(0.3),
              size: 30.0,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               SizedBox(
                   height: 60,
                   child: Image.asset("asset/decor.png",color: Colors.white,)),
                SizedBox(height: 8.0),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
