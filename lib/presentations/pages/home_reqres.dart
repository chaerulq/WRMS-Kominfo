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
            return Text(
              state.result.data.email,
              style: TextStyle(fontSize: 15),
            );
          } else if (state.state == StateResult.noData) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 8),
                  Text(state.message),
                  const SizedBox(height: 8),
                ],
              ),
            );
          } else if (state.state == StateResult.noConnection) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 8),
                  Text(state.message),
                  const SizedBox(height: 8),
                ],
              ),
            );
          } else if (state.state == StateResult.error) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 8),
                  Text(state.message),
                  const SizedBox(height: 8),
                ],
              ),
            );
          } else {
            return const Center(child: Text(''));
          }
        },
      ),
    );
  }
}
