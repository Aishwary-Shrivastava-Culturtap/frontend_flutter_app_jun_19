import 'package:culturtap/model/pinds_model.dart';
import 'package:culturtap/provider/login-form-provider.dart';
import 'package:culturtap/screens/ping_tabbar/pings/ping_request/from_user/f_1_return_correct_card_from_user.dart';
import 'package:culturtap/screens/ping_tabbar/pings/ping_request/to_user/f_1_return_correct_card_for_to.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class p_2_return_correct_card extends StatelessWidget {
  final pings_model card_data;

  const p_2_return_correct_card({super.key, required this.card_data});

  returnCorrectCard(pings_model new_card_data, int id) {
    if (new_card_data.requestFrom == id) {
      return f_1_return_correct_card_from_user(card_data: card_data);
    } else {

      return f_1_return_correct_card_for_to(card_data: card_data);

    }
  }

  @override
  Widget build(BuildContext context) {
    // _userModel = Provider.of<pings_provider>(context, listen: false).getListPings;

    final _user_id =
        Provider.of<login_form_provider>(context, listen: false).userId;

    return returnCorrectCard(card_data, _user_id);
  }
}
