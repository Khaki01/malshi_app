import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malshi_app/responsive/mobile_single_layout.dart';
import 'package:malshi_app/sliders/weather_slider.dart';
import 'package:malshi_app/utils/colors.dart';
import 'package:malshi_app/utils/global_variables.dart';
import 'package:malshi_app/utils/text_styles.dart';
import 'package:malshi_app/utils/utils.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    List<Widget> swipe_widgets = [
      WeatherSlider(),
      Text("statistics"),
      Text('events, notifications'),
      Text('product placements')
    ];

    void navigatePage(int index) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const LifeStockListLayout(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: const Text("MALSHI"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: Utils(context).screenSize.height * 0.33,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: swipe_widgets[index],
                );
              },
              itemCount: 4,
              pagination: SwiperPagination(),
              control: SwiperControl(),
            ),
          ),
          Expanded(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  navigatePage(1);
                                },
                                iconSize:
                                    MediaQuery.of(context).size.width * 0.2,
                                icon: const Icon(
                                  Icons.menu,
                                  color: primaryColor,
                                ),
                              ),
                              Text(
                                "Livestock list",
                                style: f16PB,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                iconSize:
                                    MediaQuery.of(context).size.width * 0.2,
                                icon: const Icon(
                                  Icons.edit_square,
                                  color: primaryColor,
                                ),
                              ),
                              Text(
                                "Livestock inventory",
                                style: f16PB,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                iconSize:
                                    MediaQuery.of(context).size.width * 0.2,
                                icon: const Icon(
                                  Icons.equalizer,
                                  color: primaryColor,
                                ),
                              ),
                              Text(
                                "Analytics",
                                style: f16PB,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                iconSize:
                                    MediaQuery.of(context).size.width * 0.2,
                                icon: const Icon(
                                  Icons.attach_money,
                                  color: primaryColor,
                                ),
                              ),
                              Text(
                                "Finances",
                                style: f16PB,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                iconSize:
                                    MediaQuery.of(context).size.width * 0.2,
                                icon: const Icon(
                                  Icons.shield,
                                  color: primaryColor,
                                ),
                              ),
                              Text(
                                "Events",
                                style: f16PB,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                iconSize:
                                    MediaQuery.of(context).size.width * 0.2,
                                icon: const Icon(
                                  Icons.build,
                                  color: primaryColor,
                                ),
                              ),
                              Text(
                                "Setup",
                                style: f16PB,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
