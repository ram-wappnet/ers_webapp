import '../../../export.dart';

class FormValidations {
  String? requiredField(String? value, {String? errorText}) {
    if (value!.isEmpty) {
      return LocaleKeys.fieldRequired.tr();
    }
    return null;
  }

  PatternValidator passwordValidateField() {
    return PatternValidator(
        r'^(?=.*[a-zÇçĞğİıÖöŞşÜü])(?=.*[A-ZÇçĞğİıÖöŞşÜü])(?=.*\d).{8,}',
        errorText: "${LocaleKeys.min8Characters.tr()},"
            "${LocaleKeys.oneUppercaseLetter.tr()},"
            "${LocaleKeys.oneLowercaseLetter.tr()},"
            "${LocaleKeys.oneNumber.tr()}."
            "${LocaleKeys.oneSpecialCharacter.tr()}");
  }

  MultiValidator validation({
    required String type,
    required MultiValidator multiValidator,
    required bool isRequired,
    String? errorText,
  }) {
    if (isRequired) {
      multiValidator.validators.add(
        RequiredValidator(
            errorText: errorText ?? LocaleKeys.fieldRequired.tr()),
      );
    }

    switch (type) {
      case "password":
        multiValidator.validators.add(passwordValidateField());
        break;
      case "email":
        multiValidator.validators
            .add(EmailValidator(errorText: LocaleKeys.invalidEmailFormat.tr()));
        break;
    }
    return multiValidator;
  }
}
