import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_app/presentation/providers/providers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  static const name = 'login-screen';

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  UsernameInput username = const UsernameInput.pure();
  PasswordInput password = const PasswordInput.pure();
  bool isSubmitting = false;

  void _onLoginPressed() async {
    setState(() {
      username = UsernameInput.dirty(username.value);
      password = PasswordInput.dirty(password.value);
    });

    if (!username.isValid || !password.isValid) {
      return;
    }

    setState(() {
      isSubmitting = true;
    });

    final success = await ref.read(authProvider.notifier).login(
          username.value,
          password.value,
        );

    setState(() {
      isSubmitting = false;
    });

    if (success) {
      if (mounted) {
        // Go back or go to home
        if (context.canPop()) {
          context.pop();
        } else {
          context.go('/');
        }
      }
    } else {
      if (mounted) {
        final errorMessage = ref.read(authProvider).errorMessage ?? 'Error desconocido';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: const Color(0xFFDC0A2D),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo/Art Avatar (Pokeball Circle)
                  Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Image(
                        image: NetworkImage('https://i.pinimg.com/originals/46/e7/7e/46e77e3db6a6cdce8c63a9de331f31ff.png'),
                        width: 80,
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Entrenador Pokémon',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Inicia sesión para guardar favoritos y ver tu perfil.',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  // White Login Form Card
                  Card(
                    color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          // Username Text Field
                          TextField(
                            style: TextStyle(color: isDark ? Colors.white : Colors.black87),
                            onChanged: (value) {
                              setState(() {
                                username = UsernameInput.dirty(value);
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Usuario',
                              labelStyle: TextStyle(color: isDark ? Colors.white70 : Colors.grey.shade600),
                              hintText: 'Ingresa tu nombre de entrenador',
                              hintStyle: TextStyle(color: isDark ? Colors.white38 : Colors.grey.shade400),
                              errorText: username.errorMessage,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              prefixIcon: Icon(Icons.person, color: isDark ? Colors.white70 : Colors.grey.shade600),
                            ),
                          ),
                          const SizedBox(height: 18),

                          // Password Text Field
                          TextField(
                            style: TextStyle(color: isDark ? Colors.white : Colors.black87),
                            obscureText: true,
                            onChanged: (value) {
                              setState(() {
                                password = PasswordInput.dirty(value);
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              labelStyle: TextStyle(color: isDark ? Colors.white70 : Colors.grey.shade600),
                              hintText: 'Ingresa tu contraseña',
                              hintStyle: TextStyle(color: isDark ? Colors.white38 : Colors.grey.shade400),
                              errorText: password.errorMessage,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              prefixIcon: Icon(Icons.lock, color: isDark ? Colors.white70 : Colors.grey.shade600),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Login Button
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFDC0A2D),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: (authState.status == AuthStatus.checking || isSubmitting)
                                  ? null
                                  : _onLoginPressed,
                              child: (authState.status == AuthStatus.checking || isSubmitting)
                                  ? const CircularProgressIndicator(color: Colors.white)
                                  : const Text(
                                      'Iniciar Sesión',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Guest Navigation link
                  TextButton(
                    onPressed: () => context.go('/'),
                    child: const Text(
                      'Entrar como Invitado',
                      style: TextStyle(
                        color: Colors.white70,
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
