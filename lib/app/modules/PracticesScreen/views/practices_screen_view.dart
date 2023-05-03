import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widget/size_box.dart';
import '../../../../common_widget/text.dart';
import '../../home/views/home_view.dart';
import '../controllers/practices_screen_controller.dart';

class PracticesScreenView extends GetView<PracticesScreenController> {
  const PracticesScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PracticesScreenController>(
      assignId: true,
      init: PracticesScreenController(),
      builder: (logic) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            title: CommonText.text(text: "Music", color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
          body: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonSizeBox.sizeBox(height: Get.height * 0.01),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          "All Music",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: controller.images.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  /* controller.currentIndex.value = index;
                                  if (!controller.showMusicBox.value) {
                                    controller.showMusicBox.value = !controller.showMusicBox.value;
                                  }*/
                                  print('HomeView');
                                  Get.to(() => HomeView());
                                },
                                child: Container(
                                  padding: EdgeInsets.zero,
                                  height: Get.height * 0.1,
                                  width: Get.width,
                                  // color: Colors.red,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: Get.height * .09,
                                          width: Get.width * 0.28,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: NetworkImage(controller.images[index].toString())),
                                              borderRadius: BorderRadius.circular(10)),
                                        ),
                                        CommonSizeBox.sizeBox(width: Get.width * 0.05),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CommonText.text(text: "Title"),
                                              CommonSizeBox.sizeBox(height: Get.height * 0.008),
                                              CommonText.text(text: "Sub Title", color: Colors.grey),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            controller.changeFav();
                                          },
                                          child: Icon(Icons.favorite_border),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                indent: 10.0,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              // Obx(() {
              //   return AnimatedPositioned(
              //     bottom: controller.showMusicBox.value ? 10 : -60,
              //     duration: Duration(milliseconds: 200),
              //     child: InkWell(
              //       onTap: () {
              //         print('PlayerView');
              //         // Get.to(() => PlayerView());
              //       },
              //       child: Center(
              //         child: Container(
              //           decoration: BoxDecoration(
              //             gradient: LinearGradient(colors: [Colors.yellow, Colors.yellow]),
              //             borderRadius: BorderRadius.circular(8),
              //           ),
              //           width: hw.width - 20,
              //           height: 60,
              //           child: Container(
              //             child: Column(
              //               children: [
              //                 SizedBox(height: 8),
              //                 Padding(
              //                   padding: EdgeInsets.only(left: 10, right: 20),
              //                   child: Row(
              //                     children: [
              //                       Image.network(
              //                           height: 48.0,
              //                           width: 48.0,
              //                           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5_f-3Npwnj40B6u8O8WmcX8swxRqUS8ncQg&usqp=CAU'),
              //                       SizedBox(width: 8),
              //                       Column(
              //                         crossAxisAlignment: CrossAxisAlignment.start,
              //                         children: [
              //                           Text(
              //                             'Pawnshop',
              //                             style: TextStyle(
              //                               fontSize: 14.0,
              //                               fontWeight: FontWeight.w600,
              //                             ),
              //                           ),
              //                           Text(
              //                             'Pawnshop',
              //                             style: TextStyle(
              //                               fontSize: 14.0,
              //                               fontWeight: FontWeight.w600,
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                       Spacer(),
              //                       InkWell(
              //                         child: Icon(Icons.favorite_border, color: Colors.white),
              //                         onTap: () {},
              //                       ),
              //                       InkWell(
              //                         child: Icon(Icons.pause, color: Colors.white),
              //                         onTap: () {},
              //                       ),
              //                       SizedBox(width: hw.width * 0.021),
              //                     ],
              //                   ),
              //                 ),
              //                 Spacer(),
              //                 Padding(
              //                   padding: EdgeInsets.only(left: 10, right: 18),
              //                   child: Container(
              //                     height: 2,
              //                     width: hw.width,
              //                     decoration: BoxDecoration(
              //                       color: Colors.white38,
              //                       borderRadius: BorderRadius.circular(4),
              //                     ),
              //                     child: Row(
              //                       children: [
              //                         Container(
              //                           height: 2,
              //                           width: 20,
              //                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.white),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             // child: Center(
              //             //   child: Text("Music ${controller.currentIndex.value}"),
              //             // ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   );
              // }),
            ],
          ),
        );
      },
    );
  }
}
