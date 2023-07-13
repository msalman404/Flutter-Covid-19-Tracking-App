import 'package:covid_19/View/country_details.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/Services/Utilities/api_services.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  StatesServices statesServices = StatesServices();
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Search Countries',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0))),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            Expanded(
                child: FutureBuilder(
                    future: statesServices.fetchContriesListApi(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (!snapshot.hasData) {
                        return ListView.builder(
                            itemCount: 9,
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                  baseColor: Colors.grey.shade700,
                                  highlightColor: Colors.grey.shade100,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Container(
                                          height: 10,
                                          width: 80,
                                          color: Colors.white,
                                        ),
                                        subtitle: Container(
                                          height: 10,
                                          width: 80,
                                          color: Colors.white,
                                        ),
                                        leading: Container(
                                          height: 50,
                                          width: 50,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ));
                            });
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              String name = snapshot.data![index]['country'];
                              if (_searchController.text.isEmpty) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CountryDetailScreen(
                                                      active:
                                                          snapshot.data![index]
                                                              ['active'],
                                                      critical:
                                                          snapshot.data![index]
                                                              ['critical'],
                                                      image: snapshot
                                                                  .data![index]
                                                              ['countryInfo']
                                                          ['flag'],
                                                      name:
                                                          snapshot.data![index]
                                                              ['country'],
                                                      totalCases:
                                                          snapshot.data![index]
                                                              ['cases'],
                                                      totalDeaths:
                                                          snapshot.data![index]
                                                              ['deaths'],
                                                      totalRecovered:
                                                          snapshot.data![index]
                                                              ['recovered'],
                                                    )));
                                      },
                                      child: ListTile(
                                        title: Text(
                                            snapshot.data![index]['country']),
                                        subtitle: Text(snapshot.data![index]
                                                ['cases']
                                            .toString()),
                                        leading: Image(
                                            height: 50,
                                            width: 50,
                                            image: NetworkImage(
                                                snapshot.data![index]
                                                    ['countryInfo']['flag'])),
                                      ),
                                    )
                                  ],
                                );
                              } else if (name.toLowerCase().contains(
                                  _searchController.text.toLowerCase())) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CountryDetailScreen(
                                                      active:
                                                          snapshot.data![index]
                                                              ['active'],
                                                      critical:
                                                          snapshot.data![index]
                                                              ['critical'],
                                                      image: snapshot
                                                                  .data![index]
                                                              ['countryInfo']
                                                          ['flag'],
                                                      name:
                                                          snapshot.data![index]
                                                              ['country'],
                                                      totalCases:
                                                          snapshot.data![index]
                                                              ['cases'],
                                                      totalDeaths:
                                                          snapshot.data![index]
                                                              ['deaths'],
                                                      totalRecovered:
                                                          snapshot.data![index]
                                                              ['recovered'],
                                                    )));
                                      },
                                      child: ListTile(
                                        title: Text(
                                            snapshot.data![index]['country']),
                                        subtitle: Text(snapshot.data![index]
                                                ['cases']
                                            .toString()),
                                        leading: Image(
                                            height: 50,
                                            width: 50,
                                            image: NetworkImage(
                                                snapshot.data![index]
                                                    ['countryInfo']['flag'])),
                                      ),
                                    )
                                  ],
                                );
                              } else {
                                return Container();
                              }
                            });
                      }
                    }))
          ],
        ),
      )),
    );
  }
}
