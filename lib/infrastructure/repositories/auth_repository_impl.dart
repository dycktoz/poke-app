import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:poke_app/domain/entities/user.dart';
import 'package:poke_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  static const String _sessionKey = 'user_session';

  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  @override
  Future<TrainerUser?> getActiveSession() async {
    final prefs = await _prefs;
    final sessionString = prefs.getString(_sessionKey);
    if (sessionString == null) return null;
    
    try {
      final json = jsonDecode(sessionString) as Map<String, dynamic>;
      return TrainerUser.fromJson(json);
    } catch (e) {
      // Bad parse
      await prefs.remove(_sessionKey);
      return null;
    }
  }

  @override
  Future<TrainerUser?> login(String username, String password) async {
    // Basic mock authentication verification
    if (username.trim().length < 3 || password.trim().length < 4) {
      throw Exception('El usuario debe tener al menos 3 caracteres y la contraseña 4.');
    }

    // Determine starter Pokemon avatar ID based on first letter
    int avatarId = 25; // Pikachu default
    final firstChar = username.trim().toLowerCase().isNotEmpty ? username.trim().toLowerCase()[0] : 'a';
    if (firstChar.codeUnitAt(0) % 4 == 0) {
      avatarId = 1; // Bulbasaur
    } else if (firstChar.codeUnitAt(0) % 4 == 1) {
      avatarId = 4; // Charmander
    } else if (firstChar.codeUnitAt(0) % 4 == 2) {
      avatarId = 7; // Squirtle
    } else {
      avatarId = 25; // Pikachu
    }

    final user = TrainerUser(
      username: username.trim(),
      avatarPokemonId: avatarId,
      token: 'mock_token_${DateTime.now().millisecondsSinceEpoch}',
      joinDate: '08/07/2026',
    );

    final prefs = await _prefs;
    await prefs.setString(_sessionKey, jsonEncode(user.toJson()));
    return user;
  }

  @override
  Future<void> logout() async {
    final prefs = await _prefs;
    await prefs.remove(_sessionKey);
  }
}
