import 'package:formz/formz.dart';

enum UsernameInputError { empty, tooShort }
enum PasswordInputError { empty, tooShort }

class UsernameInput extends FormzInput<String, UsernameInputError> {
  const UsernameInput.pure() : super.pure('');
  const UsernameInput.dirty([super.value = '']) : super.dirty();

  @override
  UsernameInputError? validator(String value) {
    if (value.trim().isEmpty) return UsernameInputError.empty;
    if (value.trim().length < 3) return UsernameInputError.tooShort;
    return null;
  }

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (error == UsernameInputError.empty) return 'El usuario no puede estar vacío';
    if (error == UsernameInputError.tooShort) return 'Debe tener al menos 3 caracteres';
    return null;
  }
}

class PasswordInput extends FormzInput<String, PasswordInputError> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty([super.value = '']) : super.dirty();

  @override
  PasswordInputError? validator(String value) {
    if (value.trim().isEmpty) return PasswordInputError.empty;
    if (value.trim().length < 4) return PasswordInputError.tooShort;
    return null;
  }

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (error == PasswordInputError.empty) return 'La contraseña no puede estar vacía';
    if (error == PasswordInputError.tooShort) return 'Debe tener al menos 4 caracteres';
    return null;
  }
}
