// ignore_for_file: must_be_immutable

import 'package:ers_admin/shared/theme/app_colors.dart';

import '../../export.dart';

class TextAvatar extends StatelessWidget {
  Color? backgroundColor;
  Color? textColor;
  double? size;
  final String? text;
  final double? fontSize;
  final int? numberLetters;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final bool? upperCase;

  TextAvatar(
      {super.key,
      @required this.text,
      this.textColor,
      this.backgroundColor,
      this.numberLetters,
      this.size,
      this.fontWeight = FontWeight.bold,
      this.fontFamily,
      this.fontSize = 16,
      this.upperCase = false}) {
    //assert(numberLetters! > 0);
  }

  @override
  Widget build(BuildContext context) {
    size = (size == null || size! < 32.0) ? 48.0 : size;
    backgroundColor = _colorBackgroundConfig();
    textColor = _colorTextConfig();
    return _textDisplay();
  }

  Color _colorBackgroundConfig() {
    if (RegExp(r'[A-Z]|').hasMatch(
      _textConfiguration(),
    )) {
      backgroundColor = ErsAppColors()
          .colorData[_textConfiguration()[0].toLowerCase().toString()];
    }
    return backgroundColor!;
  }

  Color _colorTextConfig() {
    if (textColor == null) {
      return Colors.white;
    } else {
      return textColor!;
    }
  }

  String _toString({String? value}) {
    return String.fromCharCodes(
      value!.runes.toList(),
    );
  }

  String _textConfiguration() {
    var newText = text == null ? '?' : _toString(value: text);
    newText = upperCase! ? newText.toUpperCase() : newText;
    var arrayLeeters = newText.trim().split(' ');

    if (arrayLeeters.length > 1 && arrayLeeters.length == numberLetters) {
      return '${arrayLeeters[0][0].trim()}${arrayLeeters[1][0].trim()}';
    }

    return newText[0];
  }

  Widget _buildText() {
    return Text(
      _textConfiguration(),
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
    );
  }

  Widget _textDisplay() {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(size! / 2),
      ),
      color: backgroundColor,
      child: SizedBox(
        height: size,
        width: size,
        child: Center(
          child: _buildText(),
        ),
      ),
    );
  }
}
