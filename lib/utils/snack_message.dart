import 'package:flutter/material.dart';

void success(BuildContext context,String message){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message,),backgroundColor: Colors.green,)
  );
}

void error(BuildContext context,String message){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message,),backgroundColor: Colors.red,)
  );
}