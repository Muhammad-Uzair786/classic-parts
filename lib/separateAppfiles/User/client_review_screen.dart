import 'package:com.classic.classicparts/constants.dart';
import 'package:flutter/material.dart';


class ClientReviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColor.WhiteColor,
          // Set the background color of the AppBar
          elevation: 0,
          // Set the elevation to 0 to remove the shadow
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: CustomColor.TextFieldColor,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 12,
                      color: Colors.black, // Icon color
                    ),
                  ),
                ),
              ),
              Text(
                'Client Review',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: CustomColor.BlackColor),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: CustomColor.TextFieldColor,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.notification_add_outlined,
                      size: 12,
                      color: Colors.black, // Icon color
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 140,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(horizontal: 10),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('4.5',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          Text('/5',style: TextStyle(),),
                        ],
                      ),
                      Text('Based on 120 Review',style: TextStyle(fontSize: 15,),),
                     Row(
                       children: [
                         Icon(Icons.star),
                         Icon(Icons.star),
                         Icon(Icons.star),
                         Icon(Icons.star),
                         Icon(Icons.star_outline),
                       ],
                     )
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBar(rating: 5),
                      RatingBar(rating: 4),
                      RatingBar(rating: 3),
                      RatingBar(rating: 2),
                      RatingBar(rating: 1),

                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            MyRow(
              text: 'Add Review',
              onArrowTap: () {
                print('Arrow tapped in Row 1');
              },
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("User Reviews",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          print('Plus icon tapped in');
                        },
                      ),
                      Text("Most UseFul",style: TextStyle(fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_down),
                        onPressed: (){},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.5,
              child: ListView(
                children: [
                  UserProfileRow(
                    image: 'https://sm.askmen.com/t/askmen_in/article/f/facebook-p/facebook-profile-picture-affects-chances-of-gettin_fr3n.1200.jpg',
                    name: 'John Doe',
                    time: '2 days ago',
                    rating: 5,
                  ),
                  UserProfileRow(
                    image: 'https://sm.askmen.com/t/askmen_in/article/f/facebook-p/facebook-profile-picture-affects-chances-of-gettin_fr3n.1200.jpg',
                    name: 'John Doe',
                    time: '2 hours ago',
                    rating: 5,
                  ),

                  UserProfileRow(
                    image: 'https://sm.askmen.com/t/askmen_in/article/f/facebook-p/facebook-profile-picture-affects-chances-of-gettin_fr3n.1200.jpg',
                    name: 'John Doe',
                    time: '1 day ago',
                    rating: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final int rating;

  RatingBar({required this.rating});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("$rating Star"),
        SizedBox(width: 5.0),
        Container(
          margin: EdgeInsets.only(top: 5,bottom:5,right: 10),

          width: 100.0,
          height: 10.0,
          decoration: BoxDecoration(
            color: CustomColor.TextGreyColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: rating / 5.0,
            child: Container(
              decoration: BoxDecoration(
                color: CustomColor.DarkBlueColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

}

class MyRow extends StatelessWidget {
  final String text;
  final VoidCallback onArrowTap;

  MyRow({required this.text, required this.onArrowTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.add_circle),
          onPressed: () {
            print('Plus icon tapped in $text');
          },
        ),
        Expanded(
          child: Text(text),
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios_outlined,size: 15,),
          onPressed: onArrowTap,
        ),
      ],
    );
  }
}




///
class UserProfileRow extends StatelessWidget {
  final String image;
  final String name;
  final String time;
  final int rating;

  UserProfileRow({
    required this.image,
    required this.name,
    required this.time,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey
      ),
      child: Column( 
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(image),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(
                    time,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: List.generate(
                  rating,
                      (index) => Icon(
                    Icons.star,
                    color: index==4?Colors.black:Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          Text("This is the best product I have ever used! It has made my life so much easier and I don’t know how I ever lived without it.")
        ],
      ),
    );

  }
}