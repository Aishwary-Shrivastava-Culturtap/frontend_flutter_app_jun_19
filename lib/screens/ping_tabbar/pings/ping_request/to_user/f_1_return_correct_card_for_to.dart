import 'package:culturtap/model/pinds_model.dart';
import 'package:culturtap/screens/ping_tabbar/pings/ping_request/to_user/cards/c_1_pending_card_for_to.dart';
import 'package:culturtap/screens/ping_tabbar/pings/ping_request/to_user/cards/c_2_unlock_cal_card_for_to.dart';
import 'package:culturtap/screens/ping_tabbar/pings/ping_request/to_user/cards/c_3_scheduled_card_for_to.dart';
// import 'package:culturtap/screens/ping_tabbar/pings/ping_request/from_user/cards/c_1_pending_card.dart';
// import 'package:culturtap/screens/ping_tabbar/pings/ping_request/from_user/cards/c_2_accept_card.dart';
// import 'package:culturtap/screens/ping_tabbar/pings/ping_request/from_user/cards/c_3_scheduled_card.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class f_1_return_correct_card_for_to extends StatelessWidget {
  final pings_model card_data;
  f_1_return_correct_card_for_to({super.key, required this.card_data});

 
  return_correct_card(pings_model card_data) {
    switch (card_data.status) {
      case "pending":
        print("pending");
        return c_1_pending_card_for_to(
          callId:card_data.callId,

          from: card_data.from,
          fromUser: card_data.fromUser,
          to: card_data.to,
          toUser: card_data.toUser,
          staus: card_data.status,
          title: card_data.title,
        );

        break;

      case "unlock calendar":
        print("pending");

        return c_2_unlock_card_for_to(
          callId:card_data.callId,

          from: card_data.from,
          fromUser: card_data.fromUser,
          to: card_data.to,
          toUser: card_data.toUser,
          staus: card_data.status,
          title: card_data.title,
        );

        break;

      case "scheduled":
        print("pending");

        return c_3_scheduled_card_for_to(
          callId:card_data.callId,

          from: card_data.from,
          fromUser: card_data.fromUser,
          to: card_data.to,
          toUser: card_data.toUser,
          staus: card_data.status,
          title: card_data.title,
        );

        break;
      default:
        return c_2_unlock_card_for_to(
          from: card_data.from,
          fromUser: card_data.fromUser,
          to: card_data.to,
          toUser: card_data.toUser,
          staus: card_data.status,
          title: card_data.title,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return return_correct_card(card_data);
  }
}
