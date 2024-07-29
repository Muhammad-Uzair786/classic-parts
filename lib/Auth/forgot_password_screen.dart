
import 'package:com.classic.classicparts/Providers/api_provider.dart';
import 'package:com.classic.classicparts/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:password_strength/password_strength.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';
import 'otp_screen.dart';



class ForgotPasswordScreen extends StatefulWidget {
  static String verifyid='';

  const ForgotPasswordScreen({super.key});
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),

      appBar: AppBar(
        backgroundColor: CustomColor.WhiteColor, // Set the background color of the AppBar
        elevation: 0, // Set the elevation to 0 to remove the shadow
       automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.only(left: 8,right: 6,top: 8,bottom: 8),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: CustomColor.GradientColor
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
          '${AppLocalizations.of(context)?.forgot_password}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: CustomColor.BlackColor),
        ),
            const SizedBox(),
          ],
        ),
      ),



      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Text(
                  '${AppLocalizations.of(context)?.you_have_a_problem}',
                  style: const TextStyle(color: Color(0xffCBCBCB) ),
                ),
                Text(
                  '${AppLocalizations.of(context)?.reset_your_password}',
                  style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                _buildInputField('${AppLocalizations.of(context)?.phone}', _phoneController, Icons.phone, validator: validatePhone),


                const SizedBox(height: 20),
                GestureDetector(
                  onTap:() async {
                    if (_formKey.currentState!.validate()) {
                      showLoadingIndicator(context);

                      final boovalue=  await Provider.of<ApiProvider>(context,listen: false).veifyUser(_phoneController.text.toString());
                      print("verifyresponse$boovalue");
                      print("verifyresponse${boovalue.runtimeType}");
                      if(boovalue) {
                        String phoneNumber=  _phoneController.text.toString();
                        if (phoneNumber.startsWith("0")) {
                          phoneNumber = phoneNumber.replaceFirst("0", "+92");
                        }
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: '${phoneNumber}',
                          verificationCompleted: (
                              PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {
                            print("block code${e.message}");
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${e.message}"))) ;
                            Navigator.of(context).pop();
                          },
                          codeSent: (String verificationId, int? resendToken) {
                            Navigator.of(context).pop();

                            ForgotPasswordScreen.verifyid = verificationId;
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    OtpVerificationScreen(
                                      phone: _phoneController.text.toString(),)
                            ));
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                        // Perform sign-up logic here
                      }else
                      {
                        Navigator.of(context).pop();

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Doesn't Exist"))) ;
                      }

                      print('Sign in successful');
                    }
                  } ,
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: CustomColor.GradientColor

                      ),
                      child: Text('${AppLocalizations.of(context)?.send_otp}', style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)),
                ),
                // TextButton(
                //   onPressed: () async {
                //     if (_formKey.currentState!.validate()) {
                //     final boovalue=  await Provider.of<ApiProvider>(context,listen: false).veifyUser(_phoneController.text.toString());
                //     print("verifyresponse$boovalue");
                //     print("verifyresponse${boovalue.runtimeType}");
                //       if(boovalue) {
                //      String phoneNumber=  _phoneController.text.toString();
                //         if (phoneNumber.startsWith("0")) {
                //           phoneNumber = phoneNumber.replaceFirst("0", "+92");
                //         }
                //         await FirebaseAuth.instance.verifyPhoneNumber(
                //           phoneNumber: '${phoneNumber}',
                //           verificationCompleted: (
                //               PhoneAuthCredential credential) {},
                //           verificationFailed: (FirebaseAuthException e) {},
                //           codeSent: (String verificationId, int? resendToken) {
                //             ForgotPasswordScreen.verifyid = verificationId;
                //             Navigator.of(context).push(MaterialPageRoute(
                //                 builder: (context) =>
                //                     OtpVerificationScreen(
                //                       phone: _phoneController.text.toString(),)
                //             ));
                //           },
                //           codeAutoRetrievalTimeout: (String verificationId) {},
                //         );
                //         // Perform sign-up logic here
                //       }else
                //     {
                //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Doesn't Exist"))) ;
                //     }
                //
                //       print('Sign in successful');
                //     }
                //   },
                //   child: Text('${AppLocalizations.of(context)?.send_otp}', style: TextStyle(color: Colors.white)),
                //   style: ButtonStyle(
                //     backgroundColor: MaterialStateProperty.all(Color(0xff000000)),
                //   ),
                // ),
                SizedBox(height: 20.0),

                // "Already Have Account? SignUp" Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        // Add navigation to the sign-up page here
                      },
                      child: Text(
                        "${AppLocalizations.of(context)?.back_to}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'Poppins', color: Color(0xffCBCBCB)),
                      ),
                    ),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Text(
                        "${AppLocalizations.of(context)?.sign_in}",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontFamily: 'Poppins',fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String labelText, TextEditingController controller, IconData iconData, {String? Function(String?)? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$labelText', style: TextStyle(fontWeight: FontWeight.bold),),
        TextFormField(
          controller: controller,
          cursorColor: Colors.black,
          keyboardType: TextInputType.phone,
          obscureText: labelText == '${AppLocalizations.of(context)?.password}' || labelText == ''
              '${AppLocalizations.of(context)?.confirm_password}',
          decoration: InputDecoration(
            hintText: labelText,
            hintStyle: TextStyle(color: Color(0xffCBCBCB)),
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            prefixIcon: Icon(iconData,color:CustomColor.BlueColor,),
            //suffixIcon: labelText == 'Password' ? _buildPasswordStrengthIndicator() : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Color(0xffF8F8F8),
          ),
          validator: validator,
        ),
      ],
    );
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return '${AppLocalizations.of(context)?.please_enter_your_phone_number}';
    }

    // Custom phone number validation for Pakistan
    String pattern = r'^(?:\+?92)?(0?3[0-9]{2})[0-9]{7}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return '${AppLocalizations.of(context)?.please_enter_a_valid_phone_number}';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '${AppLocalizations.of(context)?.please_enter_your_password}';
    }

    // Custom password validation for at least 8 characters and strong password
    if (value.length < 8) {
      return '${AppLocalizations.of(context)?.password_must_be_at_least_8_characters}';
    }

    double strength = estimatePasswordStrength(value);
    if (strength < 0.3) {
      return '${AppLocalizations.of(context)?.password_is_weak}';
    }

    return null;
  }}
String? validateConfirmPassword(String? value, String password,context) {
  if (value == null || value.isEmpty) {
    return '${AppLocalizations.of(context)?.please_confirm_your_password}';
  }

  if (value != password) {
    return '${AppLocalizations.of(context)?.passwords_do_not_match}';
  }

  return null;
}


