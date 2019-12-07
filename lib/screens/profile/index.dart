import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_freefire/utils/scale_config.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  SizeScaleConfig scaleConfig = SizeScaleConfig();

  File _avatar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(scaleConfig.scaleWidth(8)),
        children: <Widget>[
          SizedBox(
            height: scaleConfig.scaleHeight(60),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: scaleConfig.scaleWidth(20)),
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
                            image: (_avatar == null)
                                ? AssetImage(
                                    'assets/images/no_profile_pic.png',
                                  )
                                : FileImage(_avatar),
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
                              onTap: () {
                                _showImageOptions(context);
                              },
                              child: Container(
                                padding:
                                    EdgeInsets.all(scaleConfig.scaleWidth(6)),
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
                        'User Name',
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: scaleConfig.scaleWidth(16),
              top: scaleConfig.scaleHeight(16),
              bottom: scaleConfig.scaleHeight(16),
            ),
            child: Text(
              'About',
              style: TextStyle(
                fontSize: scaleConfig.scaleWidth(20),
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: scaleConfig.scaleWidth(16),
              top: scaleConfig.scaleHeight(8),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'Field 1',
                  style: TextStyle(
                    fontSize: scaleConfig.scaleWidth(16),
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: scaleConfig.scaleWidth(8),),
                Text(
                  'Details',
                  style: TextStyle(
                    fontSize: scaleConfig.scaleWidth(20),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showImageOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: scaleConfig.scaleWidth(8),
                  top: scaleConfig.scaleHeight(16),
                ),
                child: Text(
                  'Select Image From',
                  style: TextStyle(
                    fontSize: scaleConfig.scaleWidth(22),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: scaleConfig.scaleWidth(8),
                  top: scaleConfig.scaleHeight(16),
                  bottom: scaleConfig.scaleHeight(16),
                ),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Material(
                        child: InkWell(
                          onTap: () async {
                            File newAvatar = await ImagePicker.pickImage(
                                source: ImageSource.camera);
                            if (newAvatar != null) {
                              Navigator.pop(context);
                              setState(() {
                                _avatar = newAvatar;
                              });
                            }
                          },
                          child: Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  Icons.camera_alt,
                                  size: scaleConfig.scaleWidth(60),
                                  color: Colors.grey,
                                ),
                                Text('Camera'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Material(
                        child: InkWell(
                          onTap: () async {
                            File newAvatar = await ImagePicker.pickImage(
                                source: ImageSource.gallery);
                            if (newAvatar != null) {
                              Navigator.pop(context);
                              setState(() {
                                _avatar = newAvatar;
                              });
                            }
                          },
                          child: Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  Icons.dashboard,
                                  size: scaleConfig.scaleWidth(60),
                                  color: Colors.grey,
                                ),
                                Text('Gallery'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
