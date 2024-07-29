//
//
// ///
// import 'dart:convert';
//
// import 'package:com.classic.classicparts/Auth/login_screen.dart';
// import 'package:com.classic.classicparts/constants.dart';
// import 'package:com.classic.classicparts/separateAppfiles/ApiModels/signup_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:password_strength/password_strength.dart';
//
// import '../separateAppfiles/WelcomeScreens/registrationsuccess_screen.dart';
//
// class SignUpScreen extends StatefulWidget {
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }
// List<String> extractErrorMessages(Map<String, dynamic> responseData) {
//   final List<String> errorMessages = [];
//   responseData.forEach((key, value) {
//     if (value is List) {
//       errorMessages.addAll(value.map((item) => '$key: $item'));
//     }
//   });
//   return errorMessages;
// }
// class _SignUpScreenState extends State<SignUpScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   final _addressController = TextEditingController();
//   bool _agreedToTerms = false;
//   void _toggleAgreedToTerms(bool newValue) {
//     setState(() {
//       _agreedToTerms = newValue;
//     });
//   }
//
//   ///siginup
//   // Future<Object> SignUp(String name,String phone,String password,String confirmpassword,String address,String role)
//   // async {
//   //   final response= await post(Uri.parse('https://ecommerce.classicgroup.org/api/auth/register'),
//   //       headers: {
//   //         'Content-Type': 'application/json', // Adjust content type if needed
//   //       },
//   //       body: jsonEncode({
//   //         'name':'$name',
//   //         'phone':'$phone',
//   //         'password':'$password',
//   //         'password_confirmation':'$confirmpassword',
//   //         'role':'$role',
//   //         'address':'$address'
//   //       })
//   //   );
//   //
//   //   if(response.statusCode==200)
//   //   {
//   //     final responsedata=json.decode(response.body);
//   //     final signupmodel =SignUpModel.fromJson(responsedata);
//   //     print('Response body: ${responsedata}');
//   //     print('Response model: ${responsedata}');
//   //
//   //     return signupmodel;
//   //   }else
//   //   {
//   //     print(response.body);
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(
//   //         content: Text("${response.body}"),
//   //       ),
//   //     );
//   //     return 'null';
//   //   }
//   //
//   //
//   //
//   // }
//   Future SignUp(String name, String phone, String password, String confirmPassword, String address, String role) async {
//     try {
//       final response = await post(
//         Uri.parse('https://ecommerce.classicgroup.org/api/auth/register'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'name': name,
//           'phone': phone,
//           'password': password,
//           'password_confirmation': confirmPassword,
//           'role': role,
//           'address': address,
//         }),
//       );
//
//       if (response.statusCode == 200) {
//         // Handle successful registration here
//       } else if (response.statusCode == 400) {
//         final responseData = json.decode(response.body);
//         final errorMessages = extractErrorMessages(responseData);
//
//         // Display error messages using a SnackBar
//         final errorMessage = errorMessages.isNotEmpty
//             ? errorMessages.join('\n')
//             : 'Registration failed.';
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(errorMessage),
//           ),
//         );
//         return 'null';
//       }
//     }
//
//     catch(e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Check your Internet Connectivity'),
//         ),
//       );
//       return 'null';
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFFFFFFF),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 SizedBox(height: 20),
//                 Container(
//                   height: 70,
//                   width: 70,
//                   child: Image.asset('asset/applogo.png'),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   'Classic Programmers',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'Sign Up',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   'Create a new account',
//                   style: TextStyle(color: Color(0xffCBCBCB)),
//                 ),
//                 SizedBox(height: 20),
//                 TabButtons(),
//                 SizedBox(height: 20),
//                 _buildInputField('Your Name', _nameController, Icons.person),
//                 SizedBox(height: 10),
//                 _buildInputField('Phone', _phoneController, Icons.phone, validator: validatePhone),
//                 SizedBox(height: 10),
//                 _buildInputField('Password', _passwordController, Icons.lock, validator: validatePassword),
//                 SizedBox(height: 10),
//                 _buildInputField('Confirm Password', _confirmPasswordController, Icons.lock, validator: (value) => validateConfirmPassword(value, _passwordController.text)),
//                 SizedBox(height: 10),
//                 _buildInputField('Address', _addressController, Icons.location_on_sharp),
//                 SizedBox(height: 10),
//                 Row(
//                   children: [
//                     RoundedCheckbox( agreedToTerms: _agreedToTerms,
//                       onChanged: _toggleAgreedToTerms,
//                     ),
//                     SizedBox(width: 10,),
//                     SizedBox(
//                       width: 280,
//                       child: Text(
//                         'By creating an account you have to agree with our terms & condition',
//                         style: TextStyle(color: Color(0xffCBCBCB)),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 GestureDetector(
//                   onTap: () async {
//                     if (_formKey.currentState!.validate() && _agreedToTerms) {
//
//                      final registrationresponse= await SignUp('${_nameController.text}','${_phoneController.text}','${_passwordController.text}','${_confirmPasswordController.text}','${_addressController.text}','2');
//                       // Perform sign-up logic here
//                      if(registrationresponse!= 'null')
//                        {
//                          print("notnull$registrationresponse");
//                         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OnRegisterationSuccess()));
//
//                        }else
//                          {
//                            print("null");
//                          }
//
//                     }else
//                       {
//                         print("fail");
//                       //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnRegisterationSuccess()));
//
//                       }
//                   },
//                   child: Container(
//                     padding: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         gradient: CustomColor.GradientColor
//
//                       ),
//                       child: Text('Sign Up', style: CustomColor.StyleWhitebold,textAlign: TextAlign.center,)),
//                 ),
//                 SizedBox(height: 20.0),
//
//                 // "Already Have Account? SignUp" Text
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         // Add navigation to the sign-up page here
//                       },
//                       child: Text(
//                         "Already Have Account? ",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontFamily: 'Poppins', color: Color(0xffCBCBCB)),
//                       ),
//                     ),
//                     GestureDetector(
//                      onTap:(){
//                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
//                      },
//
//                       child: Text(
//                         "Login",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildInputField(String labelText, TextEditingController controller, IconData iconData, {String? Function(String?)? validator}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('$labelText', style: TextStyle(fontWeight: FontWeight.bold),),
//         TextFormField(
//           controller: controller,
//           cursorColor: Colors.black,
//           obscureText: labelText == 'Password' || labelText == 'Confirm Password',
//           decoration: InputDecoration(
//             hintText: labelText,
//             hintStyle: TextStyle(color: Color(0xffCBCBCB)),
//             contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//             prefixIcon: Icon(iconData,color: CustomColor.BlueColor,),
//             //suffixIcon: labelText == 'Password' ? _buildPasswordStrengthIndicator() : null,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(20.0),
//               borderSide: BorderSide.none,
//             ),
//             filled: true,
//             fillColor: Color(0xffF8F8F8),
//           ),
//           validator: validator,
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPasswordStrengthIndicator() {
//     double strength = estimatePasswordStrength(_passwordController.text);
//     Color color;
//     if (strength < 0.3) {
//       color = Colors.red;
//     } else if (strength < 0.7) {
//       color = Colors.orange;
//     } else {
//       color = Colors.green;
//     }
//
//     return Padding(
//       padding: const EdgeInsets.only(right: 8.0),
//       child: Icon(
//         Icons.lock,
//         color: color,
//       ),
//     );
//   }
//
//   String? validatePhone(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your phone number';
//     }
//
//     // Custom phone number validation for Pakistan
//     String pattern = r'^(?:\+?92)?(0?3[0-9]{2})[0-9]{7}$';
//     RegExp regExp = RegExp(pattern);
//     if (!regExp.hasMatch(value)) {
//       return 'Please enter a valid phone number (e.g., 03XXXXXXXXX)';
//     }
//
//     return null;
//   }
//
//   String? validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your password';
//     }
//
//     // Custom password validation for at least 8 characters and strong password
//     if (value.length < 8) {
//       return 'Password must be at least 8 characters';
//     }
//
//     double strength = estimatePasswordStrength(value);
//     if (strength < 0.3) {
//       return 'Password is weak';
//     }
//
//     return null;
//   }}
// String? validateConfirmPassword(String? value, String password) {
//   if (value == null || value.isEmpty) {
//     return 'Please confirm your password';
//   }
//
//   if (value != password) {
//     return 'Passwords do not match';
//   }
//
//   return null;
// }
//
// class TabButtons extends StatefulWidget {
//   @override
//   _TabButtonsState createState() => _TabButtonsState();
// }
//
// class _TabButtonsState extends State<TabButtons> {
//   String selectedTab = 'Wholesaler';
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _buildButton('Wholesaler'),
//           _buildButton('Retailer'),
//           _buildButton('Mechanic'),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildButton(String label) {
//     bool isSelected = selectedTab == label;
//     int index=1;
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 4.0),
//       child: GestureDetector(
//         onTap: () {
//           setState(() {
//             selectedTab = label;
//             if(label=='Wholesaler')
//             {
//               index=1;
//             }else if(label=='Retailer')
//               {
//                 index=2;
//               }
//             else if(label=='Mechanic')
//               {
//                 index=3;
//               }
//           });
//           printSelectedTab();
//         },
//         child:Container(
//           height: 40,
//           width: 100,
//
//           decoration:isSelected?
//           BoxDecoration(
//             gradient:CustomColor.GradientColor,
//             borderRadius: BorderRadius.circular(20)
//           ):BoxDecoration(
//              color: Colors.grey[300],
//               borderRadius: BorderRadius.circular(20)
//
//           ),
//           child: Center(child: Text(label, style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)),
//
//
//         )
//
//         // style: ButtonStyle(
//         //   minimumSize: MaterialStateProperty.all(Size(100, 40)),
//         //   backgroundColor: MaterialStateProperty.all(isSelected ? Colors.black : Colors.grey[300]),
//         // ),
//       ),
//     );
//   }
//
//   void printSelectedTab() {
//     print("Selected tab: $selectedTab");
//   }
// }
//
// class RoundedCheckbox extends StatefulWidget {
//   bool agreedToTerms;
//   final ValueChanged<bool> onChanged;
//   RoundedCheckbox({required this.agreedToTerms, required this.onChanged});
//   @override
//   _RoundedCheckboxState createState() => _RoundedCheckboxState();
// }
//
// class _RoundedCheckboxState extends State<RoundedCheckbox> {
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//          // widget.agreedToTerms = !widget.agreedToTerms;
//           //print("$widget.agreedToTerms");
//           widget.onChanged(!widget.agreedToTerms);
//           print("${widget.agreedToTerms}");
//         });
//       },
//       child: Container(
//         margin: EdgeInsets.only(bottom: 12),
//         height: 20,
//         width: 20,
//         decoration:  BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           border: Border.all(color: Color(0xffF8F8F8)),
//           gradient:widget.agreedToTerms ? CustomColor.GradientColor:null,
//           color: widget.agreedToTerms ?null:CustomColor.TextFieldColor
//         ),
//         child: widget.agreedToTerms
//             ? Center(
//           child: Icon(
//             Icons.check,
//             size: 20,
//             color: Colors.white,
//           ),
//         )
//             : null,
//       ),
//     );
//   }
// }
//
//
//



