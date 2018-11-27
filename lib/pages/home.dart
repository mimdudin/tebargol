import 'package:flutter/material.dart';
import 'dart:async';
import 'package:scoped_model/scoped_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './home_fixture_list.dart';
import '../scoped_models/fixture_models.dart';

class Home extends StatefulWidget {
  // final List<FixtureList> fixtures;
  // final Function fetchProducts;

  final FixtureModel model;
  Home(this.model);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // widget.fetchProducts();
    super.initState();
    loadData();
  }

  Future loadData() async {
    await widget.model.getFixtures();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Tebar Gol'),
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.solidBell),
              onPressed: () {},
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  accountName: Text('Muhammad Imanudin'),
                  accountEmail: Text('mimdudin@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Text('M'),
                  ),
                  onDetailsPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '/profile');
                  }),
              ListTile(
                  leading: Icon(FontAwesomeIcons.chartLine),
                  title: Text('Tebakan Saya'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '/tebakansaya');
                  }),
              ListTile(
                  leading: Icon(Icons.loyalty),
                  title: Text('Tukar PoinGol'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '/tukarpoin');
                  }),
              ListTile(
                  leading: Icon(Icons.verified_user),
                  title: Text('Premium Account'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '/premiumaccount');
                  }),
              Divider(),
              ListTile(
                  leading: Icon(FontAwesomeIcons.fontAwesomeFlag),
                  title: Text('Peraturan'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '/peraturan');
                  }),
              ListTile(
                  leading: Icon(FontAwesomeIcons.bullhorn),
                  title: Text('Get Free 30 Point!'),
                  onTap: () {
                    Navigator.of(context).pop();
                    // Navigator.pushNamed(context, '');
                  }),
              ListTile(
                  leading: Icon(FontAwesomeIcons.infoCircle),
                  title: Text('Hubungi'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '/hubungi');
                  }),
              ListTile(
                  leading: Icon(FontAwesomeIcons.signOutAlt),
                  title: Text('Logout'),
                  onTap: () {
                    Navigator.of(context).pop();
                    // Navigator.pushNamed(context, '');
                  }),
            ],
          ),
        ),
        body: HomeFixtureList(),
        );
  }
}
