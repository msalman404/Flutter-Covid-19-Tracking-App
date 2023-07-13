import 'package:covid_19/Model/record_model.dart';
import 'package:covid_19/Services/Utilities/api_services.dart';
import 'package:covid_19/View/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({Key? key}) : super(key: key);

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final _colorList = <Color>[
    const Color(0xff4285f4),
    const Color(0xffde5246),
    const Color(0xff1aa260),
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          FutureBuilder(
              future: statesServices.fetchStatesApi(),
              builder: (context, AsyncSnapshot<RecordModel> snapshot) {
                if (!snapshot.hasData) {
                  return Expanded(
                      flex: 1,
                      child: SpinKitFadingCircle(
                        color: Colors.white,
                        size: 100,
                        controller: _controller,
                      ));
                } else {
                  return Column(
                    children: [
                      PieChart(
                        dataMap: {
                          "Total":
                              double.parse(snapshot.data!.cases.toString()),
                          "Deaths":
                              double.parse(snapshot.data!.deaths.toString()),
                          "Recovered":
                              double.parse(snapshot.data!.recovered.toString())
                        },
                        animationDuration: const Duration(milliseconds: 1200),
                        chartType: ChartType.ring,
                        legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.left),
                        chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true),
                        colorList: _colorList,
                        chartRadius: 150.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * .06),
                        child: Card(
                          child: Column(
                            children: [
                              ReusableRow(
                                  title: 'Total Cases',
                                  value: snapshot.data!.cases.toString()),
                              ReusableRow(
                                  title: 'Deaths',
                                  value: snapshot.data!.deaths.toString()),
                              ReusableRow(
                                  title: 'Recovered',
                                  value: snapshot.data!.recovered.toString()),
                              ReusableRow(
                                  title: 'Active Cases',
                                  value: snapshot.data!.active.toString()),
                              ReusableRow(
                                  title: 'Critical',
                                  value: snapshot.data!.critical.toString()),
                              ReusableRow(
                                  title: 'Today cases',
                                  value: snapshot.data!.todayCases.toString()),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CountriesListScreen()));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xff1aa260)),
                          child: const Center(
                            child: Text('Track Countries'),
                          ),
                        ),
                      )
                    ],
                  );
                }
              }),
        ]),
      )),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title, value;
  const ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          const Divider(
            thickness: 1.0,
          )
        ],
      ),
    );
  }
}
