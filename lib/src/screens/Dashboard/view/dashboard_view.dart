import 'package:flutter/material.dart';
import 'package:hydrosense_mobile_app/src/constants/DesignContants.dart';
import 'package:hydrosense_mobile_app/src/providers/users_db.dart';
import 'package:hydrosense_mobile_app/src/screens/Dashboard/view/dashboard_style.dart';
import 'package:hydrosense_mobile_app/src/screens/Login/view/login_style.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    UsersDB usersDBList = Provider.of<UsersDB>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: LoginStyles.titleContainerMargin,
                alignment: LoginStyles.titleAlign,
                child: const Text(
                  'Dashboard',
                  textAlign: TextAlign.left,
                  style: LoginStyles.title,
                ),
              ),
              //* Today's Overall Text
              Container(
                alignment: Alignment.topLeft,
                margin: DashboardStyles.overallContainerMargin ,
                child: const Text(
                  "Today's Overall",
                  textAlign: TextAlign.left,
                  style: DashboardStyles.overallText,
                ),
              ),
              //* Overall Data Boxes
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    //* Water Used
                    Container(
                      margin: DashboardStyles.cardMargin,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: DashboardStyles.cardColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(11),
                        ),
                      ),
                      child: Container(
                        padding: DashboardStyles.cardPadding,
                        child: Column(
                          children: const [
                        Text('0 litres',style: DashboardStyles.cardTextValue),
                        Text('Water used',style: DashboardStyles.cardTextTitle)
                        ],
                        ),
                      ),
                    ),
                    //* Time Spent
                    Container(
                      margin: DashboardStyles.cardMargin,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: DashboardStyles.cardColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(11),
                        ),
                      ),
                      child: Container(
                        padding: DashboardStyles.cardPadding,
                        child:Column(children: const [
                      Text('0 hr', style: DashboardStyles.cardTextValue),
                      Text('Time Spent', style: DashboardStyles.cardTextTitle)
                    ],
                      ),
                      ),
                    ),
                    //* Estimated Cost
                    Container(
                      margin: DashboardStyles.cardMargin,
                      decoration: const BoxDecoration(
                        color: DashboardStyles.cardColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(11),
                        ),
                      ),
                      width: double.infinity,
                      child: Container(
                        padding: DashboardStyles.cardPadding,
                        child:Column(children: const [
                      Text('\$00.00', style: DashboardStyles.cardTextValue),
                      Text('Estimated Cost', style: DashboardStyles.cardTextTitle)
                    ],
                      ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
