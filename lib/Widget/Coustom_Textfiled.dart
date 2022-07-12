import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? textInputType;
  final int? maxline;
  final int? minline;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextInputAction? textInputAction;
  final bool isPhoneNumber;
  final bool isValidator;
  final String? validatorMessage;
  final Color? fillColor;
  final TextCapitalization capitalization;
  final FormFieldValidator? validator;
  final String? errortext;

  CustomTextField({this.controller,
    this.hintText,
    this.textInputType,
    this.maxline,
    this.minline,
    this.focusNode,
    this.nextNode,
    this.textInputAction,
    this.isPhoneNumber = false,
    this.isValidator = false,
    this.validatorMessage,
    this.capitalization = TextCapitalization.none,
    this.fillColor,
    this.validator,
    this.errortext,

  });

  @override
  Widget build(context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
              controller: controller,
              maxLines: maxline ?? 1,
              minLines: minline??1,
              textCapitalization: capitalization,
              maxLength: isPhoneNumber ? 10 : null,
              focusNode: focusNode,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              keyboardType: textInputType ?? TextInputType.text,
              textInputAction: textInputAction ?? TextInputAction.next,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                  counterText: '',
                  filled: true))
        ],
      ),
    );
  }
}