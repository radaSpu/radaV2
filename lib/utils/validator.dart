
import 'package:form_field_validator/form_field_validator.dart';

class schoolEmailValidator extends FieldValidator<String> {
  // pass the error text to the super constructor
  schoolEmailValidator({String errorText = 'enter a valid LYD phone number'}) : super(errorText);

  // return false if you want the validator to return error
  // message when the value is empty.
  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String value) {
    // return true if the value is valid according the your condition
    return RegExp(r'^[a-zA-Z0-9]+@spu\.ac\.ke$').hasMatch(value);
  }
}