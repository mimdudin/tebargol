import './formations.dart';
import './scores.dart';
import './time.dart';
import './coaches.dart';
import './standings.dart';
import './home_team.dart';
import './away_team.dart';
import './league.dart';
import './season.dart';
import './round.dart';
import './goals.dart';
import './events.dart';
import './cards.dart';

class Fixture {
  final int id;
  final int stageId;
  final int groupId;
  final int aggregateId;
  final int venueId;
  final int refereeId;
  final Formations formations;
  final Scores scores;
  final Time time;
  final Coaches coaches;
  final Standings standings;
  final String leg;
  final bool deleted;
  final HomeTeam homeTeam;
  final AwayTeam awayTeam;
  final League league;
  final Season season;
  final Round round;
  final List<Events> events;


  Fixture(
      {this.id,
      this.stageId,
      this.groupId,
      this.aggregateId,
      this.venueId,
      this.refereeId,
      this.formations,
      this.scores,
      this.time,
      this.coaches,
      this.standings,
      this.leg,
      this.deleted,
      this.homeTeam,
      this.awayTeam,
      this.league,
      this.season,
      this.round,
      this.events
      });

        //  Fixture.fromJson(Map<String, dynamic> json) : 
        // id = json['id'],
        // stageId = json['stage_id'],
        // groupId = json['group_id'],
        // aggregateId = json['aggregate_id'],
        // venueId = json['venue_id'],
        // refereeId = json['referee_id'],
        // formations: Formations.fromJson(json['formations']),
        // scores: Scores.fromJson(json['scores']),
        // time: Time.fromJson(json['time']),
        // coaches: Coaches.fromJson(json['coaches']),
        // standings: Standings.fromJson(json['standings']),
        // leg = json['leg'],
        // deleted = json['deleted'];
        // homeTeam: HomeTeam.fromJson(json['localTeam']['data']),
        // awayTeam: AwayTeam.fromJson(json['visitorTeam']['data']),
        // league: League.fromJson(json['league']['data']),
        // season: Season.fromJson(json['season']['data']),
        // round: Round.fromJson(json['round']['data'])
  }

  // factory Fixture.fromJson(Map<String, dynamic> json) {
  //   return Fixture(
  //       id: json['id'],
  //       stageId: json['stage_id'],
  //       groupId: json['group_id'],
  //       aggregateId: json['aggregate_id'],
  //       venueId: json['venue_id'],
  //       refereeId: json['referee_id'],
  //       formations: Formations.fromJson(json['formations']),
  //       scores: Scores.fromJson(json['scores']),
  //       time: Time.fromJson(json['time']),
  //       coaches: Coaches.fromJson(json['coaches']),
  //       standings: Standings.fromJson(json['standings']),
  //       leg: json['leg'],
  //       deleted: json['deleted'],
  //       homeTeam: HomeTeam.fromJson(json['localTeam']['data']),
  //       awayTeam: AwayTeam.fromJson(json['visitorTeam']['data']),
  //       league: League.fromJson(json['league']['data']),
  //       season: Season.fromJson(json['season']['data']),
  //       round: Round.fromJson(json['round']['data']));
  // }

  // Fixture.fromJson(Map<String, dynamic> json) : 
  //       id = json['id'],
  //       stageId = json['stage_id'],
  //       groupId = json['group_id'],
  //       aggregateId = json['aggregate_id'],
  //       venueId = json['venue_id'],
  //       refereeId = json['referee_id'],
        // formations = Formations.fromJson(json['formations']),
        // scores = Scores.fromJson(json['scores']),
        // time = Time.fromJson(json['time']),
        // coaches = Coaches.fromJson(json['coaches']),
        // standings = Standings.fromJson(json['standings']),
        // leg = json['leg'],
        // deleted = json['deleted'];
        // homeTeam = HomeTeam.fromJson(json['localTeam']['data']),
        // awayTeam = AwayTeam.fromJson(json['visitorTeam']['data']),
        // league = League.fromJson(json['league']['data']),
        // season = Season.fromJson(json['season']['data']),
        // round = Round.fromJson(json['round']['data']);


// class FixturesAPI {
//   final List<Fixture> dataList;

//   FixturesAPI({this.dataList});

//   factory FixturesAPI.fromJson(Map<String, dynamic> json) {
//     return FixturesAPI(
//         dataList: (json['data'] as List)
//             .map((data) => Fixture.fromJson(data))
//             .toList());
//   }
// }