///
import 'dart:convert';

import 'package:com.classic.classicparts/Providers/methods_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:password_strength/password_strength.dart';
import 'package:provider/provider.dart';

import '../Providers/api_provider.dart';
import '../Providers/authrememberprovider.dart';
import '../constants.dart';
import '../prac/Logout.dart';
import '../separateAppfiles/WelcomeScreens/registrationsuccess_screen.dart';
import 'login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

List<String> extractErrorMessages(Map<String, dynamic> responseData) {
  final List<String> errorMessages = [];
  responseData.forEach((key, value) {
    if (value is List) {
      errorMessages.addAll(value.map((item) => '$key: $item'));
    }
  });
  return errorMessages;
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _addressController = TextEditingController();
  bool _agreedToTerms = false;
  int selectedRoleIndex = 2; // Default to Wholesaler role index
// Convert role label to role index
  int labelToRoleIndex(String label) {
    switch (label) {
      case 'Wholesaler':
        return 4;
      case 'Retailer':
        return 3;
      case 'Mechanic':
        return 2;
      default:
        return 2; // Default to Wholesaler
    }
  }

  // Convert role index to label
  String selectedRoleIndexToLabel(int index) {
    switch (index) {
      case 4:
        return 'Wholesaler';
      case 3:
        return 'Retailer';
      case 2:
        return 'Mechanic';
      default:
        return 'Mechanic';
    }
  }
  void _toggleAgreedToTerms(bool newValue) {
    setState(() {
      _agreedToTerms = newValue;
    });
  }

  Future signUp(
      String name,
      String phone,
      String password,
      String confirmPassword,
      String address,
      String role,
      String deviceToken,
      ) async {
    try {
      final response = await post(
        Uri.parse('https://ecommerce.classicgroup.org/api/auth/register'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'image':Provider.of<ApiProvider>(context,listen: false).base64String.toString(),
          'phone': phone,
          'password': password,
          'password_confirmation': confirmPassword,
          'role': role,
          'address': address,
          'device_token':deviceToken
        }),
      );

      if (response.statusCode == 200) {
         print("signup...${response.body}");
        return jsonDecode(response.body);

      } else if (response.statusCode == 400) {
        final responseData = json.decode(response.body);
        final errorMessages = extractErrorMessages(responseData);

        final errorMessage = errorMessages.isNotEmpty
            ? errorMessages.join('\n')
            : 'Registration failed.';

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
          ),
        );
        return 'null';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Check your Internet Connectivity'),
        ),
      );
      return 'null';
    }
  }

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
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ... (rest of the code)
                SizedBox(height: 30),
                Stack(
                  children: [
                    SizedBox(
                      child: Consumer<ApiProvider>(builder: (BuildContext context, value, Widget? child) {
                        return  value.image != null ?CircleAvatar(
                          radius: 60,
                          backgroundImage:   FileImage(value.image!),
                        ):

                        CircleAvatar(
                          radius: 60,
                          backgroundImage:AssetImage("asset/user.png"),
                        );
                      },),
                    ),
                    Positioned(
                      right: 5,
                      bottom: 10,
                      child: GestureDetector(
                          onTap: () {
                            Provider.of<ApiProvider>(context,listen: false).pickSignupImage(context);
                          },
                          child: Icon(Icons.add_circle_outline,color: CustomColor.BlackColor,)),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,

                  child: Text(
                    'Create a new account',
                    style: TextStyle(color: Color(0xffCBCBCB)),
                  ),
                ),
                SizedBox(height: 20),
                TabButtons(
                  selectedRole: selectedRoleIndexToLabel(selectedRoleIndex),
                  onChanged: (label) {
                    setState(() {
                      selectedRoleIndex = labelToRoleIndex(label);
                    });
                  },
                ),

                // ... (rest of the code)
                SizedBox(height: 20),
                _buildInputField('Your Name', _nameController, Icons.person,validator: validatename),
                SizedBox(height: 10),
                _buildInputField('Phone', _phoneController, Icons.phone, validator: validatePhone),
                SizedBox(height: 10),
                _buildInputField('Password', _passwordController, Icons.lock, validator: validatePassword),
                SizedBox(height: 10),
                _buildInputField('Confirm Password', _confirmPasswordController, Icons.lock, validator: (value) => validateConfirmPassword(value, _passwordController.text)),
                SizedBox(height: 10),
                _buildInputField('Address', _addressController, Icons.location_on_sharp,validator: validateaddress),
                SizedBox(height: 10),
                Row(
                  children: [
                    RoundedCheckbox( agreedToTerms: _agreedToTerms,
                      onChanged: _toggleAgreedToTerms,
                    ),
                    SizedBox(width: 10,),
                    SizedBox(
                      width: 280,
                      child: Text(
                        'By creating an account you have to agree with our terms & condition',
                        style: TextStyle(color: Color(0xffCBCBCB)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    print(selectedRoleIndex);
                 final deviceToken=await Provider.of<MethodsProvider>(context,listen: false).getDeviceToken();

                    print("waiting");
                    print("FCM Tokenbefore: $deviceToken");

                    if (_formKey.currentState!.validate() && _agreedToTerms && deviceToken!='null') {
                      showLoadingIndicator(context);

                      print("if FCM Token: $deviceToken");

                      final response= await signUp(
                        _nameController.text,
                        _phoneController.text,
                        _passwordController.text,
                        _confirmPasswordController.text,
                        _addressController.text,
                        selectedRoleIndex.toString(),// Pass the selected role to the API call
                       deviceToken.toString()
                      );
                     if(response!='null')
                       {
                         Navigator.of(context).pop();
                       print("ignupimage....${response['user']['image_path']}");
                         Provider.of<RememberMeProvider>(context,listen: false).saveUserData(response['user']['name'].toString(),response['user']['role'].toString(),response['user']['address'].toString()??'',_phoneController.text, _passwordController.text,response['token'],response['user']['id'].toString(),response['user']['image_path'].toString(),//response['user']['image_path'].toString(),
                             response['user']['device_token'].toString(),response['user']['user_credit'].toString(),response['user']['user_points'].toString());
                        ///todomaybe
                         // Navigator.of(context).pushReplacement(
                         //   MaterialPageRoute(builder: (context) => OnRegisterationSuccess()),
                         // );
                         showDialog(
                           context: context,
                           builder: (context) {
                             return AlertDialog(
                               title: Text('Pending User'),
                               content: Text('You have succesfully Created Account and can login to your acccount once its approved by the admin'),
                               actions: [
                                 // TextButton(
                                 //   onPressed: () {
                                 //     Navigator.of(context).pop(false); // Do not exit
                                 //   },
                                 //   child: Text('Cancel'),
                                 // ),
                                 TextButton(
                                   onPressed: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                      return LoginScreen();
                                    }));
                                   },
                                   child: Text('Ok'),
                                 ),
                               ],
                             );
                           },
                         );
                       }
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: CustomColor.GradientColor),
                    child: Text(
                      '${AppLocalizations.of(context).sign_up}',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),

                // "Already Have Account? SignUp" Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        // Add navigation to the sign-up page here
                      },
                      child: Text(
                        "Already Have Account? ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'Poppins', color: Color(0xffCBCBCB)),
                      ),
                    ),
                    GestureDetector(
                     onTap:(){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                     },

                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
                      ),
                    ),
                  ],
                ),

                // ... (rest of the code)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
