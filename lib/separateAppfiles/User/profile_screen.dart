// import 'package:com.classic.classicparts/constants.dart';
// import 'package:flutter/material.dart';
//
// class RoundedContainerStack extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CustomColor.BlackColor,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//            height: 600,
//                padding: EdgeInsets.only(bottom: 200),
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(40),
//               ),
//               child: Container(
//                height: 300,
//                 //padding: EdgeInsets.only(bottom: 55),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(40),
//                 ),
//                 child: Column(
//
//                   children: [
//
//                     Stack(
//
//                       children: [
//
//                         Container(
//                           height: 300,
//                           padding: EdgeInsets.only(bottom: 25),
//                           width: MediaQuery.of(context).size.width,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(40),
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Text("Ali Farhan",style: TextStyle(color: CustomColor.BlackColor),),
//                               Text("developer"),
//                             ],
//                           ),
//                         ),
//                         Positioned(
//                           top:20,right: 20,left: 20,
//                           child: Stack(
//                             children:[
//                               Container(
//                               height: 150,
//                               width: MediaQuery.of(context).size.width,
//                               decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(40),
//                               ),
//                             ),
//                               Center(
//                                 child: Container(
//                                   decoration:BoxDecoration(
//                                     image: DecorationImage(image: AssetImage('asset/user.png')),
//                                     borderRadius: BorderRadius.circular(50),
//                                   ),
//                                   margin: EdgeInsets.only(top: 100,),
//                                   width: 100,
//                                   height: 100,
//                                 ),
//                               ),
//   ]
//                           ),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             children: [
//                               Text("125",style: TextStyle(color: Colors.white),),
//                               Text("Orders",style: TextStyle(color: Colors.white),),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Text("22",style: TextStyle(color: Colors.white),),
//                               Text("Pending Orders",style: TextStyle(color: Colors.white),),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Text("5",style: TextStyle(color: Colors.white),),
//                               Text("wishlist",style: TextStyle(color: Colors.white),),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


///
import 'dart:io';

