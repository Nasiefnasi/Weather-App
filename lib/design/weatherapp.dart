import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weatherapp_starter_project/consts/colors.dart';
import 'package:weatherapp_starter_project/consts/images.dart';
import 'package:weatherapp_starter_project/consts/string.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    var date = DateFormat("yMMMMd").format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: "$date".text.gray700.make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.light_mode,
              color: Vx.gray600,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Vx.gray600,
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "LAHORE"
                    .text
                    .fontFamily('poppins_black')
                    .size(36)
                    .letterSpacing(3)
                    .make(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/weather/01d.png",
                      width: 80,
                      height: 80,
                    ),
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                        text: "37$degree",
                        style: TextStyle(
                            fontFamily: "poppins",
                            color: Vx.gray900,
                            fontSize: 64),
                      ),
                      TextSpan(
                        text: "Sunny",
                        style: TextStyle(
                            fontFamily: "poppins_light",
                            color: Vx.gray900,
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
                        icon: const Icon(
                          Icons.expand_less_rounded,
                          color: Vx.gray400,
                        ),
                        label: "41$degree".text.make()),
                    TextButton.icon(
                        onPressed: null,
                        icon: const Icon(
                          Icons.expand_less_rounded,
                          color: Vx.gray400,
                        ),
                        label: "26$degree".text.make()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(3, (index) {
                    var iconsList = [clouds, humidly, windspeed];
                    var values = ["70%", "40%", "3.5km/h"];
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
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, index) {
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
                ),
                10.heightBox,
                const Divider(),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Next 7 Days".text.semiBold.size(16).make(),
                    TextButton(onPressed: () {}, child: "view all".text.make())
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
                    var day = DateFormat("EEEE")
                        .format(DateTime.now().add(Duration(days: index + 1)));
                    return Card(
                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: "$day".text.semiBold.make()),
                            Expanded(
                              child: TextButton.icon(
                                  onPressed: null,
                                  icon: Image.asset(
                                    "assets/weather/50n.png",
                                    width: 40,
                                  ),
                                  label: "26$degree".text.gray700.make()),
                            ),
                            // Use Text widget to display the dayt
                            RichText(
                                text: const TextSpan(children: [
                              TextSpan(
                                  text: "37$degree /",
                                  style: TextStyle(
                                      color: Vx.gray800,
                                      fontFamily: "poppins",
                                      fontSize: 16)),
                                      TextSpan(
                                  text: "26$degree",
                                  style: TextStyle(
                                      color: Vx.gray400,
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
          ),
        ),
      ),
    );
  }
}
