
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/const/colors.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class CustomPasswordInputField extends StatefulWidget {
  CustomPasswordInputField({
    this.textInputAction,
    this.onSubmitted,
    this.controller,
    this.hintText,
    this.errorText,
    required this.isValidation,
    required this.onChanged,
  });

  final TextInputAction? textInputAction;
  final Function(String)? onSubmitted;
  final Function(String) onChanged;
  final TextEditingController? controller;
  final String? hintText;
  final String? errorText;

  final bool isValidation;

  bool isErrorShow = false;

  @override
  State<StatefulWidget> createState() {
    return _TextSubmitWidgetState();
  }
}

class _TextSubmitWidgetState extends State<CustomPasswordInputField> {

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: (value) {
        widget.onChanged(value);
        if (value.isNotEmpty) {
          setState(() => widget.isErrorShow = true);
        } else {
          setState(() => widget.isErrorShow = false);
        }
      },
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onSubmitted,
      cursorColor: AppColor.primary,
      style: Theme.of(context).textTheme.bodyText2,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: _obscureText,
      decoration: InputDecoration(
        filled: true,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child:  Icon(
              (_obscureText ? Ionicons.eye_off_outline : Ionicons.eye_outline),
            color: Theme.of(context).primaryColor,
        ),

        ),
        errorText: (widget.isErrorShow) && (!widget.isValidation)
            ? widget.errorText
            : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              32.r,
            ),
            borderSide: (widget.isErrorShow) && (!widget.isValidation)
                ? BorderSide(
              width: 1,
              color: Color(0xffE5E5E5),
            )
                : BorderSide.none),
        hintText: widget.hintText,
        hintStyle: TextStyle(
        //  color: AppColor.kTextColor1,
          fontSize: 14.sp,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 10.h,
        ),
      ),
    );
  }
}
