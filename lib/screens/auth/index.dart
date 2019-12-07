import 'package:flutter/material.dart';
import 'package:flutter_freefire/bloc/auth_bloc.dart';
import 'package:flutter_freefire/utils/scale_config.dart';
import 'package:flutter_freefire/utils/validators.dart';
import 'package:flutter_freefire/widgets/custom_input_field.dart';
import 'package:provider/provider.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  SizeScaleConfig scaleConfig = SizeScaleConfig();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Validators validators = Validators();
  bool _autoValidate = false;
  String _phoneNumber;
  AuthBloc authBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Size screenSize = MediaQuery.of(context).size;
    SizeScaleConfig.screenHeight = screenSize.height;
    SizeScaleConfig.screenWidth = screenSize.width;
    SizeScaleConfig().calculateScaleRatios();

    SizeScaleConfig.scaleFactor = MediaQuery.of(context).textScaleFactor;
    //
    authBloc = Provider.of<AuthBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
        autovalidate: _autoValidate,
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: scaleConfig.scaleWidth(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: (SizeScaleConfig.screenWidth * 2) / 3,
                  ),
                ),
              ),
              Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: CustomInputField(
                                initialValue: _phoneNumber,
                                obscureText: false,
                                hintText: "+91 - ",
                                icon: Icon(Icons.smartphone),
                                textInputType: TextInputType.text,
                                textStyle: TextStyle(color: Colors.black),
                                validateFunction: validators.validatePhoneNumber,
                                onSaved: (String pNumber) {
                                  _phoneNumber = pNumber;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: scaleConfig.scaleHeight(16),
                        ),
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(scaleConfig.scaleWidth(10)),
                          child: Material(
                            color: Colors.red[800],
                            child: InkWell(
                              onTap: _handelLogin,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: scaleConfig.scaleHeight(14)),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: scaleConfig.scaleWidth(22)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: scaleConfig.scaleHeight(32),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void _handelLogin() {
    authBloc.startLoading();
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autoValidate = true;
      authBloc.stopLoading();
    } else {
      form.save();
      print('MOBILE NUMBER - ${_phoneNumber}');
//      loginBloc.login(username: _username, password: _password);
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
