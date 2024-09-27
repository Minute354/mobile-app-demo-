import 'package:flutter/material.dart';
import '../../constants/imageurl.dart';

class SigninSignupImage extends StatelessWidget {
  const SigninSignupImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        width: 130,
        child: Image.asset(signinPageImageUrl));
  }
}