import 'package:com.classic.classicparts/Auth/login_screen.dart';
import 'package:com.classic.classicparts/Auth/update_password_screen.dart';
import 'package:com.classic.classicparts/Providers/api_provider.dart';
import 'package:com.classic.classicparts/Providers/cart_provider.dart';
import 'package:com.classic.classicparts/Providers/theme_provider.dart';
import 'package:com.classic.classicparts/Providers/translation_provider.dart';
import 'package:com.classic.classicparts/constants.dart';
import 'package:com.classic.classicparts/separateAppfiles/QiblaFinder/prayer_calender.dart';
import 'package:com.classic.classicparts/separateAppfiles/QiblaFinder/qibla_finder.dart';
import 'package:com.classic.classicparts/separateAppfiles/SettingScreen.dart';
import 'package:com.classic.classicparts/separateAppfiles/SupportSection/contact_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/SupportSection/faq_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/User/edit_profile_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Providers/authrememberprovider.dart';
import '../qr_scanner.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ImageProvider<Object>? backgroundImage;

  @override
  Widget build(BuildContext context) {
    final remembermeprovider = Provider.of<RememberMeProvider>(context, listen: false);
    if (remembermeprovider.profileImage.startsWith('http')) {
      backgroundImage=NetworkImage('${remembermeprovider.profileImage}');
    }else if(remembermeprovider.profileImage=='null')
    {
      backgroundImage=AssetImage("asset/user.png");
    }
    else {
      backgroundImage=
          FileImage(File(remembermeprovider.profileImage));
    }
    return Scaffold(
      backgroundColor: CustomColor.WhiteColor,
      body: Stack(
        children: [
          Container(
            height: 700,
           padding: EdgeInsets.symmetric(horizontal: 40,vertical: 30),
           // padding: EdgeInsets.only(bottom: 0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///todomust

                    // RoundedContainerWithIcon(icon: Icons.calendar_month, color: Colors.black, name: '${AppLocalizations.of(context)?.prayer_calender}', OnClick: (){
                    //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => PrayerTimesScreen()));
                    // },),
                    RoundedContainerWithIcon(icon: Icons.info, color: Colors.black, name: '${AppLocalizations.of(context)?.about_classic}', OnClick: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenOne()));
                    },),

                    RoundedContainerWithIcon(icon: Icons.favorite, color: Colors.black, name: '${AppLocalizations.of(context)?.wishlist}', OnClick: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => WishListScreen()));

                    },),
                    ///todomust
                    // RoundedContainerWithIcon(icon: Icons.directions_sharp, color: Colors.black, name: '${AppLocalizations.of(context)?.find_qibla}', OnClick: (){
                    //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => QiblaFinder()));
                    //
                    // },),


                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    RoundedContainerWithIcon(icon: Icons.contact_page, color: Colors.black, name: '${AppLocalizations.of(context)?.contact_us}', OnClick: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactUsScreen()));

                    },),

                    RoundedContainerWithIcon(icon: Icons.question_mark_outlined, color: Colors.black, name: '${AppLocalizations.of(context)?.faq}', OnClick: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => FAQScreen()));

                    },),
                    RoundedContainerWithIcon(icon: Icons.settings, color: Colors.black, name: '${AppLocalizations.of(context)?.setting}', OnClick: (){
                      ///test
                      // Provider.of<TranslationProvider>(context,listen: false).translateHomePageText(context);
                      // Provider.of<TranslationProvider>(context,listen: false).status=true;
                      //Provider.of<ThemeProvider>(context,listen: false).isDarkMode=true;

                      ///
                     // Provider.of<ThemeProvider>(context,listen: false).switchTheme(true);

                      ///todomust
                     // _showDialog(context);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SettingScreen()));

                      },
                    ),


                  ],
                ),
              ],
            ),

          ),
          Container(
            height: 420,
            padding: EdgeInsets.only(top: 2),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: CustomColor.GradientColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(

              children: [

                Stack(

                  children: [

                    Container(
                      height: 300,
                       padding: EdgeInsets.only(bottom: 28),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("${Provider.of<RememberMeProvider>(context,listen: false).userName}",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                         // Text("Developer",style: TextStyle(color: Colors.grey,fontSize: 13)),
                        ],
                      ),
                    ),
                    Positioned(
                      top:30,right: 20,left: 20,
                      child: Stack(
                          children:[
                            Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                image: DecorationImage(image: AssetImage('asset/cover.jpg')),
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditProfileScreen(
                                          userName: '${remembermeprovider.userName}',
                                          phoneNumber: '${remembermeprovider.phoneNumber}',
                                          address: '${remembermeprovider.address}',
                                        )),
                                  );                              },
                                child: Container(
                                  decoration:BoxDecoration(
                                    image: DecorationImage(image: backgroundImage!,
                                    fit: BoxFit.cover
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  margin: EdgeInsets.only(top: 100,),
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ),
                          ]
                      ),
                    ),
                  ],
                ),
                ///todomust
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Column(
                //         children: [
                //           Text("125",style: TextStyle(color: Colors.white),),
                //           Text("${AppLocalizations.of(context)?.orders}",style: TextStyle(color: Colors.white),),
                //         ],
                //       ),
                //       Column(
                //         children: [
                //           Text("22",style: TextStyle(color: Colors.white),),
                //           Text("${AppLocalizations.of(context)?.pending_orders}",style: TextStyle(color: Colors.white),),
                //         ],
                //       ),
                //       Column(
                //         children: [
                //           Text("5",style: TextStyle(color: Colors.white),),
                //           Text("${AppLocalizations.of(context)?.wishlist}",style: TextStyle(color: Colors.white),),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class RoundedContainerWithIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String name;
  final VoidCallback OnClick;

  RoundedContainerWithIcon({required this.icon, required this.color, required this.name, required this.OnClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      child: Column(
        children: [
          GestureDetector(
            onTap:OnClick,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
               // color: color,
                borderRadius: BorderRadius.circular(10),
                gradient: CustomColor.GradientColor
              ),
              child: Icon(
                icon,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 5,),
          Text("$name",textAlign: TextAlign.center,)
        ],
      ),
    );
  }

}
///dialogue

void _showDialog(BuildContext context) {

  showDialog(

    context: context,
    builder: (BuildContext context) {
      final remembermeprovider=Provider.of<RememberMeProvider>(context, listen: false);

      return AlertDialog(
       // backgroundColor: CustomColor.BlueColor,
        title: Text('${AppLocalizations.of(context)?.choose_an_option}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenOne()),
                );
              },
              child: Text('${AppLocalizations.of(context)?.about_classic}',style: TextStyle(color: CustomColor.BlackColor),),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdatePasswordScreen(authtoken: remembermeprovider.authtoken)),
                );
              },
              child: Text('${AppLocalizations.of(context)?.update_password}'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showLogoutDialog(context);// Close the dialog
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ScreenThree()),
                // );
              },
              child: Text('${AppLocalizations.of(context)?.log_out}'),
            ),
          ],
        ),
      );
    },
  );
}


