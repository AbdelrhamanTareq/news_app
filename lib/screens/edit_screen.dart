import 'package:flutter/material.dart';
import 'package:news_app/helpers/cache_helper.dart';
import 'package:news_app/providers/auth.dart';
import 'package:news_app/shared/components.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _usernameController = TextEditingController();
  var _phoneController = TextEditingController();
  var _imageController = TextEditingController();
  final token = CacheHelper.getToken('Token');

  @override
  Widget build(BuildContext context) {
    var _user = Provider.of<Auth>(context).user;
    var _provider = Provider.of<Auth>(context);
    _usernameController.text = _user.username;
    _phoneController.text = _user.phone;
    _imageController.text = _user.imageUrl;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Edit',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: (_user == null)
          ? CircularProgressIndicator()
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        buildTextField(
                          context: context,
                          controller: _usernameController,
                          keyboardType: TextInputType.name,
                          hintText: 'Username',
                          prefixIcon: Icon(
                            Icons.supervised_user_circle,
                            color: Theme.of(context).primaryColor,
                          ),
                          valdiator: (String val) {
                            if (val.isEmpty) {
                              return 'Username can\'t be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        buildTextField(
                          context: context,
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          hintText: 'Phone',
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Theme.of(context).primaryColor,
                          ),
                          valdiator: (String val) {
                            if (val.isEmpty) {
                              return 'Phone can\'t be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        buildTextField(
                          context: context,
                          controller: _imageController,
                          keyboardType: TextInputType.url,
                          hintText: 'Image url',
                          prefixIcon: Icon(
                            Icons.image,
                            color: Theme.of(context).primaryColor,
                          ),
                          valdiator: (String val) {
                            if (val.isEmpty) {
                              return 'Image url can\'t be empty';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    color: Theme.of(context).primaryColor,
                    child: TextButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          _provider.updateUserData(
                            // token,
                            _usernameController.text,
                            _phoneController.text.toString(),
                            _imageController.text,
                          );
                          await _provider
                              .getUserData(CacheHelper.getToken('Token'));
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
