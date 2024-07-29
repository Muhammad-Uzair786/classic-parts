import 'package:com.classic.classicparts/constants.dart';
import 'package:flutter/material.dart';

class ProductCashListingScreen extends StatelessWidget {
  const ProductCashListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Products')),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),

        child: Column(
          children: [
            HeaderCard(),
            SizedBox(height: 20),
            DataCard(
              serialNo: '001',
              productName: 'Gear Shaft SD-110',
              cash: '\$100',
            ),
            DataCard(
              serialNo: '002',
              productName: 'Gutka Coil All China',
              cash: '\$200',
            ),
            DataCard(
              serialNo: '003',
              productName: 'Indicator CG-125',
              cash: '\$150',
            ),
            DataCard(
              serialNo: '004',
              productName: 'Engine Valve CG-125',
              cash: '\$180',
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient:CustomColor.GradientColor,
        borderRadius: BorderRadius.circular(16),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.blue.withOpacity(0.5),
        //     spreadRadius: 2,
        //     blurRadius: 5,
        //     offset: Offset(0, 3),
        //   ),
        // ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderText(
              text: 'Sr No',
            ),
            HeaderText(
              text: 'Product Name',
            ),
            HeaderText(
              text: 'Cash',
            ),
          ],
        ),
      ),
    );
  }
}

class DataCard extends StatelessWidget {
  final String serialNo;
  final String productName;
  final String cash;

  const DataCard({
    Key? key,
    required this.serialNo,
    required this.productName,
    required this.cash,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
     // color: Colors.blue.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade100, Colors.blue.shade300],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DataText(
              text: '$serialNo',
            ),
            DataText(
              text: '$productName',
            ),
            DataText(
              text: '$cash',
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  final String text;

  const HeaderText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: 'Roboto',
      ),
    );
  }
}

class DataText extends StatelessWidget {
  final String text;

  const DataText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: 'Roboto',
      ),
    );
  }
}
