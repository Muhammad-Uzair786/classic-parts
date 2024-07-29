import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  final id;
  const ThirdPage({super.key, this.id});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
 bool arrowClick=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Card(
              child: Container(
                // margin: EdgeInsets.all(5),
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image:  NetworkImage(
                        widget.id['thumbnail'], // Replace with your image path

                      ),

                      fit: BoxFit.fill
                  ),
                  borderRadius: BorderRadius.circular(10),

                ),

              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 5,right: 5),
              padding: EdgeInsets.only(left: 15,right: 5),
              child:Text("${widget.id['rating']}",style: TextStyle(color: Colors.white),),
              color: Colors.green,
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 120,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  '${widget.id['title']}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 70,
                                  width: 200,
                                  child: Text(
                                    '${widget.id['description']}',
                                    maxLines: 3,
                                    style: const TextStyle(
                                      color: Colors.green,
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 80,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.favorite_border,
                                  color: Colors.green,
                                  size: 30,
                                ),
                                SizedBox(height: 40),
                                GestureDetector(
                                  onTap: (){

                                  },
                                  child:const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 30,
                                    color: Colors.green,
                                  ),
                                ),


                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "${widget.id['rating']}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                            ),
                          ),
                        ),


                      ],
                    ),


                  ],

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExtractedWidget extends StatelessWidget {
  const ExtractedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Card(
          child: Container(
            // margin: EdgeInsets.all(5),
            height: 400,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image:  NetworkImage(
                      'https://img.freepik.com/premium-photo/raw-squid-plate-wooden-tabel-young-girl-eating-chinese-food_724662-1386.jpg?size=626&ext=jpg', // Replace with your image path

                    ),

                    fit: BoxFit.fill
                ),
                borderRadius: BorderRadius.circular(10),

            ),

          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 5,right: 5),
          padding: EdgeInsets.only(left: 15,right: 5),
          child:Text("555 miles",style: TextStyle(color: Colors.white),),
          color: Colors.green,
        ),
        Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(left: 10),
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 120,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              'Della Sano',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 70,
                              width: 200,
                              child: Text(
                                '25% off on entire products can get quality products',
                                maxLines: 3,
                                style: TextStyle(
                                  color: Colors.green,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 80,),
                        Row(
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

                              },
                              child:Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 30,
                                color: Colors.green,
                              ),
                            ),


                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '33 miles',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                        ),
                      ),
                    ),


                  ],
                ),


              ],

            ),
          ),
        ),
      ],
    );
  }
}