class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.WhiteColor,
      appBar: AppBar(
        backgroundColor: CustomColor.WhiteColor,
        automaticallyImplyLeading: false,
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
                  gradient: CustomColor.GradientColor
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 12,
                    color: Colors.white, // Icon color
                  ),
                ),
              ),
            ),
            Text(
              '${AppLocalizations.of(context)?.about_classic}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox()
          ],
        ),
      ),

      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            elevation: 4,
            child: Container(
              decoration: BoxDecoration(
                  gradient: CustomColor.GradientColor,
                  borderRadius: BorderRadius.circular(10)
              ),
              height: 300,
              padding: const EdgeInsets.all(16.0),
              child:   Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${AppLocalizations.of(context)?.welcome_text}',
                    textAlign:TextAlign.center,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    '${AppLocalizations.of(context)?.about_description}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16,color: Colors.white,),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 4,
            child: Container(
              decoration: BoxDecoration(
                  gradient: CustomColor.GradientColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child:  ListTile(
                title: Text('${AppLocalizations.of(context)?.email}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                subtitle: Text('info@classicparts.com',style: TextStyle(color: Colors.white),),
                leading: Icon(Icons.email,color: Colors.white,),
              ),
            ),
          ),
          Card(
            elevation: 4,
            child: Container(
              decoration: BoxDecoration(
                  gradient: CustomColor.GradientColor,
                  borderRadius: BorderRadius.circular(10)
              ),
              child:  ListTile(
                title: Text('${AppLocalizations.of(context)?.phone}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                subtitle: Text('03000568361',style: TextStyle(color: Colors.white),),
                leading: Icon(Icons.phone,color: Colors.white,),
              ),
            ),
          ),
          // Card(
          //   elevation: 4,
          //   child: Container(
          //     decoration: BoxDecoration(
          //         gradient: CustomColor.GradientColor,
          //         borderRadius: BorderRadius.circular(10)
          //     ),
          //     child: ListTile(
          //       title: Text('Facebook',style: CustomColor.StyleWhitebold,),
          //       subtitle: Text('get intouch with us on facebook',style: CustomColor.StyleWhitenormal,),
          //       leading: Icon(Icons.facebook,color: CustomColor.WhiteColor,),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
    final _apiprovider=  Provider.of<ApiProvider>(context,listen: false);
    final _remembermeprovider=  Provider.of<RememberMeProvider>(context,listen: false);

      return AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              // Perform logout action here
             final _response= await _apiprovider.fetchLogoutApi(_remembermeprovider.authtoken,context);
             _remembermeprovider.clearUserData();
             print("result ${_response}");
              Navigator.pop(context);// Close the dialog
             if(_response=='tokenerror')
               {
                 var snackBar = SnackBar(content: Text('${_response['error']}'));
                 ScaffoldMessenger.of(context).showSnackBar(snackBar,);
               }else if(_response!=null&& _response!='tokenerror')
             {
               var snackBar = SnackBar(content: Text('${_response['message']}'));
               Provider.of<RememberMeProvider>(context,listen: false).clearUserData();
               Provider.of<CartProvider>(context,listen: false).clearCartItems();
               ScaffoldMessenger.of(context).showSnackBar(snackBar,);
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
             }


            },
            child: Text('Logout'),
          ),
        ],
      );
    },
  );
}










