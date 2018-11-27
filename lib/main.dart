import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './pages/profile.dart';
import './pages/home.dart';
import './pages/tebakan_saya.dart';
import './pages/tukar_poin.dart';
import './pages/premium_account.dart';
import './pages/peraturan.dart';
import './pages/hubungi.dart';

import './scoped_models/fixture_models.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FixtureModel model = new FixtureModel();
    return ScopedModel<FixtureModel>(
        model: model,
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.lightGreen,
          ),
          home: Home(model),
          routes: {
            '/profile': (BuildContext context) => Profile(),
            '/tebakansaya': (BuildContext context) => TebakanSaya(),
            '/tukarpoin': (BuildContext context) => TukarPoin(),
            '/premiumaccount': (BuildContext context) => PremiumAccount(),
            '/peraturan': (BuildContext context) => Peraturan(),
            '/hubungi': (BuildContext context) => Hubungi()
          },
        ));
  }
}
