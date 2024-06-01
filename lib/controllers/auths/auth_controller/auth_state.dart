class AuthState {
  final String email;
  final String fullName;
  final String username;
  final String country;
  final String password;
  final String confirmPassword;
  final String deviceName;
  final String pin;
  final String otp;

  AuthState(
      {this.email = '',
      this.fullName = '',
      this.username = '',
      this.country = '',
      this.deviceName = '',
      this.password = '',
      this.confirmPassword = '',
      this.pin = '',
      this.otp = ''});
  AuthState copyWith({
    final String? email,
    final String? fullName,
    final String? username,
    final String? country,
    final String? password,
    final String? confirmPassword,
    final String? deviceName,
    final String? pin,
    final String? otp,
  }) =>
      AuthState(
          email: email ?? this.email,
          fullName: fullName ?? this.fullName,
          username: username ?? this.username,
          country: country ?? this.country,
          password: password ?? this.password,
          confirmPassword: confirmPassword ?? this.confirmPassword,
          deviceName: deviceName ?? this.deviceName,
          pin: pin ?? this.pin,
          otp: otp ?? this.otp);
  static AuthState internal() => AuthState();
}