///
// import 'package:com.classic.classicparts/constants.dart';
// import 'package:flutter/material.dart';
//
// class RoundedContainerStack extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CustomColor.BlackColor,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//            height: 600,
//                padding: EdgeInsets.only(bottom: 200),
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(40),
//               ),
//               child: Container(
//                height: 300,
//                 //padding: EdgeInsets.only(bottom: 55),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(40),
//                 ),
//                 child: Column(
//
//                   children: [
//
//                     Stack(
//
//                       children: [
//
//                         Container(
//                           height: 300,
//                           padding: EdgeInsets.only(bottom: 25),
//                           width: MediaQuery.of(context).size.width,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(40),
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Text("Ali Farhan",style: TextStyle(color: CustomColor.BlackColor),),
//                               Text("developer"),
//                             ],
//                           ),
//                         ),
//                         Positioned(
//                           top:20,right: 20,left: 20,
//                           child: Stack(
//                             children:[
//                               Container(
//                               height: 150,
//                               width: MediaQuery.of(context).size.width,
//                               decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(40),
//                               ),
//                             ),
//                               Center(
//                                 child: Container(
//                                   decoration:BoxDecoration(
//                                     image: DecorationImage(image: AssetImage('asset/user.png')),
//                                     borderRadius: BorderRadius.circular(50),
//                                   ),
//                                   margin: EdgeInsets.only(top: 100,),
//                                   width: 100,
//                                   height: 100,
//                                 ),
//                               ),
//   ]
//                           ),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             children: [
//                               Text("125",style: TextStyle(color: Colors.white),),
//                               Text("Orders",style: TextStyle(color: Colors.white),),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Text("22",style: TextStyle(color: Colors.white),),
//                               Text("Pending Orders",style: TextStyle(color: Colors.white),),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Text("5",style: TextStyle(color: Colors.white),),
//                               Text("wishlist",style: TextStyle(color: Colors.white),),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


