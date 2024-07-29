///unusedcode here define reusedcode


// import 'package:com.classic.classicparts/constants.dart';
// import 'package:flutter/material.dart';
//
// class DeliveryAddressScreen extends StatelessWidget {
//   void showBottomSheett(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         return BottomSheetContent();
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => showBottomSheett(context),
//           child: Text('Toggle Bottom Sheet'),
//         ),
//       ),
//     );
//   }
// }
//
// class BottomSheetContent extends StatefulWidget {
//   @override
//   _BottomSheetContentState createState() => _BottomSheetContentState();
// }
//
// class _BottomSheetContentState extends State<BottomSheetContent> {
//   bool isExpanded = false;
//   String houseNumber = '';
//   String street = '';
//   String area = '';
//   String deliveryInstructions = '';
//
//   int selectedDeliveryOption = 0;
//
//   final List <Map<String,dynamic>> deliveryOptions = [
//     { 'text':'Home','icon':Icons.home},
//     { 'text':'Shop','icon':Icons.shop_2_outlined},
//     { 'text':'Other','icon':Icons.add}
//   ];
//
//   void _selectDeliveryOption(int index) {
//     setState(() {
//       selectedDeliveryOption = index;
//     });
//   }
//
//
//   void _toggleBottomSheet() {
//     setState(() {
//       isExpanded = !isExpanded;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final double maxHeight = MediaQuery.of(context).size.height * 0.8;
//
//     return SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Delivery Details',style: CustomColor.StyleBlackbold,),
//             Container(
//               height: 100,
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                  // gradient: CustomColor.GradientColor
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         height:60,
//                         width: 60,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                            // border: Border.all(color: CustomColor.TextGreyColor)
//                         ),
//                         child: Icon(Icons.location_on_outlined,color: CustomColor.BlackColor,),
//
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Anarkali',),
//                           Text(' lahore',),
//                         ],),
//                     ],
//                   ),
//                   Container(
//                     height:30,
//                     width: 30,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                       //  border: Border.all(color: CustomColor.TextGreyColor)
//                     ),
//                     child: Icon(Icons.edit,color: CustomColor.BlackColor,),
//
//                   ),
//                 ],
//               ),
//             ),
//
//             _buildTextField('House Number', (value){ houseNumber = value;}),
//             _buildTextField('Street', (value) => street = value),
//             _buildTextField('Area', (value) => area = value),
//             _buildTextField('Delivery Instructions', (value) => deliveryInstructions = value),
//
//             SizedBox(height: 16.0),
//             Text(
//               'Add Label',
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: List.generate(deliveryOptions.length, (index) {
//                 return _buildDeliveryOption(index, deliveryOptions[index]);
//               }),
//             ),
//             SizedBox(height: 10,),
//             Container(
//               width: double.infinity,
//              // margin: EdgeInsets.symmetric(horizontal: 20),
//               child: ElevatedButton(
//
//                   style: ButtonStyle(
//                       backgroundColor: MaterialStatePropertyAll(CustomColor.DarkBlueColor),
//                       padding: MaterialStatePropertyAll(EdgeInsets.all(15))
//
//                   ),
//                   onPressed: (){}, child: Text("Add New Address",style: CustomColor.StyleWhitenormal,)),
//             )
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(String labelText, Function(String) onChanged) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('$labelText', style: TextStyle(fontWeight: FontWeight.bold),),
//         TextFormField(
//           //  controller: controller,
//           onChanged: onChanged,
//           cursorColor: Colors.black,
//           decoration: InputDecoration(
//             hintText: labelText,
//             hintStyle: TextStyle(color: Color(0xffCBCBCB)),
//             contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//             prefixIcon: Icon(Icons.access_alarm),
//             //suffixIcon: labelText == 'Password' ? _buildPasswordStrengthIndicator() : null,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(20.0),
//               borderSide: BorderSide.none,
//             ),
//             filled: true,
//             fillColor: Color(0xffF8F8F8),
//           ),
//           // validator: validator,
//         ),
//
//       ],
//     );
//   }
//
//   Widget _buildDeliveryOption(int index, Map<String,dynamic> option) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: () => _selectDeliveryOption(index),
//           child: Card(
//             elevation: 4,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(50.0),
//
//             ),
//             child: Container(
//               height: 60,
//               width: 60,
//               decoration: BoxDecoration(
//                 color: selectedDeliveryOption == index ? Colors.blue : Colors.grey[300],
//                 borderRadius: BorderRadius.circular(50.0),
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//               child: Row(
//                 //  mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     option['icon'],
//                     color: selectedDeliveryOption == index ? Colors.white : Colors.transparent,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Text("${option['text']}")
//       ],
//     );
//   }
// }
//
