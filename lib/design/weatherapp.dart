import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weatherapp_starter_project/consts/colors.dart';
import 'package:weatherapp_starter_project/consts/images.dart';
import 'package:weatherapp_starter_project/consts/string.dart';
import 'package:weatherapp_starter_project/controllers/maincontroler.dart';
import 'package:weatherapp_starter_project/model/currentweathermodel.dart';
import 'package:weatherapp_starter_project/model/hourelyweather.dart';
// import 'package:weatherapp_starter_project/model/hourelyweather.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    var date = DateFormat("yMMMMd").format(DateTime.now());
    var theme = Theme.of(context);
    var controler = Get.put(Maincontroler());
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: "$date".text.gray700.make(),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                controler.changetheme();
              },
              icon: Icon(
                  controler.isdark.value ? Icons.light_mode : Icons.dark_mode,
                  color: theme.iconTheme.color),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: theme.iconTheme.color,
            ),
          ),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: FutureBuilder(
            future: controler.CurrentWeatherdata,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data! as CurrentWeatherapi;
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "${data.name}"
                          .text
                          .fontFamily('poppins_black')
                          .size(30)
                          .uppercase
                          .color(theme.primaryColor)
                          .letterSpacing(3)
                          .make(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/weather/${data.weather![0].icon}.png",
                            width: 80,
                            height: 80,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text:
                                  "${data.main!.temp!.toInt().toDouble()}37$degree",
                              style: TextStyle(
                                  fontFamily: "poppins",
                                  color: theme.primaryColor,
                                  fontSize: 56),
                            ),
                            TextSpan(
                              text: "${data.weather![0].main}",
                              style: TextStyle(
                                  fontFamily: "poppins_light",
                                  color: theme.primaryColor,
                                  fontSize: 14,
                                  letterSpacing: 3),
                            ),
                          ]))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton.icon(
                              onPressed: null,
                              icon: Icon(
                                Icons.expand_less_rounded,
                                color: theme.iconTheme.color,
                              ),
                              label: "${data.main!.tempMax}$degree"
                                  .text
                                  .color(theme.iconTheme.color)
                                  .make()),
                          TextButton.icon(
                              onPressed: null,
                              icon: Icon(
                                Icons.expand_less_rounded,
                                color: theme.iconTheme.color,
                              ),
                              label: "${data.main!.tempMin}$degree"
                                  .text
                                  .color(theme.iconTheme.color)
                                  .make()),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(3, (index) {
                          var iconsList = [clouds, humidly, windspeed];
                          var values = [
                            "${data.clouds!.all}%",
                            "${data.main!.humidity}%",
                            "${data.wind!.speed}km/h"
                          ];
                          return Column(
                            children: [
                              Image.asset(
                                iconsList[index],
                                width: 60,
                                height: 60,
                              )
                                  .box
                                  .gray200
                                  .padding(const EdgeInsets.all(8))
                                  .roundedSM
                                  .make(),
                              10.heightBox,
                              values[index].text.gray400.make()
                            ],
                          );
                        }),
                      ),
                      10.heightBox,
                      const Divider(),
                      10.heightBox,
                      // SizedBox(
                      //   height: 150,
                      //   child: ListView.builder(
                      //     physics: const BouncingScrollPhysics(),
                      //     scrollDirection: Axis.horizontal,
                      //     shrinkWrap: true,
                      //     itemCount: 6,
                      //     itemBuilder: (context, index) {
                      //       return Container(
                      //         padding: const EdgeInsets.all(8),
                      //         margin: const EdgeInsets.only(right: 4),
                      //         decoration: BoxDecoration(
                      //           color: cardcolor,
                      //           borderRadius: BorderRadius.circular(12),
                      //         ),
                      //         child: Column(children: [
                      //           "${index + 1} AM".text.gray200.make(),
                      //           Image.asset(
                      //             "assets/weather/10n.png",
                      //             width: 80,
                      //           ),
                      //           "38$degree".text.white.make()
                      //         ]),
                      //       );
                      //     },
                      //   ),
                      // ),c
                      FutureBuilder(
                        future: controler.hourelyweatherdata,
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            // HourlyWeatherDetails hourlyData = snapshot.data ;
                            // HourlyWeatherDetails hourlyData = snapshot.data;
                            // dynamic hourlyDatas = snapshot.data;
                            // hourlyDatas as HourlyWeatherDetails;

                            return SizedBox(
                              height: 150,
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: 3,
                                // hourlyData.list!.length > 6
                                //     ? 6
                                //     : hourlyData.list!.length,
                                itemBuilder: (context, index) {
                                  // var time = DateFormat.jm().format(
                                  //     DateTime.fromMillisecondsSinceEpoch(
                                  //         hourlyData.list![index].dt!.toInt()));
                                  return Container(
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.only(right: 4),
                                    decoration: BoxDecoration(
                                      color: cardcolor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(children: [
                                      "${index + 1} AM".text.gray200.make(),
                                      Image.asset(
                                        "assets/weather/10n.png",
                                        width: 80,
                                      ),
                                      "38$degree".text.white.make()
                                    ]),
                                  );
                                },
                              ),
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                      // FutureBuilder(
                      //   future: controler.hourelyweatherdata,
                      //   builder: (context, AsyncSnapshot snapshot) {
                      //     if (snapshot.hasData) {
                      //       return SizedBox(
                      //         height: 150,
                      //         child: ListView.builder(
                      //           physics: const BouncingScrollPhysics(),
                      //           scrollDirection: Axis.horizontal,
                      //           shrinkWrap: true,
                      //           itemCount: 6,
                      //           itemBuilder: (context, index) {
                      //             return Container(
                      //               padding: const EdgeInsets.all(8),
                      //               margin: const EdgeInsets.only(right: 4),
                      //               decoration: BoxDecoration(
                      //                 color: cardcolor,
                      //                 borderRadius: BorderRadius.circular(12),
                      //               ),
                      //               child: Column(children: [
                      //                 "${index + 1} AM".text.gray200.make(),
                      //                 Image.asset(
                      //                   "assets/weather/10n.png",
                      //                   width: 80,
                      //                 ),
                      //                 "38$degree".text.white.make()
                      //               ]),
                      //             );
                      //           },
                      //         ),
                      //       );
                      //     }
                      //     return Center(
                      //       child: CircularProgressIndicator(),
                      //     );
                      //   },
                      // ),

                      10.heightBox,
                      const Divider(),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          "Next 7 Days"
                              .text
                              .color(theme.primaryColor)
                              .semiBold
                              .size(16)
                              .color(theme.primaryColor)
                              .make(),
                          TextButton(
                              onPressed: () {}, child: "view all".text.make())
                        ],
                      ),
                      // ListView.builder(physics: NeverScrollableScrollPhysics(),
                      //   shrinkWrap: true,
                      //   itemCount: 7,
                      //   itemBuilder: (context, index) {
                      //     var day = DateFormat("EEEE")
                      //         .format(DateTime.now().add(Duration(days: index + 1)));
                      //     return Card(
                      //       child: Container(
                      //         padding:
                      //             EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      //         child: Row(children: ["$day".text.make()]),
                      //       ),
                      //     );
                      //   },
                      // ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          var day = DateFormat("EEEE").format(
                              DateTime.now().add(Duration(days: index + 1)));
                          return Card(
                            color: theme.cardColor,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: "$day"
                                          .text
                                          .color(theme.primaryColor)
                                          .semiBold
                                          .make()),
                                  Expanded(
                                    child: TextButton.icon(
                                        onPressed: null,
                                        icon: Image.asset(
                                          "assets/weather/50n.png",
                                          width: 40,
                                        ),
                                        label: "26$degree"
                                            .text
                                            .color(theme.primaryColor)
                                            .gray700
                                            .make()),
                                  ),
                                  // Use Text widget to display the dayt
                                  RichText(
                                      text: const TextSpan(children: [
                                    TextSpan(
                                        text: "37$degree /",
                                        style: TextStyle(
                                            fontFamily: "poppins",
                                            fontSize: 16)),
                                    TextSpan(
                                        text: "26$degree",
                                        style: TextStyle(
                                            fontFamily: "poppins",
                                            fontSize: 16)),
                                  ]))
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Vx.gray200,
                  ),
                );
              }
            },
          )),
    );
  }
}
