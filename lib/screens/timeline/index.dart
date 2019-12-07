import 'package:flutter/material.dart';
import 'package:flutter_freefire/utils/scale_config.dart';
import 'package:url_launcher/url_launcher.dart';


class Timeline extends StatelessWidget {
  final SizeScaleConfig scaleConfig = SizeScaleConfig();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(scaleConfig.scaleWidth(8)),
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(bottom: scaleConfig.scaleHeight(4)),
          child: Card(
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
                  SizedBox(
                    height: scaleConfig.scaleHeight(16),
                  ),
                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(scaleConfig.scaleWidth(10)),
                    child: Image.asset(
                      'assets/youtube_video_ideas.png',
                    ),
                  ),
                  SizedBox(
                    height: scaleConfig.scaleHeight(16),
                  ),
                  Row(
                    children: <Widget>[
                      Text('Youtube video link here :'),
                      SizedBox(
                        width: scaleConfig.scaleWidth(8),
                      ),
                      InkWell(
                        onTap: () async {
                          if (await canLaunch(
                              'https://www.google.com/')) {
                            await launch('https://www.google.com/');
                          }
                        },
                        child: Text(
                          'click here',
                          style: TextStyle(
                            color: Colors.blueAccent,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
