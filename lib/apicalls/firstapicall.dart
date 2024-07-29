import 'dart:convert';

import 'package:com.classic.classicparts/models/postmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FirstApiCall extends StatefulWidget {
  const FirstApiCall({super.key});

  @override
  State<FirstApiCall> createState() => _FirstApiCallState();
}

class _FirstApiCallState extends State<FirstApiCall> {
List<postModel> postList=[];
 Future<List<postModel>> getpostsApi()
  async {
   final response= await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
   var data=jsonDecode(response.body.toString());
   if(response.statusCode==200)
     {
       postList.clear();
       for(Map<String,dynamic> i in data)
         {
           postList.add(postModel.fromJson(i));
         }
       print(response.body);
          return postList;
     }else
       {
         return postList;
       }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
            Expanded(
              child: FutureBuilder( 
                  future: getpostsApi(),
                  builder: (context,snapshot)
              {
                if(!snapshot.hasData)
                  {
                   return const Text("loading....");
                  }else
                    {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context,index){
                            return Container(
                              margin: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Text("gxjsgksgkj"),
                            );
                          });
                    }
              }),
            )
        ],
      ),
    );
  }
}
