import 'package:flutter/material.dart';
import 'package:flutter_app/src/screens/Login/view/login_style.dart';
import 'package:flutter_app/src/screens/Login/widgets/login_widgets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: LoginStyles.logoMargin,
                child: const Image(image: AssetImage('assets/logo/placeholder-logo.png')),
                // child: Image.network(
                //   'https://www.shutterstock.com/image-vector/circle-business-logo-company-name-600w-1922534714.jpg',
                //   width: LoginStyles.logoWidth,
                //   height: LoginStyles.logoHeight,
                //   fit: BoxFit.cover,
                // ),
              ),
              const SizedBox(height: 50,),
              Container(
                margin: LoginStyles.titleContainerMargin,
                alignment: LoginStyles.titleAlign,
                child: const Text(
                  'Login',
                  textAlign: TextAlign.left,
                  style: LoginStyles.title,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: LoginWidgets.inputTextBox(
                  textLabel: 'Username',
                  onChanged: (text) => debugPrint(text)),
              ),
              Container(
                child: LoginWidgets.inputTextBox(
                  textLabel:'Password',
                  onChanged: (text) => debugPrint(text),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 200),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Layout');
                    // print('abc');

                  },
                  style: const ButtonStyle(
                    enableFeedback: true,
                    fixedSize: MaterialStatePropertyAll(Size(350, 50)),
                    textStyle: MaterialStatePropertyAll(LoginStyles.buttonText),
                  ),
                  label: const Text('Login'),
                  icon: const Icon(Icons.login_rounded)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
