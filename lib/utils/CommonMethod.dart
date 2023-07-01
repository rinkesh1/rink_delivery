import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'App_utils.dart';

const List<Color> _kDefaultRainbowColors = const [
  Colors.indigo,
  Colors.indigoAccent,
  Colors.blue,
  Colors.indigoAccent,
  Colors.blue,
  Colors.indigoAccent,
  Colors.indigo,
];
const dropDownHight = 45.0;


Widget text(String text, double size, Color colors, FontWeight fontWeight) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      color: colors,
      fontWeight: fontWeight,
    ),
  );
}

final textBoxDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);


showToast(String text) {
  Fluttertoast.showToast(
      msg: text,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      toastLength: Toast.LENGTH_LONG,
      fontSize: 16);
}

showToastBlue(String text) {
  Fluttertoast.showToast(
      msg: text,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      toastLength: Toast.LENGTH_LONG,
      fontSize: 16);
}

lineScaleLoader(context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: Color(0x00ffffff),
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(0.4),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              decoration: BoxDecoration(
                //color: Theme.of(context).hoverColor,
                borderRadius: BorderRadius.circular(7),
              ),
              width: 60,
              height: 60,
              child: Center(
                child: LoadingIndicator(
                  indicatorType: Indicator.lineScale,
                  colors: _kDefaultRainbowColors,
                  strokeWidth: 4.0,
                ),
              ),
            ),
          ),
        );
      });
}


String currentDateDDMMYY() {
  String currentDate = DateFormat('dd_MM_yy').format(DateTime.now());
  return currentDate;
}

showDialogWithOk(context, String title, String contain) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title),
      content: Text(contain),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

class CommonTextfieldRectangle extends StatelessWidget {
  CommonTextfieldRectangle({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.hintText,
    this.textInput,
    this.isSecure = false,
    this.isDisabled = false,
    this.isDigitsOnly = false,
    this.maxLength,
    this.suffixWidget,
    this.prefixWidget,
    this.focus,
    this.validation,
    this.emptyValidation = true,
    this.nextFocus,
    this.onChange,
    this.onClick,
    this.textStyle,
    this.maxLine,
  }) : super(key: key);

  final String labelText;
  final TextEditingController controller;
  final TextInputType? textInput;
  final String hintText;

  final int? maxLength;
  final bool isSecure;
  final bool isDisabled;
  final bool isDigitsOnly;
  final bool emptyValidation;
  final FocusNode? focus;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final String? Function(String?)? validation;
  final void Function()? nextFocus;
  final void Function()? onClick;
  final void Function(String)? onChange;
  final int? maxLine;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(labelText, style: blackRegular14),
          // SizedBox(
          //   height: 10.h,
          // ),
          TextFormField(
            onTap: onClick,
            controller: controller,
            keyboardType: textInput ?? TextInputType.text,
            cursorColor: Colors.blue[600],
            // inputFormatters: isDigitsOnly ? [WhitelistingTextInputFormatter.digitsOnly]: null,

            inputFormatters: isDigitsOnly
                ? [
                    FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      try {
                        final text = newValue.text;
                        if (text.isNotEmpty) double.parse(text);
                        return newValue;
                      } catch (e, stackTrack) {

                      }
                      return oldValue;
                    }),
                  ]
                : null,
            // cursorColor: primaryColor,
            maxLength: maxLength,
            maxLines: maxLine,
            focusNode: focus,

            obscureText: isSecure,
            enabled: !isDisabled,
            textAlignVertical: TextAlignVertical.bottom,
            style: textStyle ?? blackRegular16,

            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: blackRegular16.copyWith(fontSize: 18),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: suffixWidget != null
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: suffixWidget,
                    )
                  : null,
              prefixIcon: prefixWidget != null
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: prefixWidget,
                    )
                  : null,
              alignLabelWithHint: true,
              // filled: true,
              fillColor: Theme.of(context).focusColor,
              // suffixIconConstraints: BoxConstraints(maxHeight: 15.h),
              prefixIconConstraints: BoxConstraints(maxHeight: 35),
              counterText: "",
              hintText: hintText,
              hintStyle: hintTextStyle,
              contentPadding: EdgeInsets.only(bottom: 11, top: 15, left: 15),
              isDense: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Theme.of(context).hintColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Theme.of(context).hintColor),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Theme.of(context).hintColor),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Theme.of(context).hintColor),
              ),
            ),

            /*Rinkesh Error*/

            validator: emptyValidation
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return '$hintText Required';
                    }
                    return null;
                  }
                : validation,
            onEditingComplete: nextFocus,
            onChanged: onChange,
          ),
        ],
      ),
    );
  }
}

