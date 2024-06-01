import 'package:smartpay/controllers/auths/auth_repo/auth_service.dart';
import 'package:smartpay/models/auth/initEmail_verify_response.dart';
import 'package:smartpay/models/auth/login_response.dart';
import 'package:smartpay/network_helper.dart/api_constants.dart';
import 'package:smartpay/network_helper.dart/dio_client.dart';

class AUthImplementation extends AuthService {
  @override
  Future<LoginResponse> signIn(
      {required final String email,
      required final String password,
      required final deviceId}) async {
    try {
      final res = await DioClient.apiCall(
          apiPath: ApiPath.signIn,
          method: RequestMethod.post,
          data: {
            'email': email,
            "password": password,
            'device_name': deviceId
          });
      return LoginResponse.fromJson(res?.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      final res = await DioClient.apiCall(
        apiPath: ApiPath.signIn,
        method: RequestMethod.post,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signUp(signupModel) async {
    try {
      await DioClient.apiCall(
          apiPath: ApiPath.signUp,
          method: RequestMethod.post,
          data: signupModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<InitemailverifyResponse> initverifyEmail(email) async {
    try {
      final res = await DioClient.apiCall(
          apiPath: ApiPath.initEmailVer,
          method: RequestMethod.post,
          data: {'email': email});
      return InitemailverifyResponse.fromJson(res?.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> verifyEmail(
      {required String token, required String email}) async {
    try {
      await DioClient.apiCall(
          apiPath: ApiPath.verifyEmail,
          method: RequestMethod.post,
          data: {'token': token, 'email': email});
    } catch (e) {
      rethrow;
    }
  }
}
