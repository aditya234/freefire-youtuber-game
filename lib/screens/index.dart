import 'package:flutter/material.dart';
import 'package:flutter_freefire/screens/home/index.dart';
import 'package:flutter_freefire/utils/scale_config.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  SizeScaleConfig scaleConfig = SizeScaleConfig();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Size screenSize = MediaQuery.of(context).size;
    SizeScaleConfig.screenHeight = screenSize.height;
    SizeScaleConfig.screenWidth = screenSize.width;
    SizeScaleConfig().calculateScaleRatios();

    SizeScaleConfig.scaleFactor = MediaQuery.of(context).textScaleFactor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Material(
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(scaleConfig.scaleWidth(16)),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: scaleConfig.scaleWidth(36)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
