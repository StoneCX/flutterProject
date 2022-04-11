import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef CodeInputBuilder = Widget Function(bool hasFocus, String char);

class CodeInput extends StatefulWidget {
  CodeInput._({
    Key? key,
    required this.length,
    required this.focusNode,
    required this.keyboardType,
    required this.inputFormatters,
    required this.builder,
    this.onChanged,
    this.onFilled,
  }) : super(key: key);

  factory CodeInput({
    Key? key,
    required int length,
    FocusNode? focusNode,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    required CodeInputBuilder builder,
    void Function(String value)? onChanged,
    void Function(String value)? onFilled,
  }) {
    assert(length > 0, 'The length needs to be larger than zero.');
    assert(length.isFinite, 'The length needs to be finite.');

    return CodeInput._(
      key: key,
      length: length,
      focusNode: focusNode ?? FocusNode(),
      keyboardType: keyboardType,
      inputFormatters:
          inputFormatters ?? _createInputFormatters(length, keyboardType),
      builder: builder,
      onChanged: onChanged,
      onFilled: onFilled,
    );
  }

  final int length;

  final FocusNode focusNode;

  final TextInputType keyboardType;

  final List<TextInputFormatter> inputFormatters;
  /// in my head this thought as WidgetBuilder
  final CodeInputBuilder builder;

  final void Function(String value)? onChanged;

  final void Function(String value)? onFilled;

  static List<TextInputFormatter> _createInputFormatters(
      int length, TextInputType keyboardType) {
    final formatters = <TextInputFormatter>[
      LengthLimitingTextInputFormatter(length)//Creates a formatter that prevents the insertion of more characters than a limit.
    ];

    if (keyboardType == TextInputType.number) {
      formatters.add(FilteringTextInputFormatter.allow(RegExp('^[0-9]*\$')));
    }

    return formatters;
  }

  @override
  _CodeInputState createState() => _CodeInputState();
}

class _CodeInputState extends State<CodeInput> {
  final controller = TextEditingController();

  String get text => controller.text;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
          width: 0.0,
          height: 0.0,
          child: EditableText(
            controller: controller,
            focusNode: widget.focusNode,
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.keyboardType,
            backgroundCursorColor: Colors.black,
            style: TextStyle(),
            cursorColor: Colors.black,
            onChanged: (value) => setState(() {
              widget.onChanged?.call(value);
              if (value.length == widget.length) {
                widget.onFilled?.call(value);
              }
            }),
          )),
      GestureDetector(
          onTap: () {
            final focusScope = FocusScope.of(context);
            focusScope.requestFocus(FocusNode());
            Future.delayed(
              Duration.zero,
              () => focusScope.requestFocus(widget.focusNode),
            );
          },
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(widget.length, (i) {
                final hasFocus = controller.selection.start == i;
                final char = i < text.length ? text[i] : '';
                final characterEntity = widget.builder(hasFocus, char);
                return characterEntity;
              }),
            ),
          )),
    ]);
  }
}

