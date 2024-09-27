import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/constants/text.dart';
import 'package:sample_project/views/common_widgets/signin_signup_images.dart';
import 'package:sample_project/views/common_widgets/textfields.dart';
import '../../../providers/authProvider.dart';

class SignInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SigninSignupImage(),
                  RichText(
                    text: TextSpan(
                      text: "Welcome to  ",
                      style: GoogleFonts.poppins(
                          color: Colors.purple,
                          fontSize: 30), // Apply a default style
                      children: [
                        TextSpan(
                          text: "SignIn...",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black), // Add styling for visibility
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Fields(
                    controllers: _emailController,
                    labelText: usernameLabel,
                    hintText: usernameExample,
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
                    labelText: passwordLabel,
                    hintText: passwordLabelExample,
                    obscureText: true,
                    icon: Icon(
                      Icons.remove_red_eye_outlined,
                      size: 15,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      // Add more complex validation if needed
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final email = _emailController.text.toString();
                        final password = _passwordController.text.toString();
                        Provider.of<AuthProvider>(context, listen: false)
                            .signIn(email, password);
                      }
                    },
                    child: AutoSizeText(
                      maxLines: 1,
                      'Sign In',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding: EdgeInsets.symmetric(horizontal: 150)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/signup'),
                        child: AutoSizeText(
                          'Sign Up',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      AutoSizeText("forget password?",
                          style: GoogleFonts.poppins(
                              decoration: TextDecoration.underline))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
