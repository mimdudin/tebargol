import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tebargol/utils/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/match_tab/home_tab_detail.dart';
import '../scoped_models/fixture_models.dart';
import '../widgets/fixture_list_item.dart';


class HomeFixtureList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<FixtureModel>(
        builder: (context, child, model) {
      return Container(
        child: Column(
          children: <Widget>[
            _buildFilterMenu(context),
            Divider(
              height: 0.0,
            ),
            model.isLoadingFixture
                ? _buildCircularProgress()
                : _buildListView(model, context)
          ],
        ),
      );
    });
  }

  Widget _buildCircularProgress() {
    return Center(child: CircularProgressIndicator(),
    heightFactor: 12.0);
  }

  Widget _buildListView(FixtureModel model, BuildContext context) {
    return Container(
        child: model.getFixturesCount() == 0
            ? Center(child: Text('No fixtures found'), heightFactor: 25.0)
            : Expanded(
                child: ListView.builder(
                shrinkWrap: true,
                itemCount:
                    model.fixtureList == null ? 0 : model.getFixturesCount(),
                itemBuilder: (context, int i) {
                  var fixture = model.fixtureList[i];

                  return FixtureListItem(fixture: fixture);
                },
              )));
  }

  Widget _buildFilterMenu(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            child: InkWell(
              onTap: () => _onTap(context),
              child: Container(
                  margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(FontAwesomeIcons.github)),
                      Container(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Liga Premier Inggris',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 5.0, top: 2.0),
                          child: Icon(Icons.arrow_drop_down, size: 17.0))
                    ],
                  )),
            )),
        Container(
          padding: EdgeInsets.only(top: 3.0),
          child: Text(
            '4',
            style: TextStyle(fontSize: 13.0, color: Colors.grey),
          ),
        ),
        IconButton(
            iconSize: 20.0,
            icon: Icon(
              FontAwesomeIcons.calendarAlt,
              color: Colors.blue,
            ),
            onPressed: () {})
      ],
    );
  }

  void _onTap(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Tapped')));
  }
}
