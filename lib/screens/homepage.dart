import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/screens/colors.dart';
import 'package:newsapp/screens/detailnews.dart';
import 'package:newsapp/screens/homeController.dart';
import 'package:newsapp/screens/horizontal_ListView.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Apptheme.colorPrimary,
        title: Text("News Feed"),
        actions: [
          GestureDetector(
            child: Icon(
              Icons.filter_alt_outlined,
              size: 30,
            ),
            onTap: () {
              if (controller.filter.value == true) {
                controller.filter.value = false;
                controller.secondfilter.value = false;
                controller.currentDataindex.value = -1;
                controller.currentIndex.value = -1;
                controller.getFeeds();
              } else {
                controller.filter.value = true;
              }
            },
          )
        ],
      ),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                return controller.filter.value
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Filters",
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          HorizontalList(
                              itemCount: controller.filterlist.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    controller.secondfilter.value = true;
                                    controller.currentIndex.value = index;
                                  },
                                  child: Obx(() => Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            top: 8,
                                            bottom: 8,
                                            left: 12,
                                            right: 12),
                                        margin: EdgeInsets.only(
                                            left: 0,
                                            right: 8,
                                            top: 4,
                                            bottom: 4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          gradient: controller
                                                      .currentIndex.value ==
                                                  index
                                              ? LinearGradient(colors: [
                                                  Apptheme.colorPrimary,
                                                  Apptheme.colorPrimary
                                                      .withOpacity(0.5)
                                                ])
                                              : LinearGradient(colors: [
                                                  Theme.of(context).cardColor,
                                                  Theme.of(context)
                                                      .cardColor
                                                      .withOpacity(0.5)
                                                ]),
                                          border: Border.all(
                                              color: Colors.grey, width: 0.5),
                                        ),
                                        child:
                                            Text(controller.filterlist[index]),
                                      )),
                                );
                              }),
                          SizedBox(height: 5),
                          controller.secondfilter.value
                              ? HorizontalList(
                                  itemCount: controller.currentIndex.value == 0
                                      ? controller.source_list.length
                                      : controller.sortlist.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {

                                        controller.currentDataindex.value = index;
                                        if(controller.filterlist[controller.currentIndex.value]=='Sources')
                                          {
                                            print('${controller.source_list[controller.currentDataindex.value]}');
                                            controller.getFeedsbysource(controller.source_list[index]);
                                          }

                                        if(controller.filterlist[controller.currentIndex.value]=='Sort')
                                        {
                                          print('${controller.source_list[controller.currentDataindex.value]}');
                                          controller.getFeedsbysort(controller.sortlist[index]);
                                        }


                                      },
                                      child: Obx(()=>Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            top: 8,
                                            bottom: 8,
                                            left: 12,
                                            right: 12),
                                        margin: EdgeInsets.only(
                                            left: 0,
                                            right: 8,
                                            top: 4,
                                            bottom: 4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          gradient: controller
                                              .currentDataindex.value ==
                                              index
                                              ? LinearGradient(colors: [
                                            Apptheme.colorPrimary,
                                            Apptheme.colorPrimary
                                                .withOpacity(0.5)
                                          ])
                                              : LinearGradient(colors: [
                                            Theme.of(context).cardColor,
                                            Theme.of(context)
                                                .cardColor
                                                .withOpacity(0.5)
                                          ]),
                                          border: Border.all(
                                              color: Colors.grey, width: 0.5),
                                        ),
                                        child: controller.currentIndex.value ==
                                            0
                                            ? Text(
                                            controller.source_list[index])
                                            : Text(controller.sortlist[index]),
                                      )),
                                    );
                                  })
                              : Container()
                        ],
                      )
                    : Container();
              }),
              Obx(() {
                return controller.newsfeed.length > 0
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: controller.newsfeed[0].articles!.length,
                            itemBuilder: (context, index) {
                              // return Container(
                              //   width: Get.width,
                              //   child: Row(
                              //     children: [
                              //       Expanded(flex:1,
                              //           child: Image.network(controller.newsfeed[0].articles![index].urlToImage.toString())),
                              //       Expanded(flex: 4,
                              //           child: Column(
                              //         children: [
                              //           Text(controller.newsfeed[0].articles![index].title!)
                              //         ],
                              //       ))
                              //     ],
                              //   ),
                              // );
                              return GestureDetector(
                                onTap: () {
                                  print('ontap');
                                  Get.to(() => DetailNews(),
                                      arguments: controller
                                          .newsfeed[0].articles![index]);
                                },
                                child: Card(
                                  elevation: 2,
                                  margin: EdgeInsets.only(bottom: 16),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(controller
                                                      .newsfeed[0]
                                                      .articles![index]
                                                      .urlToImage!),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.newsfeed[0]
                                                  .articles![index].title!,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.person),
                                                controller
                                                            .newsfeed[0]
                                                            .articles![index]
                                                            .author ==
                                                        null
                                                    ? Text("Unknown",)
                                                    : Text(controller
                                                        .newsfeed[0]
                                                        .articles![index]
                                                        .author!),
                                              ],
                                            )
                                          ],
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    : Center(
                        child: Text('No Data Found'),
                      );
              })
            ],
          )),
    );
  }
}
