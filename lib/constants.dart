import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

//FIRST ITEMS//1
const kcontentColor = Color(0xffF5F5F5);
const kprimaryColor = Color(0xffff660e);

//Api
const api_url = 'https://sellerex.dracarys.tech/api';

const Color primaryColor = Color(0xFF7B61FF);
const double defaultPadding = 16.0;
const double defaultBorderRadious = 12.0;
const Duration defaultDuration = Duration(milliseconds: 300);

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'),
  MinLengthValidator(4, errorText: 'password must be at least 4 digits long'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])',
      errorText: 'passwords must have at least one special character')
]);

final emaildValidator = MultiValidator([
  RequiredValidator(errorText: 'Email is required'),
  EmailValidator(errorText: "Enter a valid email address"),
]);

// Validateur de prénom
final firstNameValidator = MultiValidator([
  RequiredValidator(errorText: 'First name is required'),
  MinLengthValidator(2,
      errorText: 'First name must be at least 2 characters long'),
  PatternValidator(r'^[a-zA-Z]+$',
      errorText: 'First name must contain only alphabets'),
]);

// Validateur de nom
final lastNameValidator = MultiValidator([
  RequiredValidator(errorText: 'Last name is required'),
  MinLengthValidator(2,
      errorText: 'Last name must be at least 2 characters long'),
  PatternValidator(r'^[a-zA-Z]+$',
      errorText: 'Last name must contain only alphabets'),
]);

const pasNotMatchErrorText = "passwords do not match";
