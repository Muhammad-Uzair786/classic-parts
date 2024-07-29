import 'package:com.classic.classicparts/Providers/api_provider.dart';
import 'package:com.classic.classicparts/separateAppfiles/MainBottomNavigationPage.dart';
import 'package:com.classic.classicparts/separateAppfiles/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CashTransactionScreen extends StatefulWidget {
  @override
  _CashTransactionScreenState createState() => _CashTransactionScreenState();
}

class _CashTransactionScreenState extends State<CashTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  String mobileNumber = '';
  String amount = '';
  String note = 'null';

  @override
  Widget build(BuildContext context) {
    var tr= AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: CustomColor.WhiteColor,
      appBar: AppBar(
        backgroundColor: CustomColor.WhiteColor,
        automaticallyImplyLeading: false,
        elevation: 0,
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
                    gradient: CustomColor.GradientColor),
                child: const Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Text(
              '${tr?.transactions}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildCardWithLabel(
                  labelText: "${tr?.enter_receiver_mobile_number}",
                  child: TextFormField(
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    textAlign: TextAlign.start,

                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "0345....",
                      hintStyle: TextStyle(color: Colors.grey),

                      prefixIcon: Icon(Icons.phone),

                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      filled: true,
                      fillColor: Color(0xffF8F8F8),
                    ),
                    onChanged: (value) {
                      setState(() {
                        mobileNumber = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '${tr?.please_enter_your_phone_number}';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                _buildCardWithLabel(
                  labelText: '${tr?.enter_amount}',
                  child: TextFormField(
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "1000",
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      prefixIcon: Icon(Icons.attach_money),

                      filled: true,
                      fillColor: Color(0xffF8F8F8),
                    ),
                    onChanged: (value) {
                      setState(() {
                        amount = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '${tr?.please_enter_an_amount}';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                _buildCardWithLabel(
                  labelText: '${tr?.note_optional}',
                  child: TextFormField(
                    textAlign: TextAlign.start,
                        maxLines: 3,
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "${tr?.enter_instructions}",
                      hintStyle: TextStyle(color: Colors.grey),

                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),

                      filled: true,
                      fillColor: Color(0xffF8F8F8),

                    ),

                    onChanged: (value) {
                      setState(() {
                        note = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16.0),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _proceedButtonAction();
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),

                    decoration: BoxDecoration(
                        gradient: CustomColor.GradientColor,
                        borderRadius: BorderRadius.circular(20)
                    ),

                    child: Center(child: Text('${tr?.proceed}',style: TextStyle(color: CustomColor.WhiteColor,fontWeight: FontWeight.bold),)),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardWithLabel({required String labelText, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 5,),
        child,

      ],
    );
  }

  void _proceedButtonAction() {
    bool isapicalled = false;

    showDialog(
      context: context,
      builder: (context){
        var tr= AppLocalizations.of(context);

        return
        StatefulBuilder(
          builder: (context,StateSetter setState) {
            return AlertDialog(
            title: Text('${tr?.confirm_transaction}'),
            content:  Container(
              constraints: BoxConstraints(maxHeight: 150),
              child:isapicalled==true?
          Center(child: CircularProgressIndicator()):Text(
              '${tr?.mobile_number}: $mobileNumber\n${tr?.amount}:  $amount\n${tr?.note}: $note',
            ),),
            actions: [

              TextButton(
                onPressed: () async {
                  //Navigator.of(context).pop();
                  setState(() {
                    isapicalled=true;

                  });
                 await  _performTransaction(context);
                 setState(() {
                   isapicalled=false;

                 });
                  Navigator.of(context).pop();

                },
                child: Text('${tr?.confirm}'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('${tr?.cancel}'),
              ),


            ],
      );
          }
        );
  }
    );
  }

  Future<void> _performTransaction(BuildContext context) async {
  await  Provider.of<ApiProvider>(context, listen: false).SendCash(context, amount, mobileNumber, note);
   // print('Transaction completed successfully!');
  }
}
