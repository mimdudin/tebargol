class Constant {
  static String apiToken =
      '?api_token=IGzCfY7PgR8IcZwDRkop4GHzQJvCLxfpNijlh7ENpA3n6kxIsKMTgY5ZGBav';
  static String dateFrom = '2018-11-02';
  static String dateTo = '2018-11-28';
  static String includes =
      '&include=localTeam, visitorTeam, league, season, round, lineup, referee, events';
 
  static String fixturesBetweenDate =
      'http://soccer.sportmonks.com/api/v2.0/fixtures/between/$dateFrom/$dateTo$apiToken$includes';
  static String venueById = 'http://soccer.sportmonks.com/api/v2.0/venues/';
  static String countryById = 'http://soccer.sportmonks.com/api/v2.0/countries/';
  static String standingById = 'http://soccer.sportmonks.com/api/v2.0/standings/season/';
  static String appId = 'ca-app-pub-4632403333879226~1472482799';
  static String bannerId = 'ca-app-pub-4632403333879226/8126545144';
  static String testBannerId = 'ca-app-pub-3940256099942544/6300978111';

}
