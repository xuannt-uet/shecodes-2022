import 'package:shecodes2022/config/app_color.dart';
import 'package:shecodes2022/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sizer/sizer.dart';

enum FieldType {
  textField,
  password,
  dateTime,
  search,
}

class FormElement<T> extends StatefulWidget {
  final String name;
  final FieldType type;
  final bool isRequired;
  final FocusNode? focusNode;
  final String? title;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final T? initialValue;
  final List<String>? itemsMultiChoice;
  final Color? backgroundItemsMultiChoiceColor;
  final ValueChanged<dynamic>? onChanged;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;

  const FormElement({
    super.key,
    required this.name,
    this.inputFormatters,
    this.controller,
    this.onChanged,
    required this.type,
    this.isRequired = false,
    this.focusNode,
    this.title,
    this.hintText,
    this.validator,
    this.initialValue,
    this.itemsMultiChoice,
    this.backgroundItemsMultiChoiceColor,
    this.maxLength,
  });

  @override
  State<FormElement> createState() => _FormElementState();
}

class _FormElementState extends State<FormElement> {
  bool _showPassword = false;

  void setShowPassword(bool val) => setState(() => _showPassword = val);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
          hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 14, color: AppColor.hintTextColor),
          errorStyle: const TextStyle(fontWeight: FontWeight.w300, fontSize: 12, color: Colors.red),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.redColor, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.redColor, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.borderColor, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.borderColor, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(5),
          ),
          filled: true,
          fillColor: const Color(0xFfEFEFEF),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.title != null)
              Container(
                margin: const EdgeInsets.all(4),
                child: Text.rich(
                  TextSpan(
                    text: "${widget.title} ",
                    children: [
                      if (widget.isRequired)
                        TextSpan(
                          text: "*",
                          style: AppTextStyle.bodyTextStyle.copyWith(
                            color: AppColor.redColor,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                    ],
                  ),
                  style: AppTextStyle.bodyTextStyle.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            Builder(
              builder: (context) {
                switch (widget.type) {
                  case FieldType.password:
                    return FormBuilderTextField(
                      maxLines: 1,
                      inputFormatters: widget.inputFormatters,
                      name: widget.name,
                      onChanged: widget.onChanged,
                      textAlign: TextAlign.start,
                      autofillHints: const [AutofillHints.password],
                      initialValue: widget.initialValue,
                      keyboardAppearance: Brightness.light,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16, color: Colors.black),
                      focusNode: widget.focusNode,
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        suffixIcon: IconButton(
                          icon: _showPassword ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                          onPressed: () => setShowPassword(_showPassword = !_showPassword),
                          color: const Color(0xFFADBBC2),
                        ),
                      ),
                      obscureText: !_showPassword,
                      keyboardType: TextInputType.text,
                      validator: widget.validator,
                    );

                  case FieldType.textField:
                    return FormBuilderTextField(
                      maxLines: 1,
                      inputFormatters: widget.inputFormatters,
                      controller: widget.controller,
                      initialValue: widget.initialValue,
                      onChanged: widget.onChanged,
                      name: widget.name,
                      focusNode: widget.focusNode,
                      autofillHints: const [AutofillHints.username],
                      keyboardAppearance: Brightness.light,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 16),
                      decoration: InputDecoration(hintText: widget.hintText),
                      keyboardType: TextInputType.text,
                      validator: widget.validator,
                    );

                  case FieldType.dateTime:
                    return FormBuilderDateTimePicker(
                      controller: widget.controller,
                      initialValue: widget.initialValue,
                      onChanged: widget.onChanged,
                      inputType: InputType.date,
                      name: widget.name,
                      focusNode: widget.focusNode,
                      keyboardAppearance: Brightness.light,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 16),
                      decoration: InputDecoration(hintText: widget.hintText),
                    );

                  case FieldType.search:
                    return FormBuilderTextField(
                      maxLines: 1,
                      inputFormatters: widget.inputFormatters,
                      controller: widget.controller,
                      initialValue: widget.initialValue,
                      onChanged: widget.onChanged,
                      name: widget.name,
                      focusNode: widget.focusNode,
                      keyboardAppearance: Brightness.light,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        prefixIcon: const Icon(Icons.search),
                      ),
                    );

                  default:
                    return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
