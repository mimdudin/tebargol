import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import '../models/fixtures/fixtures.dart';
import '../models/fixtures/formations.dart';
import '../models/fixtures/standings.dart';
import '../models/fixtures/scores.dart';
import '../models/fixtures/time.dart';
import '../models/fixtures/coaches.dart';
import '../models/fixtures/home_team.dart';
import '../models/fixtures/away_team.dart';
import '../models/fixtures/league.dart';
import '../models/fixtures/season.dart';
import '../models/fixtures/round.dart';
import '../models/fixtures/venue.dart';
import '../models/fixtures/country.dart';
import '../models/fixtures/events.dart';
import '../models/fixtures/goals.dart';
import '../models/fixtures/cards.dart';
import '../models/fixtures/standingteams.dart';

import '../utils/constant.dart';

class FixtureModel extends Model {
  List<Fixture> _fixtureList = [];
  List<Fixture> get fixtureList => _fixtureList;

  List<Events> _eventList = [];
  List<Events> get eventList => _eventList;

  List<StandingTeams> _standingTeams = [];
  List<StandingTeams> get standingTeams => _standingTeams;

  bool _isLoadingFixture = false;
  bool get isLoadingFixture => _isLoadingFixture;

  Venue _venue = new Venue();
  Venue get venue => _venue;

  Country _country = new Country();
  Country get country => _country;

  bool _isLoadingVenue = false;
  bool get isLoadingVenue => _isLoadingVenue;

  addToFixtureList(Fixture fixture) {
    _fixtureList.add(fixture);
  }

  addToEventList(Events events) {
    _eventList.add(events);
  }

  addToStandingList(StandingTeams standings) {
    _standingTeams.add(standings);
  }

  int getFixturesCount() {
    return _fixtureList.length;
  }

  int getEventsCount() {
    return _eventList.length;
  }

  int getStandingsCount() {
    return _standingTeams.length;
  }

  Future<List<Fixture>> getFixtures() async {
    _isLoadingFixture = true;
    notifyListeners();

    var response = await http.get(Constant.fixturesBetweenDate);
    var responseBody = json.decode(response.body)['data'];

    for (var json in responseBody) {
      print(json);

      for (var jsonGoals in json['events']['data']) {
        print(jsonGoals);
        var events = new Events.fromJson(jsonGoals);
        addToEventList(events);
      }

      var fixture = new Fixture(
          id: json['id'],
          stageId: json['stage_id'],
          groupId: json['group_id'],
          aggregateId: json['aggregate_id'],
          venueId: json['venue_id'],
          refereeId: json['referee_id'],
          formations: Formations.fromJson(json['formations']),
          scores: Scores.fromJson(json['scores']),
          time: Time.fromJson(json['time']),
          coaches: Coaches.fromJson(json['coaches']),
          standings: Standings.fromJson(json['standings']),
          leg: json['leg'],
          deleted: json['deleted'],
          homeTeam: HomeTeam.fromJson(json['localTeam']['data']),
          awayTeam: AwayTeam.fromJson(json['visitorTeam']['data']),
          league: League.fromJson(json['league']['data']),
          season: Season.fromJson(json['season']['data']),
          round: Round.fromJson(json['round']['data']),
          events: _eventList);

      addToFixtureList(fixture);
    }

    _isLoadingFixture = false;
    notifyListeners();

    return _fixtureList;
  }

  Future<Venue> fetchVenue(String venueId) async {
    _isLoadingVenue = true;
    notifyListeners();

    final response =
        await http.get(Constant.venueById + venueId + Constant.apiToken);

    if (response.statusCode == 200) {
      Map result = json.decode(response.body)['data'];
      print(result);
      _venue = Venue(
          id: result['id'],
          name: result['name'],
          address: result['address'],
          capacity: result['capacity'],
          city: result['city'],
          imagePath: result['image_path']);

      return _venue;

      // return Venue.fromJson(result);
      //  fetchVenue(fixture.venueId.toString());
    } else {
      throw Exception('failed to load coach');
    }
  }

  Future<Country> fetchCountry(String countryId) async {
    final response =
        await http.get(Constant.countryById + countryId + Constant.apiToken);

    if (response.statusCode == 200) {
      Map result = json.decode(response.body)['data'];
      print(result);
      _country = Country(id: result['id'], name: result['name']);

      return _country;

      // return Venue.fromJson(result);
      //  fetchVenue(fixture.venueId.toString());
    } else {
      throw Exception('failed to load country');
    }
  }

  Future<List<StandingTeams>> fetchStandingTeams(String seasonId) async {
    var response =
        await http.get(Constant.standingById + seasonId + Constant.apiToken);
    var responseBody = json.decode(response.body)['data'];

    final List<StandingTeams> listStanding = [];
    for (var standingJson in responseBody) {
      print(standingJson);

      for (var data in standingJson['standings']['data']) {
        var standings = StandingTeams.fromJson(data);
        print(standings);
        
        listStanding.add(standings);
      }
    }
    
    _standingTeams = listStanding;
    _isLoadingVenue = false;
    notifyListeners();

    return _standingTeams;
  }
}
