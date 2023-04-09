import 'dart:convert';

ApiResponse apiResponseFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  ApiResponse({
    this.response,
    this.message,
  });

  String? response;
  String? message;

  ApiResponse copyWith({
    String? response,
    String? message,
  }) =>
      ApiResponse(
        response: response ?? this.response,
        message: message ?? this.message,
      );

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        response: json["response"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        "message": message,
      };
}
