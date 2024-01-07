import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malshi_app/models/weather.dart';
import 'package:malshi_app/resources/openweather_methods.dart';
import 'package:malshi_app/utils/text_styles.dart';

class WeatherSlider extends StatefulWidget {
  const WeatherSlider({super.key});

  @override
  State<WeatherSlider> createState() => _WeatherSliderState();
}

class _WeatherSliderState extends State<WeatherSlider> {
  Future<WeatherModel> getData(bool isCurrentCity, String cityName) async {
    return await OpenWeatherAPICall().callWeatherAPi(isCurrentCity, cityName);
  }

  // late final Future _myData;
  TextEditingController textController = TextEditingController(text: "");
  Future<WeatherModel>? _myData;

  @override
  void initState() {
    setState(() {
      _myData = getData(true, "");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _myData!,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error.toString()} occured',
                  style: TextStyle(color: Colors.black),
                ),
              );
            } else if (snapshot.hasData) {
              final data = snapshot.data as WeatherModel;
              return Container(
                child: SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              data.city,
                              style: f24Rblackbold,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              data.desc,
                              style: f16PB,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "${data.temp}˚C",
                              style: f42Rblackbold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text(
                "${snapshot.connectionState} occured",
                style: TextStyle(color: Colors.black),
              ),
            );
          }

          return Center(
            child: Text("Server timed out!"),
          );
        });
  }
}
