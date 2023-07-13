class RecordModel {
  final int? updated;
  final int? cases;
  final int? todayCases;
  final int? deaths;
  final int? todayDeaths;
  final int? recovered;
  final int? todayRecovered;
  final int? active;
  final int? critical;
  final int? casesPerOneMillion;
  final double? deathsPerOneMillion;
  final int? tests;
  final double? testsPerOneMillion;
  final int? population;
  final int? oneCasePerPeople;
  final int? oneDeathPerPeople;
  final int? oneTestPerPeople;
  final double? activePerOneMillion;
  final double? recoveredPerOneMillion;
  final double? criticalPerOneMillion;
  final int? affectedCountries;

  RecordModel({
    this.updated,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.activePerOneMillion,
    this.recoveredPerOneMillion,
    this.criticalPerOneMillion,
    this.affectedCountries,
  });

  RecordModel.fromJson(Map<String, dynamic> json)
      : updated = json['updated'] as int?,
        cases = json['cases'] as int?,
        todayCases = json['todayCases'] as int?,
        deaths = json['deaths'] as int?,
        todayDeaths = json['todayDeaths'] as int?,
        recovered = json['recovered'] as int?,
        todayRecovered = json['todayRecovered'] as int?,
        active = json['active'] as int?,
        critical = json['critical'] as int?,
        casesPerOneMillion = json['casesPerOneMillion'] as int?,
        deathsPerOneMillion = json['deathsPerOneMillion'] as double?,
        tests = json['tests'] as int?,
        testsPerOneMillion = json['testsPerOneMillion'] as double?,
        population = json['population'] as int?,
        oneCasePerPeople = json['oneCasePerPeople'] as int?,
        oneDeathPerPeople = json['oneDeathPerPeople'] as int?,
        oneTestPerPeople = json['oneTestPerPeople'] as int?,
        activePerOneMillion = json['activePerOneMillion'] as double?,
        recoveredPerOneMillion = json['recoveredPerOneMillion'] as double?,
        criticalPerOneMillion = json['criticalPerOneMillion'] as double?,
        affectedCountries = json['affectedCountries'] as int?;

  Map<String, dynamic> toJson() => {
        'updated': updated,
        'cases': cases,
        'todayCases': todayCases,
        'deaths': deaths,
        'todayDeaths': todayDeaths,
        'recovered': recovered,
        'todayRecovered': todayRecovered,
        'active': active,
        'critical': critical,
        'casesPerOneMillion': casesPerOneMillion,
        'deathsPerOneMillion': deathsPerOneMillion,
        'tests': tests,
        'testsPerOneMillion': testsPerOneMillion,
        'population': population,
        'oneCasePerPeople': oneCasePerPeople,
        'oneDeathPerPeople': oneDeathPerPeople,
        'oneTestPerPeople': oneTestPerPeople,
        'activePerOneMillion': activePerOneMillion,
        'recoveredPerOneMillion': recoveredPerOneMillion,
        'criticalPerOneMillion': criticalPerOneMillion,
        'affectedCountries': affectedCountries
      };
}
