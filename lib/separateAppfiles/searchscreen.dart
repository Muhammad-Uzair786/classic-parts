import 'package:com.classic.classicparts/Providers/api_provider.dart';
import 'package:com.classic.classicparts/constants.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/search_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/product_detail_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<String> _searchHistory = [];
 bool boolSearch=false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchSubmitted(String query) {
    if (query.isNotEmpty) {
      setState(() {
        _searchHistory.add(query);
      });
    }
  }

  void _onClearSearchHistory() {
    setState(() {
      _searchHistory.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.WhiteColor,
      appBar: AppBar(
        backgroundColor: CustomColor.WhiteColor,
        automaticallyImplyLeading: false,// Set the background color of the AppBar
        elevation: 0, // Set the elevation to 0 to remove the shadow
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(left: 8,right: 6,top: 8,bottom: 8),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: CustomColor.GradientColor,
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
              'Search Item',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: CustomColor.BlackColor),
            ),
            SizedBox(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: CustomColor.TextFieldColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onSubmitted: _onSearchSubmitted,
                      cursorColor: CustomColor.BlackColor,
                      decoration: InputDecoration(
                        hintText: "Search your product",

                        hintStyle: TextStyle(color: CustomColor.TextGreyColor,fontSize: 15),
                        border: InputBorder.none,

                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      _onSearchSubmitted(_searchController.text);
                      boolSearch=true;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          boolSearch? Expanded(

            child: FutureBuilder<SearchModel>(future: Provider.of<ApiProvider>(context).fetchsearchproduct(context,_searchController.text) , builder: (context,AsyncSnapshot<SearchModel>snapshot){
              if(_searchController.text.isEmpty)
              {
                return Center(child: Text("Your Products Appear here"));
              }
              // else if(snapshot.data=='null')
              // {
              //   Center(child: Text("Searched Product not found"),);
              // }
              else if(!snapshot.hasData && _searchController.text.isNotEmpty)
              {
                return Center(child: Text("Searched Product not found"),);;
              }
            // boolSearch=false;

              return  GridView.builder(
                itemCount: snapshot.data?.products?.length,
                //shrinkWrap: true,
                //physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  final product=snapshot.data?.products![index];
                  return Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailBody(product_id: product?.id,)));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.3,
                            margin: EdgeInsets.only(top: index % 2 == 0 ? 0 : 30),
                            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${snapshot.data?.products![index].thumbnailUrl}"), fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .end,
                              children: [
                                // GestureDetector(
                                //   onTap: () {
                                //     // setState(() {
                                //     //   selectedindex = index;
                                //     // });
                                //   },
                                //   child: Padding(
                                //     padding: const EdgeInsets.all(8.0),
                                //     child: CircleAvatar(
                                //         radius: 12,
                                //         backgroundColor: Colors
                                //             .grey[300],
                                //         child: Icon(
                                //             selectedindex == index
                                //                 ? Icons.favorite
                                //                 : Icons.favorite_border,
                                //             size: 15,
                                //             color: selectedindex ==
                                //                 index ? CustomColor
                                //                 .BlueColor : Colors
                                //                 .white)),
                                //   ),
                                // ),
                                SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ),
                        Text("${product?.productName}",style: TextStyle(color: CustomColor.BlackColor,)),
                        Text("${product?.productPrice}",style: TextStyle(color: CustomColor.BlackColor,)),
                      ],
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .52,
                    mainAxisSpacing: 2),
              );
            }),
          ): Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Searches",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.BlackColor
                      ),
                    ),
                    _searchHistory.isNotEmpty
                        ? GestureDetector(
                        onTap: (){
                          setState(() {
                            _onClearSearchHistory();
                          });
                        },
                        child: Text("Clear all",style: TextStyle(color: CustomColor.TextGreyColor,),))
                        : Container(),
                  ],
                ),
                SizedBox(height: 8),
                _searchHistory.isEmpty
                    ? Text("No search history",style: TextStyle(color: CustomColor.BlackColor,))
                    : Column(
                  children: _searchHistory.map((query) {
                    return ListTile(
                      title: Text(query,style: TextStyle(color: CustomColor.TextGreyColor),),
                      onTap: () {
                        // Handle search history tap
                      },
                    );
                  }).toList(),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
