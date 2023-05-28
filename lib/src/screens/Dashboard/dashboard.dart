import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/design_constants.dart';
import 'package:hydrosense_mobile_app/src/screens/Dashboard/view/dashboard_view.dart';

class Dashboard extends StatelessWidget {
  static String routeName = '/Dashboard';
  const Dashboard({
    super.key,
    required this.context,
  });

  final BuildContext context;
  @override
  Widget build(context) {
    // return const HomeView();
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Center(child: Text('Login')),
      //   backgroundColor: Colors.black87,
      // ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(DesignConstants.COLOR_DARKBLUE_PRIMARY),
      body: DashboardView(),
    );
  }
}
