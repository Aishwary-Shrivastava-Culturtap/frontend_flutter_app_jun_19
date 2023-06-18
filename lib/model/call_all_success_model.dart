
import 'dart:convert';

call_all_success_model call_all_success_modelFromJson(String str) => call_all_success_model.fromJson(json.decode(str));

String call_all_success_modelToJson(call_all_success_model data) => json.encode(data.toJson());

class call_all_success_model {
    call_all_success_model({
        required this.insertedId,
        required this.status,
    });

    String insertedId;
    String status;

    factory call_all_success_model.fromJson(Map<String, dynamic> json) => call_all_success_model(
        insertedId: json["insertedId"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "insertedId": insertedId,
        "status": status,
    };
}