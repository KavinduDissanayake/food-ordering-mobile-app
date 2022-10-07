import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:ionicons/ionicons.dart';

class CustomTextInputField extends StatefulWidget {
  CustomTextInputField({
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

class _TextSubmitWidgetState extends State<CustomTextInputField> {
  @override
  Widget build(BuildContext context) {
    return

      TextFormField(
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
      cursorColor:
      Theme.of(context).primaryColor,
      style: Theme.of(context).textTheme.bodyText2,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        filled: true,
        suffixIcon: widget.isValidation
            ?  Icon(Ionicons.checkmark_circle_outline,
            color: Theme.of(context).primaryColor)
            : const SizedBox(),
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
