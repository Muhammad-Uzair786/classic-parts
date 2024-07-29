import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import 'forgot_password_screen.dart';
import 'login_screen.dart';
import 'new_password_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final phone;

  OtpVerificationScreen({required this.phone});

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String smscode = '';
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }
String errorMessage='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        // Set the elevation to 0 to remove the shadow
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding:
                    EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: CustomColor.GradientColor,
                ),
                child: const Align(
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
              'Verification',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Phone Verification',
                style: TextStyle(color: Color(0xffCBCBCB)),
              ),
              Text(
                'Enter your OTP Code',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                //margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return Flexible(
                      child: Container(
                        // width: 50,
                        // height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: TextFormField(
                          focusNode: _focusNodes[index],
                          controller: _otpControllers[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                          maxLength: 1,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              if (index < 5) {
                                _focusNodes[index + 1].requestFocus();
                              } else {
                                _focusNodes[index].unfocus();
                              }
                            } else {
                              if (index > 0) {
                                _focusNodes[index - 1].requestFocus();
                              }
                            }
                            print('wwwww$value');
                            print('ccc${_otpControllers[index].text}');


                          },
                          onFieldSubmitted: (value) {
                            if (value.isEmpty && index > 0) {
                              _focusNodes[index - 1].requestFocus();
                            }
                            print('wwwww$value');
                            print('wwwww${_otpControllers[index].text}');


                          },
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter the OTP';
                          //   }
                          //   return null;
                          // },
                          cursorColor: CustomColor.BlackColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                            // Adjust text alignment
                            filled: true,
                            fillColor: CustomColor.TextFieldColor,
                            counterText: "",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              errorMessage.isNotEmpty?
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text("${errorMessage}",style: TextStyle(color: CustomColor.RedColor),),
                  ):
              SizedBox(height: 20),
              GestureDetector(
                onTap:() async {
                  try {
                    smscode='';
                    for(int i=0;i<6;i++) {
                      if(_otpControllers[0].text.isNotEmpty &&_otpControllers[1].text.isNotEmpty&&_otpControllers[2].text.isNotEmpty&&
                          _otpControllers[3].text.isNotEmpty&&_otpControllers[4].text.isNotEmpty&&_otpControllers[5].text.isNotEmpty
                      ) {
                        for(int i=0;i<6;i++)
                        {
                          smscode = smscode + _otpControllers[i].text;

                        }
                        setState(() {
                          errorMessage='';

                        });
                        print('smscode$smscode');
                        // Perform verification logic here
                        // If the OTP is correct, proceed to the next screen
                        // If not, show an error message
                        PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: ForgotPasswordScreen.verifyid,
                            smsCode: '${smscode}');
                        print("cred$credential");
                        print("credtoken${credential.accessToken}");
                        await auth.signInWithCredential(credential);

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewPasswordScreen(
                              phone: widget.phone,
                            ) //OtpScreen()
                        ));
                        print('OTP Verified');
                      }else{
                        setState(() {
                          errorMessage = 'Please fill all the OTP boxes';
                        });
                      }
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("OTP Verification Code is Invalid")));
                  }
                } ,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: CustomColor.GradientColor

                  ),

                  // onPressed: () async {
                  //   try {
                  //
                  //     if (_formKey.currentState!.validate()) {
                  //       for(int i=0;i<6;i++)
                  //         {
                  //           if(_otpControllers[i].text.isEmpty)
                  //             {
                  //               setState(() {
                  //                 errorMessage = 'Please fill all the OTP boxes';
                  //               });
                  //             }
                  //           else {
                  //             smscode = smscode + _otpControllers[i].text;
                  //           }
                  //         }
                  //       print('smscode$smscode');
                  //       // Perform verification logic here
                  //       // If the OTP is correct, proceed to the next screen
                  //       // If not, show an error message
                  //       PhoneAuthCredential credential =
                  //           PhoneAuthProvider.credential(
                  //               verificationId: ForgotPasswordScreen.verifyid,
                  //               smsCode: '${smscode}');
                  //       print("cred$credential");
                  //       print("credtoken${credential.accessToken}");
                  //       await auth.signInWithCredential(credential);
                  //
                  //       Navigator.of(context).push(MaterialPageRoute(
                  //           builder: (context) => NewPasswordScreen(
                  //                 phone: widget.phone,
                  //               ) //OtpScreen()
                  //           ));
                  //       print('OTP Verified');
                  //     }
                  //   } catch (e) {
                  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("OTP Verification Code is Invalid")));
                  //   }
                  // },
                  child: Text(
                    'Verify',textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("If you didn't receive a code! "),
                  GestureDetector(
                    onTap: () async {
                      showLoadingIndicator(context);

                      String phoneNumber=  widget.phone;
                      if (phoneNumber.startsWith("0")) {
                        phoneNumber = phoneNumber.replaceFirst("0", "+92");
                      }
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '${phoneNumber}',
                        verificationCompleted: (
                            PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          Navigator.of(context).pop();

                          ForgotPasswordScreen.verifyid = verificationId;
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    },
                    child: Text(
                      "Resend",
                      style: TextStyle(
                          color: CustomColor.BlackColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
