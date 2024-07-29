// import 'package:com.classic.classicparts/Providers/methods_provider.dart';
// import 'package:com.classic.classicparts/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
//
// class Category {
//   final String name;
//   final List<String> subcategories;
//
//   Category({required this.name, required this.subcategories});
// }
//
// class CategoryScreen extends StatefulWidget {
//   @override
//   _CategoryScreenState createState() => _CategoryScreenState();
// }
//
// class _CategoryScreenState extends State<CategoryScreen> {
//   int selectedRating = 0;
//
//
//   List<Category> categories = [
//     Category(
//       name: 'Fruits',
//       subcategories: ['Apple', 'Banana', 'Orange', 'Grapes',],
//     ),
//     Category(
//       name: 'Vegetables',
//       subcategories: ['Carrot', 'Broccoli', 'Spinach', 'Tomato'],
//     ),
//     Category(
//       name: 'Meat',
//       subcategories: ['Chicken', 'Beef', 'Pork', 'Lamb'],
//     ),
//     Category(
//       name: 'Dairy',
//       subcategories: ['Milk', 'Cheese', 'Yogurt', 'Butter'],
//     ),
//   ];
//
//   Category? selectedCategory;
//   List<String> selectedSubcategories = [];
//
//   void _selectCategory(Category category) {
//     setState(() {
//       selectedCategory = category;
//       selectedSubcategories.clear();
//     });
//   }
//
//   void _toggleSubcategory(String subcategory) {
//     setState(() {
//       if (selectedSubcategories.contains(subcategory)) {
//         selectedSubcategories.remove(subcategory);
//       } else {
//         selectedSubcategories.add(subcategory);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CustomColor.WhiteColor,
//       appBar: AppBar(
//         backgroundColor: CustomColor.WhiteColor,
//         // Set the background color of the AppBar
//         elevation: 0,
//         // Set the elevation to 0 to remove the shadow
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Container(
//                 padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: CustomColor.TextFieldColor,
//                     gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomCenter,
//                       colors: [Color(0xff2e286e), Color(0xff2799d5)], // Replace with your desired colors
//                     )
//                 ),
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Icon(
//                     Icons.arrow_back_ios,
//                     size: 12,
//                     color: Colors.white, // Icon color
//                   ),
//                 ),
//               ),
//             ),
//             Text(
//               'Filter',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   color: CustomColor.TextFieldColor,
//                   gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomCenter,
//                     colors: [Color(0xff2e286e), Color(0xff2799d5)], // Replace with your desired colors
//                   )
//               ),
//               child: Align(
//                 alignment: Alignment.center,
//                 child: Icon(
//                   Icons.search,
//                   size: 12,
//                   color: Colors.white, // Icon color
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Stack(
//          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height,
//             ),
//             SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Text(
//                     'Select a Category:',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 10),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: categories.map((category) {
//                         bool isSelected = category == selectedCategory;
//                         return GestureDetector(
//                           onTap: () {
//                             _selectCategory(category);
//                           },
//                           child: Container(
//                             width: 100,
//                             margin: EdgeInsets.symmetric(horizontal: 8),
//                             padding: EdgeInsets.all(8),
//                             decoration: isSelected?BoxDecoration(
//                               gradient: CustomColor.GradientColor,
//                               borderRadius: BorderRadius.circular(20),
//                             ):BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: CustomColor.TextGreyColor
//                             ),
//                             child: Center(
//                               child: Text(
//                                 category.name,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 ),
//                                 maxLines: 1,
//                                // overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   selectedCategory != null
//                       ? Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Select Subcategories:',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 10),
//                       Wrap(
//                         spacing: 8,
//                         runSpacing: 8,
//                         children: selectedCategory!.subcategories.map((subcategory) {
//                           bool isSelected = selectedSubcategories.contains(subcategory);
//                           return GestureDetector(
//                             onTap: () {
//                               _toggleSubcategory(subcategory);
//                             },
//                             child: Container(
//                               width: 100,
//                               padding: EdgeInsets.all(8),
//                               decoration:  isSelected ?BoxDecoration(
//
//                                 gradient: CustomColor.GradientColor,
//                                 borderRadius: BorderRadius.circular(20),
//                               ):BoxDecoration(
//
//                           color: CustomColor.TextGreyColor,
//                           borderRadius: BorderRadius.circular(20),
//                           )
//                             ,
//                               child: Text(
//                                 subcategory,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 ),
//                                 maxLines: 1,
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ],
//                   )
//                       : SizedBox.shrink(),
//                   SizedBox(height: 20,),
//                   Row(
//                     children: [
//                       Text(
//                         'Select Price Range',
//                         style: CustomColor.StyleBlackbold.copyWith(fontSize: 18)
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   PriceRangeSlider(),
//                   SizedBox(
//                    height: 50,
//                    )
//                 ],
//               ),
//             ),
//             Positioned(
//               bottom: 1,
//               child: GestureDetector(
//                 onTap: (){},
//                 child: Container(
//                   width: MediaQuery.of(context).size.width*.9,
//                     padding: EdgeInsets.all(15),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10), color: CustomColor.DarkBlueColor,
//
//                     ),
//                     child: Center(child: Text("Filter",style: CustomColor.StyleWhitenormal,))               // style: ButtonStyle(
//                 ),
//               ),
//             ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
// class PriceRangeSlider extends StatefulWidget {
//   @override
//   _PriceRangeSliderState createState() => _PriceRangeSliderState();
// }
//
// class _PriceRangeSliderState extends State<PriceRangeSlider> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     print("hgjhhjhjf");
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Text('Low Price: \$${Provider.of<MethodsProvider>(context).lowPrice.toStringAsFixed(2)}'),
//           Text('High Price: \$${Provider.of<MethodsProvider>(context).highPrice.toStringAsFixed(2)}'),
//           ],
//         ),
//         RangeSlider(
//           values: RangeValues(Provider.of<MethodsProvider>(context).lowPrice, Provider.of<MethodsProvider>(context).highPrice),
//           min: 0,
//           max: 1000,
//           onChanged: (values){
//             Provider.of<MethodsProvider>(context,listen: false).rangevalues(values);
//           }
//         ),
//       ],
//     );
//   }
// }
//
//
//
//



///

import 'package:com.classic.classicparts/Providers/api_provider.dart';
import 'package:com.classic.classicparts/Providers/methods_provider.dart';
import 'package:com.classic.classicparts/constants.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/category_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/sub_category_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Category {
  final String name;
  final List<String> subcategories;

  Category({required this.name, required this.subcategories});
}

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late final response;

  // List<Category> categories = [
  //   Category(
  //     name: 'Fruits',
  //     subcategories: ['Apple', 'Banana', 'Orange', 'Grapes',],
  //   ),
  //   Category(
  //     name: 'Vegetables',
  //     subcategories: ['Carrot', 'Broccoli', 'Spinach', 'Tomato'],
  //   ),
  //   Category(
  //     name: 'Meat',
  //     subcategories: ['Chicken', 'Beef', 'Pork', 'Lamb'],
  //   ),
  //   Category(
  //     name: 'Dairy',
  //     subcategories: ['Milk', 'Cheese', 'Yogurt', 'Butter'],
  //   ),
  // ];
  // @override
  // void initState() {
  //   res();
  //  // print("initresctegoryapi----$response");
  //  // print("initresctegoryapi----${Provider.of<ApiProvider>(context,listen: false).categorlist}");
  //   super.initState();
  // }
  // Future<void> res() async {
  //  await Provider.of<ApiProvider>(context,listen: false).fetchCategory(context);
  //
  // }
  //  Categories?  selectedCategory;
  // final selectedSubcategories = [];
  //
  // void _selectCategory(category) {
  //   setState(() {
  //     selectedCategory = category;
  //     selectedSubcategories.clear();
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.WhiteColor,
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
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff2e286e), Color(0xff2799d5)], // Replace with your desired colors
                    )
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
              'Filter',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
            ),
            Container(
              padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: CustomColor.TextFieldColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff2e286e), Color(0xff2799d5)], // Replace with your desired colors
                  )
              ),
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.search,
                  size: 12,
                  color: Colors.white, // Icon color
                ),
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Select a Category:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 100,
                    child: FutureBuilder<CategoryModel>(future:Provider.of<ApiProvider>(context).fetchCategory(context) , builder: (context,AsyncSnapshot<CategoryModel>snapshot){
                      if(!snapshot.hasData)
                      {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.categories?.length,
                          itemBuilder: (context,index){
                         final category= snapshot.data!.categories?[index];
                         bool isSelected = category == Provider.of<MethodsProvider>(context,listen: true).selectedCategory;
                          return GestureDetector(
                            onTap: () {
                              Provider.of<MethodsProvider>(context,listen: false).selectCategory(category);
                              print("$isSelected");
                            },
                            child: Container(
                              width: 100,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              padding: EdgeInsets.all(8),
                              decoration: isSelected?BoxDecoration(
                                gradient: CustomColor.GradientColor,
                                borderRadius: BorderRadius.circular(20),
                              ):BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: CustomColor.TextGreyColor
                              ),
                              child: Center(
                                child: Text(
                                  category!.name.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  maxLines: 1,
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          );


                      });
                    }),
                  ),
                  SizedBox(height: 20),
                  Provider.of<MethodsProvider>(context,listen: false).selectedCategory != null
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Subcategories:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 100,
                        child: FutureBuilder<SubCategoryModel>(future:Provider.of<ApiProvider>(context).fetchsubCategory(context,Provider.of<MethodsProvider>(context,listen: true).selectedCategory?.id) , builder: (context,AsyncSnapshot<SubCategoryModel>snapshot)
                        {
                          if(!snapshot.hasData)
                          {
                            return Center(child: CircularProgressIndicator());
                          }
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.subcategories?.length,
                              itemBuilder: (context,index){
                               final subcategory=snapshot.data!.subcategories![index];
                                  bool isSelected = Provider.of<MethodsProvider>(context,listen: true).selectedSubcategories.contains(subcategory);
                                  return GestureDetector(
                                    onTap: () {
                                      Provider.of<MethodsProvider>(context,listen: false).toggleSubcategory(subcategory);
                                    },
                                    child: Container(
                                      width: 100,
                                      padding: EdgeInsets.all(8),
                                      decoration:  isSelected ?BoxDecoration(

                                        gradient: CustomColor.GradientColor,
                                        borderRadius: BorderRadius.circular(20),
                                      ):BoxDecoration(

                                        color: CustomColor.TextGreyColor,
                                        borderRadius: BorderRadius.circular(20),
                                      )
                                      ,
                                      child: Text(
                                        subcategory.name.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );



                              });
                        }),
                      ),

                    ],
                  )
                      : SizedBox.shrink(),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text(
                          'Select Price Range',
                          style: CustomColor.StyleBlackbold.copyWith(fontSize: 18)
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  PriceRangeSlider(),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 1,
              child: GestureDetector(
                onTap: (){},
                child: Container(
                    width: MediaQuery.of(context).size.width*.9,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: CustomColor.DarkBlueColor,

                    ),
                    child: Center(child: Text("Filter",style: CustomColor.StyleWhitenormal,))               // style: ButtonStyle(
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}




class PriceRangeSlider extends StatefulWidget {
  @override
  _PriceRangeSliderState createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {


  @override
  Widget build(BuildContext context) {
    print("hgjhhjhjf");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Low Price: \$${Provider.of<MethodsProvider>(context).lowPrice.toStringAsFixed(2)}'),
            Text('High Price: \$${Provider.of<MethodsProvider>(context).highPrice.toStringAsFixed(2)}'),
          ],
        ),
        RangeSlider(
            values: RangeValues(Provider.of<MethodsProvider>(context).lowPrice, Provider.of<MethodsProvider>(context).highPrice),
            min: 0,
            max: 1000,
            onChanged: (values){
              Provider.of<MethodsProvider>(context,listen: false).rangevalues(values);
            }
        ),
      ],

    );
  }




}



///
///
