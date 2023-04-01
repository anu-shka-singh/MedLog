import 'package:flutter/material.dart';

class ListValues {
  String imagepath;
  
  ListValues({
    required this.imagepath, // Add the 'required' keyword
  });
}

var listofvalue = [
  ListValues(
    imagepath: "images/letsgetstarted.png",
  ),
  ListValues(
    imagepath: "images/secondintro.png",
  ),
];