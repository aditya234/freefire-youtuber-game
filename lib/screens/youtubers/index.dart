import 'package:flutter/material.dart';
import 'package:flutter_freefire/main.dart';
import 'package:flutter_freefire/screens/youtuber_details/index.dart';
import 'package:flutter_freefire/utils/scale_config.dart';

class Youtubers extends StatelessWidget {
  final SizeScaleConfig scaleConfig = SizeScaleConfig();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(scaleConfig.scaleWidth(8)),
      itemCount: 10,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: scaleConfig.scaleHeight(4)),
        child: Card(
          child: Material(
            child: InkWell(
              onTap: (){
                navigatorKey.currentState.push(
                  MaterialPageRoute(
                    builder: (context) => YoutuberDetails(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(scaleConfig.scaleWidth(16)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: scaleConfig.scaleHeight(15.0),
                          backgroundColor: Colors.red[200],
                        ),
                        SizedBox(
                          width: scaleConfig.scaleWidth(16.0),
                        ),
                        Text(
                          'Youtuber Name',
                          style: TextStyle(
                            fontSize: scaleConfig.scaleWidth(18),
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: scaleConfig.scaleHeight(16),
                    ),
                    Text(
                      'Please checkout my latest video, its already trending on youtube.... \n\nDo like and subscribe',
                      style: TextStyle(
                        fontSize: scaleConfig.scaleWidth(18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
