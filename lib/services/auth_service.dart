import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _client = Supabase.instance.client;

  ///register with email

  Future<AuthResponse> register(
      {required String email, required String password}) async {
    return await _client.auth.signUp(password: password, email: email);
  }

  ///login with email and password

  Future<AuthResponse> login(
      {required String email, required String password}) async {
    return _client.auth.signInWithPassword(password: password, email: email);
  }

  ///logout
  Future<void> logout() async {
    await _client.auth.signOut();
  }

  ///get user email
  String? getEmail(){
    final session = _client.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }
}
