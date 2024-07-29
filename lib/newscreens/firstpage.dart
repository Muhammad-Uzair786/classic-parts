import 'dart:convert';

import 'package:com.classic.classicparts/newscreens/thirdpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/postmodel.dart';
import 'apimodel.dart';

class CardBox extends StatefulWidget {
  @override
  State<CardBox> createState() => _CardBoxState();
}

class _CardBoxState extends State<CardBox> {
  bool arrowClick=false;
  int? indexvalue;
  List<apimodel> postList=[];
  var data;
  Future getpostsApi()
  async {
    final response = await get(Uri.parse("https://dummyjson.com/products"));
    data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postList.clear();

      print("ttt");
      return data;
    }
  else
    {
      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(

            children: [
              Text(
                'Offers And Discounts',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Click on venue to redeem Offer',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

               // Expanded(
               //   child: ListView(
               //     children: [
               //       ExtractedCard(arrowClick: arrowClick,),
               //       ExtractedCard(arrowClick: arrowClick,),
               //       ExtractedCard(arrowClick: arrowClick,),
               //       ExtractedCard(arrowClick: arrowClick,),
               //     ],
               //   ),
               // ),

              Expanded(
                child: FutureBuilder(
                    future: getpostsApi(),
                    builder: (context,snapshot)
                    {
                      if(!snapshot.hasData)
                      {
                        return Text("loading....");
                      }else
                      {
                        return ListView.builder(
                            itemCount: data['products'].length,
                            itemBuilder: (context,index){
                              return GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ThirdPage(id:snapshot.data['products'][index])));

                                },
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(vertical: 10),
                                    height:indexvalue==index?arrowClick?230: 120:120,
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.all(5),
                                                  height: 70,
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image:  NetworkImage(
                                                          snapshot.data['products'][index]['thumbnail'], // Replace with your image path

                                                        ),

                                                        fit: BoxFit.fill
                                                    ),
                                                    border:Border.all(color: Colors.green,width: 4),
                                                  ),

                                                ),
                                                const SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [

                                                    SizedBox(
                                                      width: 200,
                                                      child: Text(
                                                snapshot.data['products'][index]['title'],
                                                        maxLines: 1,
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.green,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 70,
                                                      width: 200,
                                                      child: Text(
                                                        snapshot.data['products'][index]['description'],
                                                        maxLines: 3,
                                                        style: const TextStyle(
                                                          color: Colors.green,
                                                          //fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: Text(
                                                snapshot.data['products'][index]['rating'].toString(),
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.green,
                                                ),
                                              ),
                                            ),

                                            GestureDetector(
                                              onTap: (){
                                                // indexvalue==index;
                                                // print("${index}");
                                                // setState(() {
                                                //
                                                // });
                                              // int i=snapshot.data['products'][index];
                                              },
                                              child:indexvalue==index?arrowClick?
                                              Container(
                                                margin: EdgeInsets.only(top: 20,left: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Text("Price:", style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.green,
                                                        ),),
                                                        Text("${snapshot.data['products'][index]['price']}\$", style: const TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.green,
                                                        ),),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Text("Address:", style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.green,
                                                        ),),
                                                        Text("${snapshot.data['products'][index]['category']}", style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.green,
                                                        ),),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("phone:", style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.green,
                                                        ),),
                                                        Text("${snapshot.data['products'][index]['brand']}", style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.green,
                                                        ),),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("area:", style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.green,
                                                        ),),
                                                        Text("${snapshot.data['products'][index]['stock']}", style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.green,
                                                        ),),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ):SizedBox():SizedBox(),
                                            )

                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.favorite_border,
                                              color: Colors.green,
                                              size: 30,
                                            ),
                                            SizedBox(height: 40),
                                            GestureDetector(
                                              onTap: (){

                                                setState(() {
                                                  indexvalue=index;
                                                 arrowClick=!arrowClick;
                                                  print(index);

                                                });
                                              },
                                              child: indexvalue==index?arrowClick?const Icon(
                                                Icons.keyboard_arrow_down_rounded,
                                                size: 25,
                                                color: Colors.blue,
                                              ):const Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                size: 25,
                                                color: Colors.green,
                                              ):const Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                size: 25,
                                                color: Colors.green,
                                              ),
                                            ),


                                          ],
                                        ),

                                      ],

                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// class ExtractedCard extends StatefulWidget {
//   bool arrowClick;
//   ExtractedCard({super.key, required this.arrowClick});
//
//   @override
//   State<ExtractedCard> createState() => _ExtractedCardState();
// }
//
// class _ExtractedCardState extends State<ExtractedCard> {
//   @override
//   Widget build(BuildContext context) {
//     return  Card(
//       elevation: 5,
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 10),
//         height:widget.arrowClick?250: 120,
//         child: Row(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.all(5),
//                       height: 70,
//                       width: 70,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image:  NetworkImage(
//                               'https://img.freepik.com/premium-photo/raw-squid-plate-wooden-tabel-young-girl-eating-chinese-food_724662-1386.jpg?size=626&ext=jpg', // Replace with your image path
//
//                             ),
//
//                             fit: BoxFit.fill
//                         ),
//                         border:Border.all(color: Colors.green,width: 4),
//                       ),
//
//                     ),
//                     SizedBox(width: 10),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//
//                         Text(
//                           'Della Sano',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.green,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 70,
//                           width: 200,
//                           child: Text(
//                             '25% off on entire products can get quality products',
//                             maxLines: 3,
//                             style: TextStyle(
//                               color: Colors.green,
//                               //fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 5),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   child: Text(
//                     '33 miles',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.green,
//                     ),
//                   ),
//                 ),
//
//                 widget.arrowClick? Container(
//                   margin: EdgeInsets.only(top: 20,left: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Text("Price:", style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green,
//                           ),),
//                           Text("100\$", style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.green,
//                           ),),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Text("Address:", style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green,
//                           ),),
//                           Text("44 Milton Ave", style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.green,
//                           ),),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Text("phone:", style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green,
//                           ),),
//                           Text("777-54373-736", style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.green,
//                           ),),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Text("area:", style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green,
//                           ),),
//                           Text("OrlandoLas Vegas", style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.green,
//                           ),),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ):SizedBox()
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Icon(
//                   Icons.favorite_border,
//                   color: Colors.green,
//                   size: 30,
//                 ),
//                 SizedBox(height: 40),
//                 GestureDetector(
//                   onTap: (){
//
//                     setState(() {
//                       widget.arrowClick=!widget.arrowClick;
//
//                     });
//                   },
//                   child: widget.arrowClick?Icon(
//                     Icons.keyboard_arrow_down_rounded,
//                     size: 30,
//                     color: Colors.blue,
//                   ):Icon(
//                     Icons.arrow_forward_ios_rounded,
//                     size: 30,
//                     color: Colors.green,
//                   ),
//                 ),
//
//
//               ],
//             ),
//
//           ],
//
//         ),
//       ),
//     ) ;
//   }
// }

int arrowmethod(index)
{
  return index;
}