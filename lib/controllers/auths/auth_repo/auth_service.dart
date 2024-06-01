import 'package:smartpay/models/auth/initEmail_verify_response.dart';
import 'package:smartpay/models/auth/login_response.dart';
import 'package:smartpay/models/auth/signup_model.dart';

abstract class AuthService {
  Future<void> signUp(SignupModel signupModel);
  Future<LoginResponse> signIn(
      {required final String email,
      required final String password,
      required final String deviceId});
  Future<void> signOut();
  Future<void> verifyEmail({required String token, required String email});
  Future<InitemailverifyResponse> initverifyEmail(String email);
}
