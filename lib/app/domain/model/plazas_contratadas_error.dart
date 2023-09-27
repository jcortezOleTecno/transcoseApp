class PLazasContratadasError {
  String? response;
  String? titleError;
  String? message;

  PLazasContratadasError({
    this.response,
    this.titleError,
    this.message,
  });

  factory PLazasContratadasError.fromJson(dynamic json) =>
      PLazasContratadasError(
        response: json["response"] as String,
        titleError: json["titleError"] as String,
        message: json["message"] as String,
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        "titleError": titleError,
        "message": message,
      };
}
