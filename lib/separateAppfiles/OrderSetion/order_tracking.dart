import 'package:com.classic.classicparts/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

class OrderTracking extends StatefulWidget {
  const OrderTracking({super.key});

  @override
  State<OrderTracking> createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {
  // THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
  int activeStep = 3; // Initial step set to 5.

  int upperBound = 4; // upperBound MUST BE total number of icons minus 1.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: CustomColor.GradientColor),
              child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 12,
                    color: CustomColor.WhiteColor,
                  )),
            ),
            Text(
              'Track Order',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('#76433643',style: CustomColor.StyleBlackbold.copyWith(fontSize: 15)),
              Text('Gulberg-Lahore'),
              SizedBox(height: 10,),
              Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage("https://i.pinimg.com/originals/63/b9/b7/63b9b78aad1e2d80c35ceb58c34e627e.png"),
                      fit: BoxFit.cover
                    ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text('Collection Point',style: CustomColor.StyleBlackbold.copyWith(fontSize: 15),),
              ),
              Row(
                children: [
                  Text("09:00-12:00-05 Oct,2022",style: TextStyle(color: CustomColor.TextGreyColor),),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text("2238 Thornage City,Syracuse,Zinat Farhani",maxLines: 2,overflow: TextOverflow.ellipsis,)),
                  SizedBox(width: 10,),

                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: CustomColor.GradientColor),
                    child: Icon(
                      Icons.directions_sharp,
                      color: CustomColor.WhiteColor,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                      child: Text("You can change pick up time for your order by 09:00-05 Oct,2022",maxLines: 2,overflow: TextOverflow.ellipsis,)),
                 SizedBox(width: 5,),
                  Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: CustomColor.GradientColor),
                    child: Center(
                      child: Text(
                        'Cancel',style: CustomColor.StyleWhitebold,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 300,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ExtractedDateTime(date: 'Oct 10',time: '10:00',),
                          ExtractedDateTime(date: 'Oct 08',time: '13:12',),
                          ExtractedDateTime(date: 'Oct 06',time: '13:32',),
                          ExtractedDateTime(date: 'Oct 05',time: '17:00',),
                        ],
                      ),
                    ),
                    IconStepper(
                      direction: Axis.vertical,
                      lineColor: Colors.black,
                      activeStepColor: CustomColor.DarkBlueColor,
                      activeStepBorderColor: CustomColor.DarkBlueColor,
                      enableNextPreviousButtons: false,
                      stepRadius: 15,
                      scrollingDisabled: true,
                      icons: [
                        Icon(Icons.supervised_user_circle,color: CustomColor.WhiteColor,),
                        Icon(Icons.flag,color: CustomColor.WhiteColor),
                        Icon(Icons.access_alarm,color: CustomColor.WhiteColor),
                        Icon(Icons.supervised_user_circle,color: CustomColor.WhiteColor),
                      ],

                      // activeStep property set to activeStep variable defined above.
                      activeStep: activeStep,

                      // This ensures step-tapping updates the activeStep.
                      onStepReached: (index) {
                        setState(() {
                          activeStep = index;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ExtractedStatus(status: 'Package Received',location: 'Gulberg, Lahore',),
                          ExtractedStatus(status: 'Arrived at destination',location: 'end of tracking delivery tomorrow',),
                          ExtractedStatus(status: 'Accepted by GHL',location: 'Railwaystation, lahore',),
                          ExtractedStatus(status: 'Arrived at destination',location: 'RailwayStation,Lahore',),

                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class ExtractedDateTime extends StatelessWidget {
  final date;
  final time;
  const ExtractedDateTime({
    super.key, this.date, this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$date",style: CustomColor.StyleBlackbold.copyWith(fontSize: 15),textAlign: TextAlign.start,maxLines: 2,),
        Text("$time",textAlign: TextAlign.start,maxLines: 2,overflow: TextOverflow.ellipsis,),
      ],
    );
  }
}

class ExtractedStatus extends StatelessWidget {
  final status;
  final location;
   ExtractedStatus({
     this.status, this.location});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(

            child: Text("$status",style: CustomColor.StyleBlackbold.copyWith(fontSize: 15),textAlign: TextAlign.start,maxLines: 2,)),
        SizedBox(
            width: MediaQuery.of(context).size.width*.55,
            child: Text("$location",textAlign: TextAlign.start,maxLines: 2,overflow: TextOverflow.ellipsis,)),
      ],
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:im_stepper/stepper.dart';
//
// class IconStepperDemo extends StatefulWidget {
//   @override
//   _IconStepperDemo createState() => _IconStepperDemo();
// }
//
// class _IconStepperDemo extends State<IconStepperDemo> {
//   // THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
//   int activeStep = 3; // Initial step set to 5.
//
//   int upperBound = 4; // upperBound MUST BE total number of icons minus 1.
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('IconStepper Example'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 500,
//                 child: IconStepper(
//                   direction: Axis.vertical,
//                   lineColor: Colors.black,
//                   enableNextPreviousButtons: false,
//                   stepRadius: 15,
//                   icons: [
//                     Icon(Icons.supervised_user_circle),
//                     Icon(Icons.flag),
//                     Icon(Icons.access_alarm),
//                     Icon(Icons.supervised_user_circle),
//                   ],
//
//                   // activeStep property set to activeStep variable defined above.
//                   activeStep: activeStep,
//
//                   // This ensures step-tapping updates the activeStep.
//                   onStepReached: (index) {
//                     setState(() {
//                       activeStep = index;
//                     });
//                   },
//                 ),
//               ),
//             //  header(),
//             //   Expanded(
//             //     child: FittedBox(
//             //       child: Center(
//             //         child: Text('$activeStep'),
//             //       ),
//             //     ),
//             //   ),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //   children: [
//               //     previousButton(),
//               //     nextButton(),
//               //   ],
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// Returns the next button.
//   Widget nextButton() {
//     return ElevatedButton(
//       onPressed: () {
//         // Increment activeStep, when the next button is tapped. However, check for upper bound.
//         if (activeStep < upperBound) {
//           setState(() {
//             activeStep++;
//           });
//         }
//       },
//       child: Text('Next'),
//     );
//   }
//
//   /// Returns the previous button.
//   Widget previousButton() {
//     return ElevatedButton(
//       onPressed: () {
//         // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
//         if (activeStep > 0) {
//           setState(() {
//             activeStep--;
//           });
//         }
//       },
//       child: Text('Prev'),
//     );
//   }
//
//   /// Returns the header wrapping the header text.
//   Widget header() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.orange,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               headerText(),
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 20,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Returns the header text based on the activeStep.
//   String headerText() {
//     switch (activeStep) {
//       case 1:
//         return 'Preface';
//
//       case 2:
//         return 'Table of Contents';
//
//       case 3:
//         return 'About the Author';
//
//       case 4:
//         return 'Publisher Information';
//
//       case 5:
//         return 'Reviews';
//
//       case 6:
//         return 'Chapters #1';
//
//       default:
//         return 'Introduction';
//     }
//   }
// }



