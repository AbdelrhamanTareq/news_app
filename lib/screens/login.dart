import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/user.dart';
import 'package:news_app/providers/auth.dart';
import 'package:news_app/helpers/cache_helper.dart';
import 'package:news_app/shared/components.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  TextEditingController _confirmController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _isRegistar = false;

  bool _isVisible = false;

  bool _isLoading = false;

  void _save(email, password) {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      setState(() {
        _isLoading = true;
      });
      try {
        // User user;
        Provider.of<Auth>(context, listen: false).login(email, password);
        // CacheHelper.setToken('Token', user.token);
        // Provider.of<Auth>(context, listen: false)
        //     .saveToken('Token', user.token);
      } catch (error) {
        setState(() {
          _isLoading = true;
        });
        print(error.toString());
      }

      setState(() {});
      print('login');
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    print('1 ${_emailController.text}');
    print('1 ${_passwordController.text}');
    print('1 ${_emailController.text}');
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildText(context, 'LOGIN', 5, 30, Theme.of(context).primaryColor),
          buildText(context, 'Lets get started', 0, 16, Colors.grey),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  buildTextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'E-mail',
                    obscureText: false,
                    prefixIcon: Icon(Icons.email),
                    valdiator: (String val) {
                      if (!val.contains('@')) {
                        return 'Please provide valid email';
                      } else if (val.isEmpty) {
                        return 'Email can\'t be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  buildTextField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: 'Password',
                    obscureText: !_isVisible, //
                    prefixIcon: Icon(Icons.vpn_key),
                    suffix: IconButton(
                      icon: Icon(
                        _isVisible ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                    ),
                    valdiator: (String val) {
                      if (val.length < 6) {
                        return 'Passwoed must be at least 6 characters';
                      } else if (val.isEmpty) {
                        return 'Password can\'t be empty';
                      }
                      return null;
                    },
                  ),
                  if (_isRegistar)
                    SizedBox(
                      height: 15,
                    ),
                  if (_isRegistar)
                    buildTextField(
                      controller: _confirmController,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: 'Confirm Password',
                      prefixIcon: Icon(Icons.vpn_key),
                      obscureText: _isVisible,
                      suffix: IconButton(
                        icon: Icon(
                          _isVisible ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                      ),
                      valdiator: (String val) {
                        if (val != _passwordController.text) {
                          return 'Password not match';
                        } else
                          return null;
                      },
                    ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    color: Theme.of(context).primaryColor,
                    child: TextButton(
                      onPressed: () => _save(
                          _emailController.text, _passwordController.text),
                      child: Text(
                        (_isRegistar) ? 'Registar' : 'Login',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (_isLoading)
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_isRegistar
                        ? 'Have an account'
                        : 'Don\'t have an account?'),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _isRegistar = !_isRegistar;
                          });
                        },
                        child: Text(
                          _isRegistar ? 'LOGIN' : 'REGISTER',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  TextFormField buildTextField({
    @required TextEditingController controller,
    @required TextInputType keyboardType,
    @required String hintText,
    @required Icon prefixIcon,
    @required Function valdiator,
    Widget suffix,
    bool obscureText,
  }) {
    return TextFormField(
      validator: valdiator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffix,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
