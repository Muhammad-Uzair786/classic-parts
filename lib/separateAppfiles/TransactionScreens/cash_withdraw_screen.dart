import 'package:com.classic.classicparts/Providers/api_provider.dart';
import 'package:com.classic.classicparts/Providers/authrememberprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CashWithdrawScreen extends StatefulWidget {
  @override
  _CashWithdrawScreenState createState() => _CashWithdrawScreenState();
}

class _CashWithdrawScreenState extends State<CashWithdrawScreen> {
  final _formKey = GlobalKey<FormState>();
  final _digitValidator = RegExp(r'^[0-9]*$');

  String amount = '';
  String accountName = '';
  int selectedRadio = 1;
   TextEditingController phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    phoneController.text=Provider.of<RememberMeProvider>(context,listen: false).phoneNumber;
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
                child: Align(
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
              '${tr?.withdraw_cash}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: CustomColor.BlackColor),
            ),
            SizedBox(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildCardWithLabel(
                  labelText: '${tr?.account_title}',
                  child: TextFormField(
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                     // prefixIcon: Icon(Icons.attach_money),

                      hintText: "${tr?.ali_hassan}",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Color(0xffF8F8F8),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),

                    ),

                    onChanged: (value) {
                      setState(() {
                        accountName = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '${tr?.please_enter_your_acc_name}';
                      }
                      return null;
                    },
                  ),
                ),
                _buildCardWithLabel(
                  labelText: "${tr?.your_mobile_number}",
                  child: TextFormField(
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    readOnly: true,
                    controller: phoneController,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),                      filled: true,
                      fillColor: Color(0xffF8F8F8),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      suffixIcon: Icon(Icons.verified,color: CustomColor.BlueColor,),
                    ),


                  ),
                ),
                SizedBox(height: 16.0),
                Text("${tr?.account_type}",style: TextStyle(color: CustomColor.BlackColor,fontSize: 15,fontWeight: FontWeight.bold),),
                SizedBox(height: 5.0),

                SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RadioCard(
                        icon: Icons.paid,
                        name: '${tr?.easyPaisa}',
                        radioValue: 1,
                        groupValue: selectedRadio,
                        onChanged: (value) {
                          setState(() {
                            selectedRadio = value!;
                          });
                        },
                      ),
                      SizedBox(width: 10,),
                      RadioCard(
                        icon: Icons.paid,
                        name: '${tr?.jazzCash}',
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
                SizedBox(height: 16.0),
                _buildCardWithLabel(
                  labelText: '${tr?.enter_amount}',
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.start,

                    inputFormatters: [FilteringTextInputFormatter.allow(_digitValidator)],

                    cursorColor: CustomColor.BlackColor,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xffF8F8F8),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      hintText: "${tr?.eg} 1200",
                      hintStyle: TextStyle(color: Colors.grey),
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
        SizedBox(height: 10.0),

        Text(
          labelText,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 5.0),

        child

      ],
    );
  }

  void _proceedButtonAction() {
    bool isapicalled = false;

    showDialog(
      context: context,
      builder: (context){
        var tr= AppLocalizations.of(context);

        return StatefulBuilder(
            builder: (context,StateSetter setState)
        {
          return AlertDialog(
            title: Text('${tr?.confirm_transaction}'),
            content: Container(
              constraints: BoxConstraints(maxHeight: 150),
              child: isapicalled==true?
              Center(child: CircularProgressIndicator()):Text(
                  '${tr?.account_title}: $accountName \n${tr?.mobile_number}: ${phoneController
                      .text}\n${tr?.account_type}: ${selectedRadio == 1
                      ? "${tr?.easyPaisa}"
                      : "${tr?.jazzCash}"}\n${tr?.amount}:$amount'
              ),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  //Navigator.of(context).pop();
                  setState(() {
                    isapicalled=true;

                  });
                  await  _performTransaction();
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
        });
      }
    );
  }

   _performTransaction() async {
     var tr= AppLocalizations.of(context);

     print("${selectedRadio==1?"${tr?.easyPaisa}":"${tr?.jazzCash}"}");
    print("${phoneController.text}$amount");
    print("${accountName}");
    await Provider.of<ApiProvider>(context, listen: false).WithdrawRequest(context, accountName, phoneController.text,selectedRadio==1?"EasyPaisa":"JazzCash",amount.toString(),);
    print('Transaction completed successfully!');
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
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: radioValue == groupValue ? CustomColor.GradientColor:CustomColor.WhiteGradientColor,

      ),

      child: ListTile(
        // leading: CircleAvatar(
        //   backgroundColor: CustomColor.DarkBlueColor,
        //   child: Icon(icon, color: Colors.white),
        // ),
        contentPadding: EdgeInsets.only(left: 10),
        leading: Text(name,style: TextStyle(color: radioValue == groupValue ?Colors.white:Colors.black,fontSize: 15),),
        trailing: Radio<int>(
          value: radioValue,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: Colors.white,
        ),
      ),
    );
  }
}
