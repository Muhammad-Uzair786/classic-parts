import 'package:com.classic.classicparts/Providers/api_provider.dart';
import 'package:com.classic.classicparts/Providers/authrememberprovider.dart';
import 'package:com.classic.classicparts/constants.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/product_detail_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

import '../Providers/cart_provider.dart' as sp;
import '../Providers/cart_provider.dart';
import 'MainBottomNavigationPage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductDetailBody extends StatefulWidget {
  final product_id;
  final productPoints;
  ProductDetailBody({ required this.product_id, this.productPoints});
  @override
  _ProductDetailBodyState createState() => _ProductDetailBodyState();
}

class _ProductDetailBodyState extends State<ProductDetailBody> {
  int _currentImageIndex = 0;
  final List<String> images = [
    'https://neokorea.co/wp-content/uploads/2020/03/web_Auto-parts-spare-parts-car-on-the-grey-background.-1147751232_2125x1417.jpg',
    'https://cpimg.tistatic.com/05262863/b/5/extra-05262863.jpg',
    'https://cpimg.tistatic.com/05262863/b/5/extra-05262863.jpg',
    // Add more image URLs here
  ];



  void _nextImage() {
    setState(() {
      _currentImageIndex = (_currentImageIndex + 1) % images.length;
    });
  }

