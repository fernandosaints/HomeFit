import 'package:flutter/material.dart';
import 'package:home_fit/main.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
    {
      this.icon,
      this.hint,
      this.obsecure = false,
      this.validator,
      this.onSaved
    }
  );
  
  final FormFieldSetter<String> onSaved;
  final Icon icon;
  final String hint;
  final bool obsecure;
  final FormFieldValidator<String> validator;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onSaved: onSaved,
        validator: validator,
        obscureText: obsecure,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          prefixIcon: Padding(
            child: IconTheme(
              data: IconThemeData(color: Theme.of(context).primaryColor),
              child: icon,
            ),
            padding: EdgeInsets.only(left: 20, right: 10),
          ),
        ),
      ),
    );
  }
}