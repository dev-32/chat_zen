import 'package:flutter/material.dart';


class TextCont extends StatefulWidget {
  const TextCont({super.key, required this.hintText, required this.prefixIcon, required this.obsecureText, required this.formvalue,});
  final String hintText;
  final Widget prefixIcon;
  final bool obsecureText;
  final Function(String val) formvalue;
  @override
  State<TextCont> createState() => _TextContState();
}

class _TextContState extends State<TextCont> {
  late String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black54,width: 2),
            borderRadius: BorderRadius.circular(10)
        ),
        child: TextFormField(
          onChanged: (value){
            setState(() {
              widget.formvalue(value);
            });
          },
          decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              hintText: widget.hintText,
              border: InputBorder.none
          ),
          obscureText: widget.obsecureText,
        ),
      ),
    );
  }
}
