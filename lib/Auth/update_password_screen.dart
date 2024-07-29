

///
import 'dart:convert';

import 'package:com.classic.classicparts/Auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:password_strength/password_strength.dart';

import '../constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdatePasswordScreen extends StatefulWidget {
  final authtoken;
  UpdatePasswordScreen({required this.authtoken});

@override
  _UpdatePasswordScreenState createState() => _UpdatePasswordScreenState();

}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final _oldpasswordController = TextEditingController();
  final _newpasswordController = TextEditingController();
  final _confirmnewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var tr= AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: CustomColor.WhiteColor,

      appBar: AppBar(
        backgroundColor: CustomColor.WhiteColor, // Set the background color of the AppBar
        elevation: 0,
        automaticallyImplyLeading: false,// Set the elevation to 0 to remove the shadow
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
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
            ),
            Text(
              '${tr?.update_password}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: CustomColor.BlackColor),
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
                // SizedBox(height: 20),
                // Text(
                //   'Update password',
                //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                // ),
                Text(
                  '${tr?.new_password_tag}',
                  style: TextStyle(color: Color(0xffCBCBCB)),
                ),
                SizedBox(height: 20),
                _buildInputField('${tr?.enter_old_password}', _oldpasswordController, Icons.lock, validator: validateoldPassword),
                SizedBox(height: 20),
                _buildInputField('${tr?.enter_new_password}', _newpasswordController, Icons.lock, validator: validatePassword),
                SizedBox(height: 10),
                _buildInputField('${tr?.confirm_password}', _confirmnewPasswordController, Icons.lock, validator: (value) => validateConfirmPassword(value, _newpasswordController.text)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      if (_formKey.currentState!.validate()) {
                        final updateResult = await ApiService.updatePasswordApiCall(_oldpasswordController.text, _newpasswordController.text,_confirmnewPasswordController.text,widget.authtoken,context);

                        if (updateResult['success']) {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(updateResult['message'])),
                          );
                        }
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${AppLocalizations.of(context)?.an_error_occurred}')),
                      );
                    }
                  },
                  child: Text('${tr?.submit}', style: TextStyle(color: Colors.white)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(CustomColor.BlueColor),
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
    var tr= AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$labelText', style: TextStyle(fontWeight: FontWeight.bold,color: CustomColor.BlackColor),),
        TextFormField(
          controller: controller,
          cursorColor: CustomColor.TextFieldColor,
          obscureText: labelText == '${tr?.password}' || labelText == '${tr?.confirm_password}',
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
  }
  String? validateoldPassword(String? value) {
    if (value == null || value.isEmpty) {
      return '${AppLocalizations.of(context)?.please_enter_your_password}';
    }

    return null;
  }
  String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return '${AppLocalizations.of(context)?.please_confirm_your_password}';
    }

    if (value != password) {
      return '${AppLocalizations.of(context)?.passwords_do_not_match}';
    }

    return null;
  }
}



///

class ApiService {
  static const String baseUrl = 'https://your-api-url.com'; // Replace with your API base URL

  static Future<Map<String, dynamic>> updatePasswordApiCall(String oldPassword, String newPassword,String newpasswordconfirmation,String authtoken,context) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authtoken',
      // Adjust headers as needed
      // Add any other headers required for authentication or authorization
    };

    final Map<String, dynamic> body = {
      'old_password': oldPassword,
      'new_password': newPassword,
      'new_password_confirmation': newpasswordconfirmation,
    };

    final response = await post(
      Uri.parse('https://ecommerce.classicgroup.org/api/auth/update/password'), // Replace with your actual API endpoint
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      // Successful response
      final responseData = jsonDecode(response.body);
      return {'success': true, 'message': responseData['message']};
    } else {
      // Error response
      throw Exception('${AppLocalizations.of(context)?.failed_to_update_password}');
    }
  }
}
///update


