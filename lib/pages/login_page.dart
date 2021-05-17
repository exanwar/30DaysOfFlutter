import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mtechviral/utils/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  showSnackBar() {
    final snackBar = SnackBar(
      content: Text('Yay! A SnackBar!'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: (MediaQuery.of(context).platformBrightness == Brightness.dark)
          ? null
          // ? SystemUiOverlayStyle(
          //     statusBarBrightness: Brightness.dark,
          //     statusBarIconBrightness: Brightness.light)
          : SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        // backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/undraw_hey_email_liaa.svg',
                  height: 300,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Welcome $name',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter username',
                            labelText: 'Username',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Username can't be empty";
                              // return showSnackBar();
                            }

                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter password',
                            labelText: 'Password',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Password can't be empty";
                            } else if (value.length < 6) {
                              return "Password length should be 6";
                              // return showSnackBar();
                            }

                            return null;
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Material(
                  color: Colors.deepPurple,
                  borderRadius:
                      BorderRadius.all(Radius.circular(changeButton ? 50 : 8)),
                  child: InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 50,
                      width: changeButton ? 50 : 150,
                      child: changeButton
                          ? Icon(Icons.done, color: Colors.white)
                          : Text('Login',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
