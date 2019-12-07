import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_freefire/main.dart';
import 'package:flutter_freefire/screens/home/index.dart';
import 'package:flutter_freefire/utils/scale_config.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeVerification extends StatefulWidget {
  final String phoneNumber;

  PinCodeVerification({@required this.phoneNumber});

  @override
  _PinCodeVerificationState createState() => _PinCodeVerificationState();
}

class _PinCodeVerificationState extends State<PinCodeVerification> {
  var onTapRecognizer;
  SizeScaleConfig scaleConfig = SizeScaleConfig();

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.red[800],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              SizedBox(height: scaleConfig.scaleHeight(30)),
              Image.asset(
                'assets/images/verify.png',
                height: SizeScaleConfig.screenHeight / 3,
                fit: BoxFit.fitHeight,
              ),
              SizedBox(height: scaleConfig.scaleHeight(8)),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: scaleConfig.scaleHeight(8.0)),
                child: Text(
                  'Phone Number Verification',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: scaleConfig.scaleWidth(22)),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: scaleConfig.scaleWidth(30.0),
                    vertical: scaleConfig.scaleHeight(8)),
                child: RichText(
                  text: TextSpan(
                      text: "Enter the code sent to ",
                      children: [
                        TextSpan(
                            text: widget.phoneNumber,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: scaleConfig.scaleWidth(15))),
                      ],
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: scaleConfig.scaleWidth(15))),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: scaleConfig.scaleHeight(20),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: scaleConfig.scaleHeight(8.0),
                      horizontal: scaleConfig.scaleWidth(30)),
                  child: PinCodeTextField(
                    length: 6,
                    obsecureText: false,
                    animationType: AnimationType.fade,
                    shape: PinCodeFieldShape.circle,
                    animationDuration: Duration(milliseconds: 300),
                    borderRadius:
                        BorderRadius.circular(scaleConfig.scaleWidth(5)),
                    fieldHeight: scaleConfig.scaleHeight(50),
                    fieldWidth: scaleConfig.scaleWidth(40),
                    onChanged: (value) {
                      setState(() {
                        currentText = value;
                      });
                    },
                  )),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: scaleConfig.scaleWidth(30.0)),
                // error showing widget
                child: Text(
                  hasError ? "*Invalid verification code. Try again!" : "",
                  style: TextStyle(
                      color: Colors.red.shade300,
                      fontSize: scaleConfig.scaleWidth(15)),
                ),
              ),
              SizedBox(
                height: scaleConfig.scaleHeight(20),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Didn't receive the code? ",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: scaleConfig.scaleWidth(15)),
                  children: [
                    TextSpan(
                      text: " RESEND",
                      recognizer: onTapRecognizer,
                      style: TextStyle(
                        color: Colors.red[800],
                        fontWeight: FontWeight.bold,
                        fontSize: scaleConfig.scaleWidth(16),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: scaleConfig.scaleHeight(14),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: scaleConfig.scaleHeight(16.0),
                    horizontal: scaleConfig.scaleWidth(30)),
                child: ButtonTheme(
                  height: scaleConfig.scaleHeight(50),
                  child: FlatButton(
                    onPressed: () {
                      //Validating
                      if (currentText.length != 6) {
                        setState(() {
                          hasError = true;
                        });
                      } else {
                        navigatorKey.currentState.push(
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
//                        setState(() {
//                          hasError = false;
//                          scaffoldKey.currentState.showSnackBar(SnackBar(
//                            content: Text("Verified!!"),
//                            duration: Duration(seconds: 2),
//                          ));
//                        });
                      }
                    },
                    child: Center(
                        child: Text(
                      "VERIFY",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: scaleConfig.scaleWidth(18),
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.red.shade800,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.red.shade600,
                          offset: Offset(1, -2),
                          blurRadius: scaleConfig.scaleWidth(5)),
                      BoxShadow(
                          color: Colors.red.shade400,
                          offset: Offset(-1, 2),
                          blurRadius: scaleConfig.scaleWidth(5))
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
