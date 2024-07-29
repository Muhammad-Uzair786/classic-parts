import 'package:com.classic.classicparts/prac/Logout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container( 
          padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
          child: SingleChildScrollView(
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
                            style: TextStyle(fontSize: 18.0,color: Colors.white,fontWeight: FontWeight.bold,fontFamily:'Poppins' ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 40.0),

                // "Sign in to Account" Text
                Text(
                  "Sign in to Account",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                      fontFamily:'Poppins',
                    color: Color(0xff33286B),
                  ),
                 // textAlign: TextAlign.center,
                ),

                SizedBox(height: 10.0),

                // Email Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.grey,fontFamily:'Poppins'),
                    prefixIcon: Icon(Icons.email,color: Colors.black54),
                    border: UnderlineInputBorder(),
                  ),
                ),

                SizedBox(height: 10.0),

                // Password Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.grey,fontFamily:'Poppins'),
                    prefixIcon: Icon(Icons.lock,color: Colors.black54),
                    border: UnderlineInputBorder(),
                  ),
                  obscureText: true,
                ),

                SizedBox(height: 10.0),

                // "Remember Me" Checkbox and "Forgot Password" Text
                Row(
                  children: [
                    RoundedCheckbox(),
                    SizedBox(width: 10,),
                    Text("Remember Me",style: TextStyle( color: Color(0xff33286B),fontFamily:'Poppins'),),
                    Spacer(),
                    Text("Forgot Password?",style: TextStyle( color: Color(0xff33286B),fontFamily:'Poppins'),),
                  ],
                ),

                SizedBox(height: 20.0),

                // Login Button
                ElevatedButton(
                  onPressed: () {
                    // Add login functionality here
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage()));

                  },
                  child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily:'Poppins'),),
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
                        "Already Have Account? ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily:'Poppins'),
                      ),
                    ),
                    Text(
                      "SignUp",
                      textAlign: TextAlign.center,
                      style: TextStyle(  color: Color(0xff33286B),fontFamily:'Poppins')
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