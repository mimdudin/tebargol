import 'package:flutter/material.dart';
import 'dart:async';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_admob/firebase_admob.dart';

import '../../models/fixtures/fixtures.dart';
import '../../models/fixtures/standingteams.dart';
import '../../utils/constant.dart';
import '../../scoped_models/fixture_models.dart';

import './detail_match_tab.dart';
import './media_match_tab.dart';
import './lineup_match_tab.dart';
import './klasemen_match_tab.dart';

class HomeTabDetail extends StatefulWidget {
  final Fixture fixture;
  final FixtureModel model;

  HomeTabDetail({this.fixture, this.model});

  @override
  _HomeTabDetailState createState() => _HomeTabDetailState();
}

class _HomeTabDetailState extends State<HomeTabDetail>
    with SingleTickerProviderStateMixin {
  TabController controller;
  // BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    loadData();
    print('initstate called');
    controller = TabController(vsync: this, length: 4);
    // FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    // bannerAd = buildBanner()..load();
  }

  @override
  void dispose() {
    // bannerAd?.dispose();
    controller.dispose();
    print('dispose called');
    super.dispose();
  }

  static final targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    childDirected: false,
    testDevices: <String>[], // Android emulators are considered test devices
  );

  BannerAd buildBanner() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.smartBanner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("bannerAd event is $event");
        });
  }

  Future loadData() async {
    await Future.wait([
      widget.model.fetchVenue(widget.fixture.venueId.toString()),
      widget.model.fetchCountry(widget.fixture.league.countryId.toString()),
      widget.model.fetchStandingTeams(widget.fixture.season.id.toString())
    ]);
  }

  @override
  Widget build(BuildContext context) {
    // bannerAd.show();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Info Pertandingan'),
          bottom: TabBar(
            controller: controller,
            tabs: <Widget>[
              Tab(text: 'RINCIAN'),
              Tab(text: 'MEDIA'),
              Tab(text: 'LINEUP'),
              Tab(text: 'KLASEMEN'),
            ],
          ),
        ),
        body: ScopedModelDescendant<FixtureModel>(
            builder: (context, child, model) {
          return TabBarView(
            controller: controller,
            children: <Widget>[
              DetailMatchTab(widget.fixture),
              MediaMatchTab(),
              LineupMatchTab(),
              KlasemenMatchTab()
            ],
          );
        }));
  }
}