///
// import 'package:com.classic.classicparts/constants.dart';
// import 'package:com.classic.classicparts/separateAppfiles/QiblaFinder/prayer_calender.dart';
// import 'package:com.classic.classicparts/separateAppfiles/QiblaFinder/qibla_finder.dart';
// import 'package:com.classic.classicparts/separateAppfiles/SupportSection/contact_screen.dart';
// import 'package:com.classic.classicparts/separateAppfiles/SupportSection/faq_screen.dart';
// import 'package:com.classic.classicparts/separateAppfiles/wishlist_screen.dart';
// import 'package:flutter/material.dart';
//
// import '../qr_scanner.dart';
//
// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CustomColor.WhiteColor,
//       body: Stack(
//         children: [
//           Container(
//             height: 700,
//             padding: EdgeInsets.symmetric(horizontal: 40,vertical: 30),
//             // padding: EdgeInsets.only(bottom: 0),
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(40),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     RoundedContainerWithIcon(icon: Icons.calendar_month, color: Colors.black, name: 'Prayer Calender', OnClick: (){
//                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => PrayerTimesScreen()));
//                     },),
//
//                     RoundedContainerWithIcon(icon: Icons.favorite, color: Colors.black, name: 'Wishlist', OnClick: (){
//                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => WishListScreen()));
//
//                     },),
//                     RoundedContainerWithIcon(icon: Icons.directions_sharp, color: Colors.black, name: 'Find Qibla', OnClick: (){
//                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => QiblahScreen()));
//
//                     },),
//
//
//                   ],
//                 ),
//                 SizedBox(height: 30,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//
//                     RoundedContainerWithIcon(icon: Icons.contact_page, color: Colors.black, name: 'Contact Us', OnClick: (){
//                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactUsScreen()));
//
//                     },),
//                     RoundedContainerWithIcon(icon: Icons.privacy_tip_outlined, color: Colors.black, name: 'Terms', OnClick: (){
//                       // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
//                     },),
//                     RoundedContainerWithIcon(icon: Icons.question_mark_outlined, color: Colors.black, name: 'FAQ', OnClick: (){
//                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => FAQScreen()));
//
//                     },),
//
//
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//
//                     RoundedContainerWithIcon(icon: Icons.contact_page, color: Colors.black, name: 'Change password', OnClick: (){
//                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactUsScreen()));
//
//                     },),
//                     RoundedContainerWithIcon(icon: Icons.privacy_tip_outlined, color: Colors.black, name: 'About', OnClick: (){
//                       // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
//                     },),
//                     RoundedContainerWithIcon(icon: Icons.question_mark_outlined, color: Colors.black, name: 'Logout', OnClick: (){
//                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => FAQScreen()));
//
//                     },),
//
//
//                   ],
//                 ),
//               ],
//             ),
//
//           ),
//           Container(
//             height: 340,
//             padding: EdgeInsets.only(top: 2),
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//               gradient: CustomColor.GradientColor,
//               borderRadius: BorderRadius.circular(40),
//             ),
//             child: Column(
//
//               children: [
//
//                 Stack(
//
//                   children: [
//
//                     Container(
//                       height: 250,
//                       padding: EdgeInsets.only(bottom: 15),
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(40),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text("Ali Farhan",style: TextStyle(color: CustomColor.BlackColor,fontSize: 15,fontWeight: FontWeight.bold),),
//                           Text("Developer",style: TextStyle(color: Colors.grey,fontSize: 13)),
//                         ],
//                       ),
//                     ),
//                     Positioned(
//                       top:30,right: 20,left: 20,
//                       child: Stack(
//                           children:[
//                             Container(
//                               height: 120,
//                               width: MediaQuery.of(context).size.width,
//                               decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 image: DecorationImage(image: AssetImage('asset/cover.jpg')),
//                                 borderRadius: BorderRadius.circular(40),
//                               ),
//                             ),
//                             Center(
//                               child: Container(
//                                 decoration:BoxDecoration(
//                                   image: DecorationImage(image: AssetImage('asset/user.png')),
//                                   borderRadius: BorderRadius.circular(50),
//                                 ),
//                                 margin: EdgeInsets.only(top: 90,),
//                                 width: 70,
//                                 height: 70,
//                               ),
//                             ),
//                           ]
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           Text("125",style: TextStyle(color: Colors.white),),
//                           Text("Orders",style: TextStyle(color: Colors.white),),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Text("22",style: TextStyle(color: Colors.white),),
//                           Text("Pending Orders",style: TextStyle(color: Colors.white),),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Text("5",style: TextStyle(color: Colors.white),),
//                           Text("wishlist",style: TextStyle(color: Colors.white),),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class RoundedContainerWithIcon extends StatelessWidget {
//   final IconData icon;
//   final Color color;
//   final String name;
//   final VoidCallback OnClick;
//
//   RoundedContainerWithIcon({required this.icon, required this.color, required this.name, required this.OnClick});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 70,
//       child: Column(
//         children: [
//           GestureDetector(
//             onTap:OnClick,
//             child: Container(
//               width: 50,
//               height: 50,
//               decoration: BoxDecoration(
//                 // color: color,
//                   borderRadius: BorderRadius.circular(10),
//                   gradient: CustomColor.GradientColor
//               ),
//               child: Icon(
//                 icon,
//                 size: 30,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           SizedBox(height: 5,),
//           Text("$name",textAlign: TextAlign.center,)
//         ],
//       ),
//     );
//   }
// }