import 'package:com.classic.classicparts/Providers/api_provider.dart';
import 'package:com.classic.classicparts/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  Future<bool>? _contactUsFuture;
  Future<void> submitContactForm() async {
    // Add your logic here to submit the form to your backend
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String phone = _phoneController.text;
      String email = _emailController.text;
      String message = _messageController.text;

      // Print the values for demonstration purposes
      print('Name: $name');
      print('Phone: $phone');
      print('Email: $email');
      print('Message: $message');


      setState(() {
        _contactUsFuture= Provider.of<ApiProvider>(context,listen: false).ContactUsApi(name: name, email: email, phone: phone, message: message,context: context);

      });

    }

  }

  @override
  Widget build(BuildContext context) {
    var tr= AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: CustomColor.WhiteColor,

      appBar: AppBar(
        backgroundColor: CustomColor.WhiteColor,
        automaticallyImplyLeading: false,
        // Set the background color of the AppBar
        elevation: 0,
        // Set the elevation to 0 to remove the shadow
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
                    gradient:CustomColor.GradientColor
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
              '${tr.contact_us}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: CustomColor.BlackColor),
            ),
            SizedBox()
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${tr.contact_information}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.BlackColor
                  ),
                ),
                SizedBox(height: 10),
                Text("${tr.name}",style: TextStyle(color:CustomColor.BlackColor,)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: CustomColor.GradientColor,

                  ),
                  child: TextFormField(
                    controller: _nameController,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '${tr.this_field_is_required}';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,

                    ),
                  ),
                ),
                Text("${tr.email}",style: TextStyle(color: CustomColor.BlackColor),),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: CustomColor.GradientColor,

                  ),
                  child: TextFormField(
                    cursorColor: Colors.white,
                    style:TextStyle(color: Colors.white),

                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '${tr.this_field_is_required}';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,

                    ),
                  ),
                ),
                Text("${tr.phone}",style: TextStyle(color: CustomColor.BlackColor)),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: CustomColor.GradientColor,

                  ),
                  child: TextFormField(
                    controller: _phoneController,
                    style: TextStyle(color: Colors.white),

                    cursorColor: Colors.white,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '${tr.this_field_is_required}';
                      }
                      return null;
                    },

                    decoration: InputDecoration(
                      //labelText: 'Email',
                      border: InputBorder.none,

                    ),


                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '${tr.message}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.BlackColor
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: CustomColor.GradientColor,
                  ),
                  child: TextFormField(
                    controller: _messageController,
                    style: TextStyle(color: Colors.white),

                    maxLines: 4,
                    enableSuggestions: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '${tr.this_field_is_required}';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: '${tr.enter_your_message_here}',
                      hintStyle:TextStyle(color: Colors.white),
                      border: InputBorder.none,

                    ),
                    cursorColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: (){
                     submitContactForm();

                  },
                  child: Container(
                    padding: EdgeInsets.all(12),

                decoration: BoxDecoration(
                  gradient: CustomColor.GradientColor,
                  borderRadius: BorderRadius.circular(20)
                ),

                    width: MediaQuery.of(context).size.width,
                    child: Text('${tr.submit}',textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                  ),
                ),

                if (_contactUsFuture != null)
                  FutureBuilder<bool>(
                    future: _contactUsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset("asset/applogo.png")));
                      }
                      _nameController.clear();
                      _emailController.clear();
                      _phoneController.clear();
                      _messageController.clear();
                      return Container();
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
