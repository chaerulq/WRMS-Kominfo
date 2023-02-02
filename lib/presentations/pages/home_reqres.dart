import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wrms_kominfo/data/models/user_reqres_model.dart';
import 'package:wrms_kominfo/data/provider/provider_user_reqres.dart';
import 'package:wrms_kominfo/utils/state_resutl.dart';

class HomeReqres extends StatelessWidget {
  const HomeReqres({Key? key}) : super(key: key);
  static const routeName = '/reqreshome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserReqresProvider>(
        builder: (context, state, child) {
          if (state.state == StateResult.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.state == StateResult.hasData) {
            return Text('');
          } else {}
        },
      ),
    );
  }
}
