import 'package:flutter/material.dart';
import 'package:flutter_freefire/utils/scale_config.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutuberDetails extends StatelessWidget {
  SizeScaleConfig scaleConfig = SizeScaleConfig();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.red[800],
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(scaleConfig.scaleWidth(8)),
        itemCount: 12,
        itemBuilder: (context, index) => (index == 0)
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: scaleConfig.scaleWidth(20)),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: (SizeScaleConfig.screenWidth / 3) -
                                scaleConfig.scaleWidth(32),
                            width: (SizeScaleConfig.screenWidth / 3) -
                                scaleConfig.scaleWidth(32),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[200],
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/no_profile_pic.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  scaleConfig.scaleWidth(100)),
                              child: Material(
                                color: Colors.red[800],
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(
                                        scaleConfig.scaleWidth(6)),
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: scaleConfig.scaleWidth(24),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Youtuber Name',
                            style: TextStyle(
//                              color: Colors.grey[700],
                              fontSize: scaleConfig.scaleWidth(28),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: scaleConfig.scaleHeight(16),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: scaleConfig.scaleWidth(8.0)),
                            child: Text(
                              'Please checkout my latest video, its already trending on youtube.... \n\nDo like and subscribe',
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : (index == 1)
                ? Padding(
                    padding: EdgeInsets.only(
                      left: scaleConfig.scaleWidth(8),
                      top: scaleConfig.scaleHeight(16),
                    ),
                    child: Text(
                      'Recent Posts',
                      style: TextStyle(
                        fontSize: scaleConfig.scaleWidth(20),
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : Padding(
                    padding:
                        EdgeInsets.only(bottom: scaleConfig.scaleHeight(4)),
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
                            SizedBox(
                              height: scaleConfig.scaleHeight(16),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  scaleConfig.scaleWidth(10)),
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
                  ),
      ),
    );
  }
}