abstract class CodeInputBuilders {
  static CodeInputBuilder containerized({
    Duration animationDuration = const Duration(milliseconds: 50),
    required Size totalSize,
    required Size emptySize,
    required Size filledSize,
    required BoxDecoration emptyDecoration,
    required BoxDecoration filledDecoration,
    required TextStyle emptyTextStyle,
    required TextStyle filledTextStyle,
  }) {
    return (bool hasFocus, String char) => Container(
        width: totalSize.width,
        height: totalSize.height,
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          decoration: char.isEmpty ? emptyDecoration : filledDecoration,
          width: char.isEmpty ? emptySize.width : filledSize.width,
          height: char.isEmpty ? emptySize.height : filledSize.height,
          alignment: Alignment.center,
          child: Text(char,
              style: char.isEmpty ? emptyTextStyle : filledTextStyle),
        ));
  }

  ///模拟文本输入框
  static CodeInputBuilder simulatorTextField({
    Duration animationDuration = const Duration(milliseconds: 50),
    required Size totalSize,
    required Size emptySize,
    required Size filledSize,
    required BoxDecoration emptyDecoration,
    required BoxDecoration filledDecoration,
    required TextStyle emptyTextStyle,
    required TextStyle filledTextStyle,
  }) {
    return (bool hasFocus, String char) => Container(
        width: totalSize.width,
        height: totalSize.height,
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          decoration: char.isEmpty ? emptyDecoration : filledDecoration,
          width: char.isEmpty ? emptySize.width : filledSize.width,
          height: char.isEmpty ? emptySize.height : filledSize.height,
          alignment: Alignment.center,
          child: Row(
            children: [
                // SizedBox(width: 10,),
                Column(
                  children: [
                    Text(char,
                        style: char.isEmpty ? emptyTextStyle : filledTextStyle),
                    Spacer(),
                    Container(
                      width: char.isEmpty ? emptySize.width : filledSize.width,
                      height: 1,
                      color: char.isEmpty ? Color(0xFF999999) : Color(0xFF333333),
                    )  
                  ],
                ),
                // SizedBox(width: 10,),
            ],
          ),
        ));
  }

  static CodeInputBuilder circle(
      {double totalRadius = 30.0,
      double emptyRadius = 10.0,
      double filledRadius = 25.0,
      required Border border,
      required Color color,
      required TextStyle textStyle}) {
    final circleDecoration = BoxDecoration(
      shape: BoxShape.circle,
      border: border,
      color: color,
    );

    return containerized(
        totalSize: Size.fromRadius(totalRadius),
        emptySize: Size.fromRadius(emptyRadius),
        filledSize: Size.fromRadius(filledRadius),
        emptyDecoration: circleDecoration,
        filledDecoration: circleDecoration,
        emptyTextStyle: textStyle.copyWith(fontSize: 0.0),
        filledTextStyle: textStyle);
  }

  static CodeInputBuilder rectangle(
      {double totalWidth = 30.0,
      double emptyWidth = 10.0,
      double filledWidth = 25.0,
      required Border border,
      required Color color,
      required Color emptyColor,
      required TextStyle textStyle}) {
    final rectangleDecoration = BoxDecoration(
      shape: BoxShape.rectangle,
      border: border,
      color: color,
    );

    final rectangleEmptyDecoration = BoxDecoration(
      shape: BoxShape.rectangle,
      border: border,
      color: emptyColor,
    );

    return containerized(
        totalSize: Size.square(totalWidth),
        emptySize: Size.square(emptyWidth),
        filledSize: Size.square(filledWidth),
        emptyDecoration: rectangleEmptyDecoration,
        filledDecoration: rectangleDecoration,
        emptyTextStyle: textStyle.copyWith(fontSize: 0.0),
        filledTextStyle: textStyle);
  }

  static CodeInputBuilder darkCircle({
    double totalRadius = 25.0,
    double emptyRadius = 14.0,
    double filledRadius = 15.0,
  }) {
    return circle(
      totalRadius: totalRadius,
      emptyRadius: emptyRadius,
      filledRadius: filledRadius,
      color: Color(0xFF999999),
      textStyle: TextStyle(
          color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      border: Border(),
    );
    // return 
  }

  static CodeInputBuilder lightRectangle({
    double totalWidth = 35.0,
    double emptyWidth = 28.0,
    double filledWidth = 32.0,
  }) {
    return rectangle(
      totalWidth: totalWidth,
      emptyWidth: emptyWidth,
      filledWidth: filledWidth,
      color: Colors.white,
      emptyColor: Colors.grey.shade300,
      textStyle: TextStyle(
          color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
      border: Border(),
      // border: Border(bottom: BorderSide( width: totalWidth,style: BorderStyle.solid)),
    );
    // return 
  }
}
