import 'package:formz/formz.dart';

enum SearchInputError { empty, tooLong, invalidCharacters }

class SearchInput extends FormzInput<String, SearchInputError> {
  const SearchInput.pure() : super.pure('');
  const SearchInput.dirty([super.value = '']) : super.dirty();

  @override
  SearchInputError? validator(String value) {
    // Search can be empty (meaning no filter applied, which is valid)
    if (value.length > 30) {
      return SearchInputError.tooLong;
    }
    
    // Check for special characters (only allow letters, numbers, spaces, and hyphens)
    final RegExp searchRegExp = RegExp(r'^[a-zA-Z0-9\s\-]*$');
    if (!searchRegExp.hasMatch(value)) {
      return SearchInputError.invalidCharacters;
    }

    return null;
  }

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (error == SearchInputError.tooLong) {
      return 'Búsqueda demasiado larga (máx. 30 caracteres)';
    }
    if (error == SearchInputError.invalidCharacters) {
      return 'Caracteres no permitidos';
    }
    return null;
  }
}
