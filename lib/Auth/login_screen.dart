
import 'dart:convert';

import 'package:com.classic.classicparts/Auth/forgot_password_screen.dart';
import 'package:com.classic.classicparts/Auth/sign_up_Screen.dart';
import 'package:com.classic.classicparts/Providers/authrememberprovider.dart';
import 'package:com.classic.classicparts/separateAppfiles/MainBottomNavigationPage.dart';
import 'package:com.classic.classicparts/separateAppfiles/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:password_strength/password_strength.dart';
import 'package:provider/provider.dart';

import '../Providers/methods_provider.dart';
import '../constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  // Future SignIn(String phone, String password,) async {
  //   try {
  //     final response = await post(
  //       Uri.parse('https://ecommerce.classicgroup.org/api/auth/login'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode({
  //         'phone': phone,
  //         'password': password,
  //       }),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       // Handle successful registration here
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Succesfully Logged In'),
  //         ),
  //       );
  //       return response;
  //
  //
  //
  //     } else if (response.statusCode == 400) {
  //       final responseData = json.decode(response.body);
  //       final errorMessages = extractErrorMessages(responseData);
  //
  //       // Display error messages using a SnackBar
  //       final errorMessage = errorMessages.isNotEmpty
  //           ? errorMessages.join('\n')
  //           : 'Login failed.';
  //
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(errorMessage),
  //         ),
  //       );
  //       return 'null';
  //     }
  //   }
  //
  //   catch(e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Check your Internet Connectivity'),
  //       ),
  //     );
  //     return 'null';
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset('asset/applogo.png'),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Classic Parts',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Login to your account',
                  style: TextStyle(color: Color(0xffCBCBCB)),
                ),
                const SizedBox(height: 20),
                _buildInputField('Phone', _phoneController, Icons.phone, validator: validatePhone),
                const SizedBox(height: 10),
                _buildInputField('Password', _passwordController, Icons.lock, validator: validatePassword),
                const SizedBox(height: 5),
///todomust
                GestureDetector
                  (
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                    },
                    child: const Text("Forget Password?",textAlign: TextAlign.end,)),

                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    try {
                      showLoadingIndicator(context);

                      String? deviceToken = await Provider.of<MethodsProvider>(
                          context, listen: false).getDeviceToken();

                      if (_formKey.currentState!.validate() &&
                          deviceToken != 'null') {
                        // Show loading indicator
                        // Perform sign-up logic here
                        final loginresponse = await Provider.of<
                            RememberMeProvider>(context, listen: false).SignIn(
                            '${_phoneController.text}', '${_passwordController
                            .text}', deviceToken.toString(), context);
                        // Perform sign-up logic here
                        print("first$loginresponse");
                        // Hide loading indicator
                        if (loginresponse != null) {
                          Navigator.of(context).pop();

                          print("notnull$loginresponse");
                          print("loginresponse$loginresponse");
                          print("loginresponsetoken${loginresponse['token']}");
                          print("ignupimage....${loginresponse['user']['image_path']}");

                          ///save user data
                          Provider.of<RememberMeProvider>(
                              context, listen: false).saveUserData(
                              loginresponse['user']['name'].toString(),
                              loginresponse['user']['role'].toString(),
                              loginresponse['user']['address'].toString(),
                              _phoneController.text,
                              _passwordController.text,
                              loginresponse['token'],
                              loginresponse['user']['id'].toString(),
                              loginresponse['user']['image_path'].toString(),
                             // loginresponse['user']['image'].toString(),
                              loginresponse['user']['device_token'].toString(),
                              loginresponse['user']['user_credit'].toString(),
                              loginresponse['user']['user_points'].toString());
                          // String name= loginresponse['user']['name'];
                          // String authtoken=loginresponse['token'];
                          //print(name+authtoken);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) =>
                                  MainBottomNavigationPage()));
                        } else {
                          print("failedddddddddddddddddd");
                          throw Exception();
                        }
                      } else {
                        throw Exception();

                      }
                    }catch(e)
                    {
                      Navigator.of(context).pop(); // Hide loading indicator on exception
                  ///prev
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //               SnackBar(
                  //                 content: Text("You can't login to this account"),
                  //               ),
                  //             );
                    }
                  },
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: CustomColor.GradientColor

                      ),
                      child: Text('Sign In', style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)),
                ),
                SizedBox(height: 20.0),

                // "Already Have Account? SignUp" Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        // Add navigation to the sign-up page here
                      },
                      child: const Text(
                        "Not Have account? ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'Poppins', color: Color(0xffCBCBCB)),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen()));

                      },
                      child: const Text(
                        "SignUp",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
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
        Text(labelText, style: TextStyle(fontWeight: FontWeight.bold),),
        TextFormField(
          controller: controller,
          cursorColor: Colors.black,
          keyboardType:  labelText == 'Password'?TextInputType.visiblePassword:TextInputType.phone,

          obscureText: labelText == 'Password' || labelText == 'Confirm Password',
          decoration: InputDecoration(
            hintText: labelText,
            hintStyle: TextStyle(color: Color(0xffCBCBCB)),
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            prefixIcon: Icon(iconData,color: CustomColor.BlueColor,),
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
      return 'Please enter your phone number';
    }

    // Custom phone number validation for Pakistan
    String pattern = r'^(?:\+?92)?(0?3[0-9]{2})[0-9]{7}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid phone number (e.g., 03XXXXXXXXX)';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    // Custom password validation for at least 8 characters and strong password
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    double strength = estimatePasswordStrength(value);
    // if (strength < 0.3) {
    //   return 'Password is weak';
    // }

    return null;
  }}
String? validateConfirmPassword(String? value, String password) {
  if (value == null || value.isEmpty) {
    return 'Please confirm your password';
  }

  if (value != password) {
    return 'Passwords do not match';
  }

  return null;
}


void showLoadingIndicator(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const SizedBox(
      height: 100,
      width: 100,
      child:Center(child: CircularProgressIndicator()),

    ),
  );
}
