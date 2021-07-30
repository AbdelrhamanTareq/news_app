import 'package:flutter/material.dart';
import '../screens/news_detailes.dart';

Padding buildText(
    BuildContext context, String text, double ver, double font, Color color) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: ver,
      horizontal: 15,
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: font,
        color: color,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

navToPage(context, id) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => NewsDetailes(id),
      ),
    );

TextFormField buildTextField({
  @required TextEditingController controller,
  @required TextInputType keyboardType,
  @required String hintText,
  @required Icon prefixIcon,
  @required Function valdiator,
  Widget suffix,
  bool obscureText,
}) {
  return TextFormField(
    validator: valdiator,
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText ?? false,
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: suffix,
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1.0,
        ),
      ),
    ),
  );
}
