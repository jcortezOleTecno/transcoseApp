class PayResponse {
  String? response;
  String? message;
  String? urlPayment;
  String? formPayment;

  PayResponse({
    this.response,
    this.message,
    this.urlPayment,
    this.formPayment,
  });

  factory PayResponse.fromJson(dynamic json) => PayResponse(
        response: json["response"] as String?,
        message: json["message"] as String?,
        urlPayment: json["url_payment"] as String?,
        formPayment: json["form_payment"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        "message": message,
        "url_payment": urlPayment,
        "form_payment": formPayment,
      };
}
