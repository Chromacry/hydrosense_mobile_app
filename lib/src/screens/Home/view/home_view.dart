import 'package:flutter/material.dart';
import 'package:flutter_app/src/screens/Login/view/login_style.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  
  @override
  Widget build(BuildContext context) {
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
                  'Home',
                  textAlign: TextAlign.left,
                  style: LoginStyles.title,
                ),
              ),
              Container(
                margin:  const EdgeInsets.only(top: 200),
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: const ButtonStyle(
                    enableFeedback: true,
                    fixedSize: MaterialStatePropertyAll(Size(350, 50)),
                      textStyle: MaterialStatePropertyAll(LoginStyles.buttonText),
                ),
                child: const Text('Back to Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
