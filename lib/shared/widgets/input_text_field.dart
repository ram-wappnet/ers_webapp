

import '../../export.dart';

class InputTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final Widget? prefixIcon;
  final String? labelText;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final int? minLines;
  final int? errorMaxLines;
  final double? height;
  final double? width;
  final int? maxLines;
  final ValueChanged? onChanged;
  final void Function()? onTogglePassword;
  final int? maxLength;
  final TextEditingController? editingController;
  final TextInputType? keyboardType;
  final bool changeTextStyle;
  final bool? readOnly;
  final EdgeInsets? contentPadding;
  final TextInputAction? textInputAction;
  final TextStyle? hintStyle;
  final TextStyle? lableStyle;
  final TextStyle? style;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final MultiValidator? validator;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final Color? fillColor;
  final TextAlign? textAlign;
  final TextCapitalization? textCapitalization;

  const InputTextField({
    required this.hintText,
    this.onChanged,
    this.fillColor,
    this.contentPadding,
    this.onFieldSubmitted,
    this.labelText,
    this.validator,
    this.textInputAction,
    this.changeTextStyle = false,
    this.height,
    this.width,
    this.onEditingComplete,
    this.minLines,
    this.focusNode,
    this.maxLines,
    this.errorMaxLines,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.lableStyle,
    this.hintStyle,
    this.style,
    this.suffixIcon,
    this.prefixIcon,
    this.inputFormatters,
    this.obscureText,
    this.editingController,
    this.maxLength,
    this.onTogglePassword,
    this.keyboardType,
    this.readOnly,
    this.autovalidateMode,
    this.textCapitalization,
    this.onTap,
    super.key,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    InputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.r5),
      borderSide: BorderSide.none,
    );
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        key: key,
        onTap: onTap,
        textAlign: textAlign ?? TextAlign.start,
        autovalidateMode:
            autovalidateMode ?? AutovalidateMode.onUserInteraction,
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: onEditingComplete,
        focusNode: focusNode,
        onChanged: onChanged,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        inputFormatters: inputFormatters ??
            [
              FilteringTextInputFormatter.deny(RegExp(r'^\s')),
            ],
        validator: (validator ?? MultiValidator([])).call,
        readOnly: readOnly ?? false,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: textInputAction,
        controller: editingController,
        cursorColor: Theme.of(context).colorScheme.primary,
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: obscureText ?? false,
        style: AppCss.outfitLight14
            .textColor(Theme.of(context).colorScheme.onSecondary)
            .letterSpace(.2),
        decoration: InputDecoration(
          counterText: "",
          alignLabelWithHint: true,
          labelText: labelText,
          filled: true,
          fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          floatingLabelStyle: Theme.of(context).textTheme.titleMedium,
          errorStyle: AppCss.outfitLight14
              .textColor(Theme.of(context).colorScheme.error)
              .letterSpace(.2),
          hintText: hintText,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          hintStyle: hintStyle ??
              AppCss.outfitLight14
                  .textColor(Theme.of(context).colorScheme.onBackground)
                  .letterSpace(.2),
          prefixIcon: prefixIcon,
          border: border ?? inputBorder,
          enabledBorder: enabledBorder ?? inputBorder,
          errorBorder: errorBorder ?? inputBorder,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(
                  horizontal: Insets.i15, vertical: Insets.i20),
          errorMaxLines: errorMaxLines ?? 5,
          disabledBorder: inputBorder,
          focusedErrorBorder: inputBorder,
          focusedBorder: focusedBorder ?? inputBorder,
          suffixIcon: suffixIcon,
        ),
        minLines: minLines ?? 1,
        maxLength: maxLength ?? 100,
      ),
    );
  }
}
