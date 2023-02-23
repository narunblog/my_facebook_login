import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_twitter_login/loginController.dart';
import 'package:my_twitter_login/usersModel.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginPageUI() {
    return Consumer<LoginController>(builder: (context, model, child) {
      if (model.usersDetails != null) {
        return Center(
          child: alreadyLoggedInScreen(model),
        );
      } else {
        return notLoggedInScreen();
      }
    });
  }

  alreadyLoggedInScreen(LoginController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(model.usersDetails!.photoURL ?? '').image,
          radius: 100,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              model.usersDetails!.displayName ?? '',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.email_outlined,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              model.usersDetails!.email ?? '',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        ActionChip(
          avatar: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
          label: Padding(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          onPressed: () {
            Provider.of<LoginController>(context, listen: false)
                .allwUserToSignOut();
          },
        )
      ],
    );
  }

  notLoggedInScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: Image.asset('assets/facebook.png'),
          ),
          GestureDetector(
            child: Image.asset(
              'assets/fb.png',
              width: 240,
            ),
            onTap: () {
              Provider.of<LoginController>(context, listen: false)
                  .allowUserToSignInWithFB();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: LoginPageUI(),
    );
  }
}
