class AuthResponseModel {
  final bool success;
  final String? message;

  const AuthResponseModel({required this.success, this.message});

  factory AuthResponseModel.success() {
    return const AuthResponseModel(success: true);
  }

  factory AuthResponseModel.failure(String message) {
    return AuthResponseModel(success: false, message: message);
  }
}
