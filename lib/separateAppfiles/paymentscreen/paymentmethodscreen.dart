import 'package:com.classic.classicparts/constants.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int selectedRadio = -1;

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
                  //color: CustomColor.DarkBlueColor,
                  gradient: CustomColor.GradientColor
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 12,
                    color: CustomColor.WhiteColor, // Icon color
                  ),
                ),
              ),
            ),
            Text(
              'PaymentMethod',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox()
          ],
        ),
      ),
      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Pay With",style: TextStyle(color: CustomColor.BlackColor,fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              RadioCard(
                icon: Icons.paid,
                name: 'EasyPaisa',
                radioValue: 1,
                groupValue: selectedRadio,
                onChanged: (value) {
                  setState(() {
                    selectedRadio = value!;
                  });
                },
              ),
              SizedBox(height: 10,),
              RadioCard(
                icon: Icons.paid,
                name: 'JazzCash',
                radioValue: 2,
                groupValue: selectedRadio,
                onChanged: (value) {
                  setState(() {
                    selectedRadio = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RadioCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final int radioValue;
  final int groupValue;
  final ValueChanged<int?>? onChanged;

  RadioCard({
    required this.icon,
    required this.name,
    required this.radioValue,
    required this.groupValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(20),
     gradient: radioValue == groupValue ? CustomColor.GradientColor:CustomColor.WhiteGradientColor,

     ),

      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: CustomColor.DarkBlueColor,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(name),
        trailing: Radio<int>(
          value: radioValue,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: CustomColor.WhiteColor,
        ),
      ),
    );
  }
}
