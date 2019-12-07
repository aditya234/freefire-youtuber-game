import 'package:flutter/material.dart';
import 'package:flutter_freefire/bloc/home_bloc.dart';
import 'package:flutter_freefire/screens/profile/index.dart';
import 'package:flutter_freefire/screens/timeline/index.dart';
import 'package:flutter_freefire/screens/youtubers/index.dart';
import 'package:flutter_freefire/utils/scale_config.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SizeScaleConfig scaleConfig = SizeScaleConfig();
  HomeBloc homeBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homeBloc = Provider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.only(
          top: scaleConfig.scaleHeight((homeBloc.currentIndex != 2) ? 40 : 0),
        ),
        child: (homeBloc.currentIndex == 0)
            ? Timeline()
            : (homeBloc.currentIndex == 1) ? Youtubers() : Profile(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: homeBloc.currentIndex,
        onTap: (int tapIndex) {
          homeBloc.changeIndex(tapIndex);
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.list),
            title: new Text('Youtubers'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          )
        ],
      ),
    );
  }
}