Widget _buildInputField(String labelText, TextEditingController controller, IconData iconData, {String? Function(String?)? validator}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('$labelText', style: TextStyle(fontWeight: FontWeight.bold),),
      TextFormField(
        controller: controller,
        cursorColor: Colors.black,
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
class TabButtons extends StatefulWidget {
  final String selectedRole;
  final ValueChanged<String> onChanged;

  TabButtons({required this.selectedRole, required this.onChanged});

  @override
  _TabButtonsState createState() => _TabButtonsState();
}
// Widget _buildPasswordStrengthIndicator() {
//   double strength = estimatePasswordStrength(_passwordController.text);
//   Color color;
//   if (strength < 0.3) {
//     color = Colors.red;
//   } else if (strength < 0.7) {
//     color = Colors.orange;
//   } else {
//     color = Colors.green;
//   }
//
//   return Padding(
//     padding: const EdgeInsets.only(right: 8.0),
//     child: Icon(
//       Icons.lock,
//       color: color,
//     ),
//   );
// }

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
String? validatename(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your name';
  }

  return null;
}
String? validateaddress(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your address';
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
}
String? validateConfirmPassword(String? value, String password) {
  if (value == null || value.isEmpty) {
    return 'Please confirm your password';
  }

  if (value != password) {
    return 'Passwords do not match';
  }

  return null;
}
class _TabButtonsState extends State<TabButtons> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          _buildButton('Mechanic', 'Mechanic'),
          _buildButton('Retailer', 'Retailer'),
          _buildButton('Wholesaler', 'Wholesaler'),
        ],
      ),
    );
  }

  Widget _buildButton(String label, String role) {
    bool isSelected = widget.selectedRole == role;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GestureDetector(
        onTap: () {
          widget.onChanged(role);
        },
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: isSelected
                ? CustomColor.GradientColor
                : null,
            color: isSelected ? null : Colors.grey[300],
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
class RoundedCheckbox extends StatefulWidget {
  bool agreedToTerms;
  final ValueChanged<bool> onChanged;
  RoundedCheckbox({required this.agreedToTerms, required this.onChanged});
  @override
  _RoundedCheckboxState createState() => _RoundedCheckboxState();
}

class _RoundedCheckboxState extends State<RoundedCheckbox> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // widget.agreedToTerms = !widget.agreedToTerms;
          //print("$widget.agreedToTerms");
          widget.onChanged(!widget.agreedToTerms);
          print("${widget.agreedToTerms}");
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        height: 20,
        width: 20,
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color:widget.agreedToTerms?CustomColor.WhiteColor: CustomColor.BlueColor),
            gradient:widget.agreedToTerms ? CustomColor.GradientColor:null,
            color: widget.agreedToTerms ?null:CustomColor.TextFieldColor
        ),
        child: widget.agreedToTerms
            ? Center(
          child: Icon(
            Icons.check,
            size: 20,
            color: Colors.white,
          ),
        )
            : null,
      ),
    );
  }
}