  void _prevImage() {
    setState(() {
      _currentImageIndex =
          (_currentImageIndex - 1 + images.length) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    var tr= AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: CustomColor.WhiteColor,
    appBar:  AppBar(
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainBottomNavigationPage()));
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
              '${tr?.product_detail}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: CustomColor.BlackColor),
            ),
            const SizedBox(width: 10,),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<ProductDetailModel>(
            future: Provider.of<ApiProvider>(context).fetchProductDetail(context, widget.product_id),
             builder: (BuildContext context, AsyncSnapshot<ProductDetailModel> snapshot) {
         if(!snapshot.hasData)
           {
             return SizedBox(
                 height: MediaQuery.of(context).size.height*.8,
                 width: MediaQuery.of(context).size.width,
                 child: Center(
                   child: SizedBox(
                       height: 100,
                       width: 100,
                       child: Image.asset("asset/applogo.png")),
                 ));
           }
         final productdetail=snapshot.data?.productDetails;

         return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
               // SizedBox(height: 20,),
                // Swiper (Carousel) of Images
                // Stack(
                //   children: [
                //     CarouselSlider.builder(
                //       itemCount:productdetail?.images?.length??1 ,
                //       options: CarouselOptions(
                //         height: 400,
                //         viewportFraction: 1,
                //         autoPlay: false,
                //         // Disable auto-play for swipe control
                //         onPageChanged: (index, reason) {
                //           setState(() {
                //             _currentImageIndex = index;
                //           });
                //         },
                //         initialPage: _currentImageIndex, // Set the initial index
                //       ),
                //       itemBuilder:
                //           (BuildContext context, int index, int realIndex) {
                //             return Container(
                //           width: 320,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(40.0),
                //             image: DecorationImage(
                //               image: NetworkImage(productdetail!.images!.isNotEmpty?productdetail?.images![index]:productdetail.thumbnailUrl),
                //               fit: BoxFit.cover,
                //             ),
                //           ),
                //         );
                //       },
                //     ),
                //     // Previous Button
                //     Positioned(
                //       left: 60,
                //       bottom: 20,
                //       right: 50,
                //       child: Column(
                //         children: [
                //           Container(
                //             height: 40,
                //             width: 40,
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(20),
                //                 color: Colors.black),
                //             child: Row(
                //               children: [
                //                 GestureDetector(
                //                     onTap: _prevImage,
                //                     child: Icon(
                //                       Icons.arrow_left,
                //                       size: 20,
                //                       color: CustomColor.WhiteColor,
                //                     )),
                //                 GestureDetector(
                //                     onTap: _nextImage,
                //                     child: Icon(
                //                       Icons.arrow_right,
                //                       size: 20,
                //                       color: CustomColor.WhiteColor,
                //                     )),
                //               ],
                //             ),
                //           ),
                //
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                // Product Details

                ///new
                Stack(
                  children: [
                    CarouselSlider.builder(
                      itemCount: productdetail?.images?.length ?? 1,
                      options: CarouselOptions(
                        height: 400,
                        viewportFraction: 1,
                        autoPlay: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentImageIndex = index;
                          });
                        },
                        initialPage: _currentImageIndex,
                      ),
                      itemBuilder: (BuildContext context, int index, int realIndex) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: PhotoView(
                            imageProvider: NetworkImage(
                              productdetail!.images!.isNotEmpty
                                  ? productdetail?.images![index]
                                  : productdetail.thumbnailUrl,
                            ),
                            minScale: PhotoViewComputedScale.contained * 0.8,
                            maxScale: PhotoViewComputedScale.covered * 2,
                            initialScale:PhotoViewComputedScale.covered,
                            backgroundDecoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                          ),
                        );
                      },
                    ),
                    // Previous Button
                    Positioned(
                      left: 60,
                      bottom: 20,
                      right: 50,
                      child: Column(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: _prevImage,
                                  child: Icon(
                                    Icons.arrow_left,
                                    size: 20,
                                    color: CustomColor.WhiteColor,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: _nextImage,
                                  child: Icon(
                                    Icons.arrow_right,
                                    size: 20,
                                    color: CustomColor.WhiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${productdetail?.productName}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.BlackColor
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star,color: CustomColor.TextGreyColor,),
                          const SizedBox(width: 8.0),
                          Text('${tr?.find_quality_products}',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: CustomColor.BlackColor
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      // Row 2: Icon and Text
                      // Row(
                      //   children: [
                      //     Icon(Icons.thumb_up_alt,color: CustomColor.TextGreyColor,),
                      //     SizedBox(width: 8.0),
                      //     Text('85%(100) of user suggested this product',style: TextStyle(color: CustomColor.BlackColor),),
                      //   ],
                      // ),
                      SizedBox(height: 16),
                      Text(
                        "${productdetail?.productDescription}",
                        style: TextStyle(fontSize: 16,color: CustomColor.BlackColor),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Provider.of<RememberMeProvider>(context,listen: false).userRoleIndex!='2'?

                            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                               widget.productPoints!=null?'Total Points:':'Total Price:',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: CustomColor.BlackColor
                                ),
                              ),
                              Text(
                                widget.productPoints!=null?'${widget.productPoints}':'Rs:${productdetail?.productPrice}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.BlackColor
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ):SizedBox(),
                          GestureDetector(
                            onTap: ()  async {
                              for(int index=0;index<Provider.of<CartProvider>(context,listen: false).cartitems.length;index++)
                                {
                                     if(productdetail?.id.toString()==Provider.of<CartProvider>(context,listen: false).cartitems[index].productId.toString())
                                       {

                                       //   int a=int.parse(Provider.of<CartProvider>(context,listen: false).countvalue);
                                       // int  countupdatedvalue=a+1;
                                         //Provider.of<CartProvider>(context,listen: false).savedetailcount(countupdatedvalue.toString(),Provider.of<CartProvider>(context,listen: false).cartitems[index].productId);
                                         Provider.of<CartProvider>(context,listen: false).onCountedChanged(Provider.of<CartProvider>(context,listen: false).cartitems[index].productId!,5);



                                        // print("sameid");
                                         await Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen()));
                                         return;

                                       }
                                     print("inside detail loop");
                                     print("${productdetail?.id}");
                                     print("${Provider.of<CartProvider>(context,listen: false).cartitems.length}");
                                     print("${Provider.of<CartProvider>(context,listen: false).cartitems[0].productId}");

                                }

                              Provider.of<CartProvider>(context,listen: false).onCountedChanged(productdetail!.id.toString(),5);

                              final newItem =  await sp.CartItem(
                                  productPic: '${productdetail?.thumbnailUrl}',
                                  productName: '${productdetail?.productName}',
                                   productPrice: '${productdetail?.productPrice}',
                                   productPoints: '${widget.productPoints}',
                                  productId: '${productdetail?.id}',);
                              await Provider.of<CartProvider>(context, listen: false).addItem(newItem,);
                             await Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen()));


                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  gradient: CustomColor.GradientColor,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.shopping_bag,color: Colors.white,),
                                  SizedBox(width: 5,),
                                  Text('${tr?.add_to_cart}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },)
        ),
      ),
    );
  }
}

///
class IncrementDecrementBox extends StatefulWidget {
  @override
  _IncrementDecrementBoxState createState() => _IncrementDecrementBoxState();
}

class _IncrementDecrementBoxState extends State<IncrementDecrementBox> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: decrement,
            borderRadius: BorderRadius.circular(20),
            child: Icon(
              Icons.remove,
              size: 24,
              color: Colors.black,
            ),
          ),
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: increment,
            borderRadius: BorderRadius.circular(20),
            child: Icon(
              Icons.add,
              size: 24,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
