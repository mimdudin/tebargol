import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

import '../../models/fixtures/fixtures.dart';
import '../../models/fixtures/goals.dart';
import '../../models/fixtures/country.dart';
import '../../models/fixtures/venue.dart';

import '../../scoped_models/fixture_models.dart';
import '../../utils/constant.dart';

import '../../widgets/detail_match_content.dart';

class DetailMatchTab extends StatefulWidget {
  final Fixture fixture;
  
  DetailMatchTab(this.fixture);


  @override
  _DetailMatchTabState createState() => _DetailMatchTabState();
}

class _DetailMatchTabState extends State<DetailMatchTab> with AutomaticKeepAliveClientMixin<DetailMatchTab>{
  
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<FixtureModel>(builder: (context, child, model){
      return model.isLoadingVenue ? 
      _buildCircularProgress() :
      _buildDetailContent(model, widget.fixture);
    },);
  }

  Widget _buildCircularProgress(){
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildDetailContent(FixtureModel model, Fixture fixture){
    return Container(
      child: model.venue == null ?
        Center(child: Text('Nothing about fixture')) : 
        DetailMatchContent(fixture: fixture));
  }

  @override
    // TODO: implement wantKeepAlive
    bool get wantKeepAlive => true;
}