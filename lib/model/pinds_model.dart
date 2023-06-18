// To parse this JSON data, do
//
//     final pings_model = pings_modelFromJson(jsonString);

import 'dart:convert';

List<pings_model> pings_modelFromJson(String str) => List<pings_model>.from(json.decode(str).map((x) => pings_model.fromJson(x)));

String pings_modelToJson(List<pings_model> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class pings_model {
    pings_model({
        required this.callId,
        required this.requestFrom,
        required this.fromUser,
        required this.requestTo,
        required this.toUser,
        required this.title,
        required this.from,
        required this.to,
        required this.status,
    });

    String callId;
    int requestFrom;
    String fromUser;
    int requestTo;
    String toUser;
    String title;
    String from;
    String to;
    String status;

    factory pings_model.fromJson(Map<String, dynamic> json) => pings_model(
        callId: json["callId"],
        requestFrom: json["requestFrom"],
        fromUser: json["fromUser"],
        requestTo: json["requestTo"],
        toUser: json["toUser"],
        title: json["title"],
        from: json["from_"],
        to: json["to"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "callId": callId,
        "requestFrom": requestFrom,
        "fromUser": fromUser,
        "requestTo": requestTo,
        "toUser": toUser,
        "title": title,
        "from_": from,
        "to": to,
        "status": status,
    };
}
