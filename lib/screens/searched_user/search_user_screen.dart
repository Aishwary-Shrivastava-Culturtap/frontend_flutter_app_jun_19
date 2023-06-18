import 'package:culturtap/constants/constant.dart';
import 'package:culturtap/model/search_user_model.dart';
import 'package:culturtap/provider/list_user_provider.dart';
import 'package:culturtap/provider/remote_user_provider.dart';
import 'package:culturtap/screens/remote_user/profile_remote_user_screen.dart';
import 'package:culturtap/widgets/mywidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

// class list_user extends StatelessWidget {
class list_user extends StatefulWidget {
  const list_user({Key? key}) : super(key: key);

  @override
  _list_userState createState() => _list_userState();
}

class _list_userState extends State<list_user> {
  late List<list_user_model>? _list_user = [];
  var _isInit = true;


  // @override
  // void initState() {
  //   super.initState();
  //   _getData();
  // }

  // void _getData() async {
   
  //   // await list_user_provider().getUsers();

  //   // // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  // }


    @override
  void didChangeDependencies() {
    if (_isInit) {
 
      Provider.of<list_user_provider>(context).getUsers().then((_) {
       
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
     list_user_provider _list_user_provider =  Provider.of<list_user_provider>(context );
 
    // _list_user_provider.getUsers();
// 
    _list_user = _list_user_provider.users;

    return Scaffold(
      // appBar: myAppBar(
      //   onPressedBack: () {},
      //   onPressedPing: () {},
      // ),
      body:
          // CircularProgressIndicator()

          _list_user == null || _list_user!.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(

                  itemCount: _list_user!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          remoteUser.namedRoute,
                          arguments: _list_user![index].uid,
                        );
                      },
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              _list_user![index].uid.toString(),
                              style: texttype.t1,
                            ),
                            Text(_list_user![index].name ?? "", style: texttype.t1),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
