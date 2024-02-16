import 'package:bac_architecture/features/authentication/presentation/providers/di/auth_providers.dart';
import 'package:bac_architecture/features/authentication/presentation/providers/states/auth_state.dart';
import 'package:bac_architecture/features/authentication/presentation/widgets/auth_field.dart';
import 'package:bac_architecture/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController usernameController =
      TextEditingController(text: 'kminchelle');
  final TextEditingController passwordController =
      TextEditingController(text: '0lelplR');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authStateNotifierProvider);

    if (state is AuthStateSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      });


    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod architecture example'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            AuthField(
              hintText: 'Username',
              controller: usernameController,
            ),
            AuthField(
              hintText: 'Password',
              obscureText: true,
              controller: passwordController,
            ),
            state is AuthStateLoading
                ? const Center(child: CircularProgressIndicator())
                : loginButton(ref),
            state is AuthStateSuccess
                ? Center(child: Text(state.user.userName))
                : const SizedBox(),
            state is AuthStateFailure
                ? Center(child: Text(state.exception.message))
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Widget loginButton(WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(authStateNotifierProvider.notifier).loginUser(
              usernameController.text,
              passwordController.text,
            );
      },
      child: const Text('Login'),
    );
  }
}
