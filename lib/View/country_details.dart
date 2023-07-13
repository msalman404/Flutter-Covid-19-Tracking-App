import 'package:covid_19/View/world_states.dart';
import 'package:flutter/material.dart';

class CountryDetailScreen extends StatefulWidget {
  final String name, image;
  final int totalCases, totalDeaths, totalRecovered, active, critical;
  const CountryDetailScreen({
    super.key,
    required this.active,
    required this.critical,
    required this.image,
    required this.name,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
  });

  @override
  State<CountryDetailScreen> createState() => _CountryDetailScreenState();
}

class _CountryDetailScreenState extends State<CountryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      ReusableRow(
                          title: 'TotalcCases',
                          value: widget.totalCases.toString()),
                      ReusableRow(
                          title: 'Deaths',
                          value: widget.totalDeaths.toString()),
                      ReusableRow(
                          title: 'Recovered',
                          value: widget.totalRecovered.toString()),
                      ReusableRow(
                          title: 'Active Cases',
                          value: widget.active.toString()),
                      ReusableRow(
                          title: 'Critical', value: widget.critical.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}
