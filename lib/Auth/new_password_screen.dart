

///
import 'package:com.classic.classicparts/Auth/login_screen.dart';
import 'package:com.classic.classicparts/Providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:password_strength/password_strength.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class NewPasswordScreen extends StatefulWidget {
  final phone;
  NewPasswordScreen({required this.phone});
  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),

      appBar: AppBar(
        backgroundColor: Colors.white, // Set the background color of the AppBar
        elevation: 0,
        automaticallyImplyLeading: false,// Set the elevation to 0 to remove the shadow
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 8,top: 8,bottom: 8,right: 6),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient:CustomColor.GradientColor,
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
            Text(
              'New Password',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(),
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
                SizedBox(height: 20),
                Text(
                  'Reset password',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Your new password must be different from previous used passwords',
                  style: TextStyle(color: Color(0xffCBCBCB)),
                ),
                SizedBox(height: 20),
                _buildInputField('Enter New Password', _passwordController, Icons.lock, validator: validatePassword),
                SizedBox(height: 10),
                _buildInputField('Confirm Password', _confirmPasswordController, Icons.lock, validator: (value) => validateConfirmPassword(value, _passwordController.text)),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                     bool isSuccess=await Provider.of<ApiProvider>(context,listen: false).createNewPassword(widget.phone,_passwordController.text.toString(),_confirmPasswordController.text.toString());
                      // Perform sign-up logic here
                     isSuccess?
                     {
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password Reset Successfully"))),

                     Navigator.of(context).push(MaterialPageRoute(builder: (
                           context) => LoginScreen()
                       ))
                     }
                          :
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password did not reset")));


                      print('Sign up successful');
                    }else
                    {
                      print("fail");
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: CustomColor.GradientColor

                    ),
                    child: Text('Submit',textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                  ),
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
          obscureText: labelText == 'Password' || labelText == 'Confirm Password',
          decoration: InputDecoration(
            hintText: labelText,
            hintStyle: TextStyle(color: Color(0xffCBCBCB)),
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            prefixIcon: Icon(iconData),
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

  Widget _buildPasswordStrengthIndicator() {
    double strength = estimatePasswordStrength(_passwordController.text);
    Color color;
    if (strength < 0.3) {
      color = Colors.red;
    } else if (strength < 0.7) {
      color = Colors.orange;
    } else {
      color = Colors.green;
    }

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Icon(
        Icons.lock,
        color: color,
      ),
    );
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
    if (strength < 0.3) {
      return 'Password is weak';
    }

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