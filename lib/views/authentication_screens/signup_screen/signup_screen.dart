import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/views/common_widgets/signin_signup_images.dart';
import 'package:sample_project/views/navigation_bar/navigationbar.dart';

import '../../../providers/authProvider.dart';
import '../../common_widgets/textfields.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    SigninSignupImage(),
                    RichText(
                      text: TextSpan(
                        text: "Welcome to  ",
                        style: GoogleFonts.poppins(
                            color: Colors.purple,
                            fontSize: MediaQuery.of(context).size.width *
                                .07), // Apply a default style
                        children: [
                          TextSpan(
                            text: "SignUp...",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    Colors.black), // Add styling for visibility
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Fields(
                      controllers: _emailController,
                      labelText: "email",
                      hintText: "enter email",
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        // Add more complex validation if needed
                        return null;
                      },
                    ),
                    Fields(
                      controllers: _passwordController,
                      labelText: "password",
                      hintText: "enter password",
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        // Add more complex validation if needed
                        return null;
                      },
                      icon: Icon(
                        Icons.remove_red_eye,
                        size: 15,
                      ),
                    ),
                    Fields(
                      controllers: _confirmPasswordController,
                      labelText: "re-enter password",
                      hintText: "re-enter password",
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      icon: Icon(
                        Icons.remove_red_eye,
                        size: 15,
                      ),
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width - 30,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final email = _emailController.text;
                            final password = _passwordController.text;
                            Provider.of<AuthProvider>(context, listen: false)
                                .signUp(email, password);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomePage()));
                          }
                        },
                        child: AutoSizeText(
                          'Sign Up',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/signin'),
                      child: Text('Sign In'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
