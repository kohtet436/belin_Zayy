import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:belin_zayy/app/utilites/widget_utils.dart';
import 'package:belin_zayy/app/values/value_manager.dart';
import 'package:belin_zayy/global_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/viewedProduct_controller.dart';
import '../empty_page/empty_page.dart';
import '../widgets/text_widget.dart';
import '../widgets/viewedRecent_widget.dart';

class ViewedRecentlyScreen extends GetView<ViewRecentCotroller> {
  static const routeName = '/ViewedRecentlyScreen';

  ViewedRecentlyScreen({Key? key}) : super(key: key);

  bool check = true;

  @override
  Widget build(BuildContext context) {
    // Color color = Utils(context).color;

    // Size size = Utils(context).getScreenSize;
    // final viewedProdProvider = Provider.of<ViewedProdProvider>(context);

    print("data>${controller.viewed}");
    print("dataList>${controller.viewedProdItemsList}");
    // var a= controller.viewedProdItemsList;

    return Scaffold(
      // appBar: AppBar(title: Text("history page")),
      body: Obx(
        () => controller.viewedProdItemsList.isEmpty
            ?
            // print("data>${
            // controller.viewed}");
            const EmptyScreen(
                title: 'Your history is empty',
                subtitle: 'No products has been viewed yet!',
                buttonText: 'Shop now',
                imagePath: 'images/emptycart.json',
              )
            : Scaffold(
                appBar: AppBar(
                    actions: [
                      IconButton(
                        onPressed: () {
                          // GlobalMethods().warningDialog(
                          //   title: 'Empty your history?',
                          //   subtitle: 'Are you sure?',
                          //   fct: () {
                          //     controller.viewedProdItemsList.clear();
                          print("${controller.viewedProdItemsList}");
                          //     print("delete do");
                          //     print("delete done");
                          //   },
                          // );
                        },
                        icon: const Icon(
                          // IconlyBroken.delete,
                          Icons.delete,
                          color: Colors.white,
                        ),
                      )
                    ],
                    // leading: IconButton(
                    //   icon: const Icon(Icons.arrow_back_rounded),
                    //   onPressed: () {
                    //     Get.back();
                    //   },
                    // ),
                    //  const BackWidget(),
                    // automaticallyImplyLeading: false,
                    // elevation: 0,
                    centerTitle: true,
                    title: const Text("Recent Viewed")
                    // title: TextWidget(
                    //   text: 'History',
                    //   color: ColorManager.primaryColor,
                    //   textSize: 24.0,
                    // ),
                    // backgroundColor: Theme.of(context)
                    //     .scaffoldBackgroundColor
                    //     .withOpacity(0.9),
                    ),
                body: ListView.builder(
                    itemCount: controller.viewedProdItemsList.length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.defaultPadding),
                          child: ViewedRecentlyWidget(
                            index: index,
                          )
                          // ChangeNotifierProvider.value(
                          //     value: viewedProdItemsList[index],
                          //     child: ViewedRecentlyWidget()),
                          );
                    }),
              ),
      ),
    );
  }
}