class CommonDropDown<T> extends StatefulWidget {
  CommonDropDown(
      {Key? key,
      this.list,
      this.labelText,
      this.hintText,
      this.onChanged,
      this.selectedValue,
      this.isShowSearchBox,
      this.isEnabled})
      : super(key: key);

  String? labelText;
  List<String>? list;
  dynamic selectedValue;
  String? hintText;
  bool? isShowSearchBox;
  bool? isEnabled;
  final void Function(String?)? onChanged;

  @override
  State<CommonDropDown> createState() => _CommonDropDownState();
}

class _CommonDropDownState extends State<CommonDropDown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dropDownHight,
      child: DropdownSearch<String>(
        enabled: widget.isEnabled ?? true,
        mode: Mode.DIALOG,
        autoFocusSearchBox: true,
        showSearchBox: widget.isShowSearchBox ?? true,
        showSelectedItem: true,
        items: widget.list,
        label: widget.labelText,
        hint: widget.hintText,
        onChanged: widget.onChanged,
        selectedItem: widget.selectedValue,
      ),
    );
  }
}

class CommonDropDownWithoutBox<T> extends StatefulWidget {
  CommonDropDownWithoutBox(
      {Key? key,
        this.list,
        this.labelText,
        this.hintText,
        this.onChanged,
        this.selectedValue,
        this.isShowSearchBox,
        this.isEnabled})
      : super(key: key);

  String? labelText;
  List<String>? list;
  dynamic selectedValue;
  String? hintText;
  bool? isShowSearchBox;
  bool? isEnabled;
  final void Function(String?)? onChanged;

  @override
  State<CommonDropDownWithoutBox> createState() => _CommonDropDownWithoutBox();
}

class _CommonDropDownWithoutBox extends State<CommonDropDownWithoutBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dropDownHight,
      child: DropdownSearch<String>(
        enabled: widget.isEnabled ?? true,
        mode: Mode.DIALOG,
        autoFocusSearchBox: true,
        showSearchBox: widget.isShowSearchBox ?? true,
        showSelectedItem: true,
        items: widget.list,
        label: widget.labelText,
        hint: widget.hintText,
        onChanged: widget.onChanged,
        selectedItem: widget.selectedValue,
      ),
    );
  }
}

class UnderlineTextfield extends StatelessWidget {
  UnderlineTextfield({
    // Key key,
    this.labelText,
    this.controller,
    this.hintText,
    this.textInput,
    this.isSecure = false,
    this.maxLength,
    this.suffixWidget,
    this.isDisabled = false,
    this.focus,
    this.validation,
    this.emptyValidation = true,
    this.nextFocus,
    this.cursorcolor = Colors.black,
    this.textstyle,
    this.hintstyle,
    this.borderColor = Colors.black,
  });/* : super(key: key);*/

  String? labelText;
  TextEditingController? controller;
  TextInputType? textInput;
  String? hintText;
  int? maxLength;
  bool isSecure;
  bool emptyValidation;
  bool isDisabled;
  FocusNode? focus;
  Widget? suffixWidget;
  Function? validation;
  Function? nextFocus;
  var textstyle;
  var hintstyle;
  var cursorcolor;
  var borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(labelText, style: blackRegular14),
          // SizedBox(
          //   height: 10.h,
          // ),
          TextFormField(
            controller: controller,
            keyboardType: textInput ?? TextInputType.text,
            cursorColor: cursorcolor,
            maxLength: maxLength,
            focusNode: focus,
            obscureText: isSecure,
            enabled: !isDisabled,
            textAlignVertical: TextAlignVertical.bottom,
            style: textstyle,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                ),
                child: suffixWidget,
              ),
              // filled: true,
              // fillColor: Theme.of(context).focusColor,
              suffixIconConstraints: BoxConstraints(maxHeight: 15),
              counterText: "",
              hintText: hintText,
              hintStyle: hintstyle ?? hintTextStyle,
              contentPadding:
              EdgeInsets.only(bottom: 5, top: 12, left: 2),
              isDense: true,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: borderColor)),
              /* enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: BorderSide(color: Theme.of(context).hintColor),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: BorderSide(color: Theme.of(context).hintColor),
              ), */
            ),

            /*Rinkesh Error*/

            /*validator: emptyValidation
                ? (value) {
              if (value == null || value.isEmpty) {
                return '$hintText Required';
              }
              return null;
            }
                : validation,
            onEditingComplete: nextFocus,*/
          ),
        ],
      ),
    );
  }
}
