import 'dart:convert';

import 'package:com.classic.classicparts/Providers/api_provider.dart';
import 'package:com.classic.classicparts/Providers/authrememberprovider.dart';
import 'package:com.classic.classicparts/Providers/methods_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../../Auth/sign_up_Screen.dart';
import '../../constants.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfileScreen extends StatefulWidget {
  String userName;
  String phoneNumber;
  String address;
EditProfileScreen({required this.userName, required this.phoneNumber, required this.address});
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  //ImageProvider<Object>? backgroundImage;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  @override
  void initState() {
   _nameController.text=widget.userName??'';
   _phoneController.text=widget.phoneNumber??'';
   _addressController.text=widget.address??'';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tr= AppLocalizations.of(context);

    // final remembermeprovider = Provider.of<RememberMeProvider>(context, listen: false);
    // if (remembermeprovider.profileImage.startsWith('http')) {
    //   backgroundImage=NetworkImage('${remembermeprovider.profileImage}');
    // }else if(remembermeprovider.profileImage=='null')
    // {
    //   backgroundImage=AssetImage("asset/user.png");
    // }
    // else {
    //   backgroundImage=
    //       FileImage(File(remembermeprovider.profileImage));
    // }
    return Scaffold(
      backgroundColor: CustomColor.WhiteColor,
        appBar: AppBar(
          backgroundColor: CustomColor.WhiteColor,

          leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios,color: CustomColor.BlackColor,)),
          title: Text('${tr?.edit_profile}',style: TextStyle(color: CustomColor.BlackColor),),
          actions: [
            IconButton(
              onPressed: () {
                // Save the changes
                // You can add code here to send the data to the server
                print('Name: ${_nameController.text}');
                print('Phone: ${_phoneController.text}');
                print('address: ${_addressController.text}');
            if (_formKey.currentState!.validate()) {
           Provider.of<ApiProvider>(context, listen: false).updateUserInfo(
          _nameController.text, _phoneController.text, _addressController.text,
          context);
              }        
      },
              icon: Icon(Icons.check,color: CustomColor.BlackColor,),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Provider.of<ApiProvider>(context,listen: false).pickImage(context);
                    },
                    child:Consumer<ApiProvider>(builder: (BuildContext context, value, Widget? child) {
                      return  value.image != null ?CircleAvatar(
                        radius: 60,
                        backgroundImage:   FileImage(value.image!),
                      ):

                      CircleAvatar(
                        radius: 60,
                        backgroundImage:Provider.of<MethodsProvider>(context,listen: false).ImageType(),
                      );
                    },)
                  ),
                  SizedBox(height: 10),
                  // Text(
                  //   'Change Profile Photo',
                  //   style: TextStyle(
                  //     color: CustomColor,
                  //   ),
                  // ),
                  SizedBox(height: 20),
                  _buildInputField('${tr?.your_name}', _nameController, Icons.person,validator: validatename),
                  SizedBox(height: 10),
                  _buildInputField('${tr?.phone}', _phoneController, Icons.phone, validator: validatePhone),
                  SizedBox(height: 10),
                  _buildInputField('${tr?.address}', _addressController, Icons.location_on_sharp,validator:validateaddress),
                  SizedBox(height: 10),
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
        Text('$labelText', style: TextStyle(fontWeight: FontWeight.bold,color: CustomColor.BlackColor),),
        SizedBox(height: 8,),
        TextFormField(
          controller: controller,
          cursorColor: CustomColor.BlackColor,
          obscureText: labelText == 'Password' || labelText == 'Confirm Password',
          decoration: InputDecoration(
            //hintText: labelText,
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

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}
