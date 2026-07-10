import '../entities/user.dart';

abstract class AuthRepository {
  Future<TrainerUser?> login(String username, String password);
  Future<void> logout();
  Future<TrainerUser?> getActiveSession();
}
