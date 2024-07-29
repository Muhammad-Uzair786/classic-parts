import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top Image with Rounded Corners
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),

                    child: Container(
                      color: Color(0xff33286B),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'asset/Asset 3.png', // Replace with your image path
                            height: 70.0,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 20,),
                          Text(
                            'IG MINNERS',
                            style: TextStyle(fontSize: 18.0,color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 40.0),

                // "Sign in to Account" Text
                Text(
                  "Create New Account",
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    color: Color(0xff33286B),
                  ),
                  // textAlign: TextAlign.center,
                ),

                SizedBox(height: 10.0),

                // Email Field


                SizedBox(height: 10.0),
                Extractedfield(text: "First Name",icon: Icons.person,),
                Extractedfield(text: "Last Name",icon: Icons.person,),
                Extractedfield(text: "Phone Number",icon: Icons.phone,),
                Extractedfield(text: "Email",icon: Icons.email,),


                // Password Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.grey,fontFamily:'Poppins'),
                    prefixIcon: Icon(Icons.lock,color: Colors.black54,),
                    border: UnderlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                Extractedfield(text: "Confirm Password",icon: Icons.lock,),

                SizedBox(height: 10.0),

                // "Remember Me" Checkbox and "Forgot Password" Text


                Row(
                  children: [
                    RoundedCheckbox(),
                    // GestureDetector(
                    //   onTap: (){
                    //
                    //     setState(() {
                    //       _value = !_value;
                    //     });
                    //   },
                    //   child: Container(
                    //     decoration:  BoxDecoration(
                    //       border:Border.all(),
                    //       shape: BoxShape.circle,
                    //     ),
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //
                    //     ),
                    //   ),
                    // ),
                    SizedBox(width: 10,),
                    //Checkbox(value: false, onChanged: (value) {},),
                    Text("I agree terms & conditions",style: TextStyle(color: Color(0xff33286B),fontFamily:'Poppins'),),
                  ],
                ),

                SizedBox(height: 20.0),

                // Login Button
                ElevatedButton(
                  onPressed: () {
                    // Add login functionality here
                  },
                  child: Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily:'Poppins'),),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: Color(0xffFF5400)
                  ),
                ),

                SizedBox(height: 20.0),

                // "or Login with" Text
                Text(
                  "or Login with",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily:'Poppins'),
                ),

                SizedBox(height: 10.0),

                // Social Media Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.facebook),
                    SizedBox(width: 20.0),
                    Image.asset(
                      'asset/insta.png', // Replace with your image path
                      height: 30.0,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 20.0),
                    Image.asset(
                      'asset/linkdin.png', // Replace with your image path
                      height: 30.0,
                      fit: BoxFit.cover,
                    ),
                  ],
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
                      child: Text(
                        "Already have an account?",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily:'Poppins'),
                      ),
                    ),
                    Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(  color: Color(0xff33286B),fontFamily:'Poppins'),


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
}

class Extractedfield extends StatelessWidget {
  final icon;
  final text;
  const Extractedfield({
    super.key, this.text, this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "$text",
        labelStyle: TextStyle(color: Colors.grey,fontFamily:'Poppins'),
        prefixIcon: Icon(icon,color: Colors.black54,),
        border: UnderlineInputBorder(),
      ),
    );
  }
}


///
class RoundedCheckbox extends StatefulWidget {
  @override
  _RoundedCheckboxState createState() => _RoundedCheckboxState();
}

class _RoundedCheckboxState extends State<RoundedCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
          print("$_isChecked");
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
           border: Border.all(color: Colors.black,),
            color: _isChecked ? Color(0xff33286B) : Colors.white,
          ),
          child: _isChecked
              ? Center(
                child: Icon(
            Icons.check,
            size: 20,
            color: Colors.white,
          ),
              )
              : null
        ),
      ),
    );
  }
}