class TrainerUser {
  final String username;
  final int avatarPokemonId;
  final String token;
  final String joinDate;

  TrainerUser({
    required this.username,
    required this.avatarPokemonId,
    required this.token,
    required this.joinDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'avatarPokemonId': avatarPokemonId,
      'token': token,
      'joinDate': joinDate,
    };
  }

  factory TrainerUser.fromJson(Map<String, dynamic> json) {
    return TrainerUser(
      username: json['username'] as String,
      avatarPokemonId: json['avatarPokemonId'] as int? ?? 25,
      token: json['token'] as String,
      joinDate: json['joinDate'] as String? ?? '08/07/2026',
    );
  }
}
