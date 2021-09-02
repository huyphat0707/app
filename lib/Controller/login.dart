class LoginResponse {
  final String token;
  final String? error;

  LoginResponse({required this.token, this.error});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    if(json["message"] != null){
      return LoginResponse(
        token: '',
        error: json["message"] != null ? json["message"] : "",
      );
    }
    return LoginResponse(
      token: json['data']['token'] != null ? json['data']['token'] : "",
      error: '',
    );
  }
}
