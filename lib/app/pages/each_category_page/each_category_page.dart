import 'package:belin_zayy/app/data/model/product_model.dart';
import 'package:belin_zayy/app/pages/each_category_page/each_category_controller.dart';
import 'package:belin_zayy/app/pages/widgets/category_items_widget.dart';
import 'package:belin_zayy/app/pages/widgets/empty_product_widget.dart';
import 'package:belin_zayy/app/pages/widgets/text_widget.dart';
import 'package:belin_zayy/app/utilites/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class EachCategoryPage extends GetView<EachCategoryController> {
  const EachCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catName = Get.arguments.toString();
    final List<ProductModel> productByCat = controller.findByCategory(catName);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            // color: Colors.red,
          ),
          onPressed: Get.back,
        ),
        // leading: const BackWidget(),
        // elevation: 0,
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Obx(
          () => controller.isSearch == true
              ? TextFormField(
                  controller: controller.searchTextController,
                  onChanged: (value) {
                    controller.searchQuery(value);
                    print(
                        "controller.searchList${controller.searchList.isEmpty}");
                  },
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white54),
                    isDense: true,
                  ),
                  style: const TextStyle(color: Colors.white),
                )
              : TextWidget(
                  text: catName,
                  color: Colors.white,
                  textSize: 18.0,
                  isTitle: true,
                ),
        ),

        actions: [
          Obx(
            () => controller.isSearch
                ? IconButton(
                    splashRadius: 5,
                    onPressed: () {
                      controller.search();
                      print("press close");
                      print("search=>${controller.isSearch}");
                      controller.searchTextController.clear();
                      // controller.searchList = [];
                    },
                    icon: const Icon(Icons.close))
                : IconButton(
                    splashRadius: 5,
                    onPressed: () {
                      controller.search();
                      print("press search");
                      print("search=>${controller.isSearch}");
                    },
                    icon: const Icon(Icons.search)),
          ),
        ],
      ),
      body:

          // id: 'a',
          GetBuilder<EachCategoryController>(
        id: "update",
        builder: (ctr) => ctr.categoryList.isEmpty
            ? const EmptyProductWidget(
                text: 'No products belong to this category',
              )
            : Padding(
                padding: WidgetUtil.defaultAllPadding(),
                child: SingleChildScrollView(
                  child: Column(children: [
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.zero,
                    //       hintText: "Search ",
                    //       suffixIcon: IconButton(
                    //           onPressed: () {},
                    //           icon: Icon(
                    //             Icons.close,
                    //             size: 17,
                    //           )),
                    //       isDense: true,
                    //       border: OutlineInputBorder()),
                    // ),
                    // TextFormField(
                    //   focusNode: ctr.searchTextFocusNode,
                    //   ctr: ctr.searchTextController,
                    //   onChanged: (valuee) {
                    //     ctr.searchQuery(valuee);
                    //   },
                    //   decoration: InputDecoration(
                    //     isDense: true,
                    //     focusedBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //       borderSide: const BorderSide(
                    //           color: Colors.blue, width: 1),
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //       borderSide: const BorderSide(
                    //           color: Colors.blue, width: 1),
                    //     ),
                    //     hintText: "Search",
                    //     prefixIcon: const Icon(Icons.search),
                    //     suffix: IconButton(
                    //       onPressed: () {
                    //         ctr.searchTextController!.clear();
                    //         ctr.searchTextFocusNode.unfocus();
                    //       },
                    //       icon: Icon(
                    //         Icons.close,
                    //         color: ctr.searchTextFocusNode.hasFocus
                    //             ? Colors.red
                    //             : color,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    ctr.searchTextController.text.isNotEmpty &&
                            ctr.searchLists.isEmpty
                        ? const EmptyProductWidget(
                            text:
                                'No products found, please try another keyword')
                        : ctr.searchTextController.text.isNotEmpty &&
                                ctr.searchLists.isNotEmpty
                            ? GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                padding: EdgeInsets.zero,
                                // crossAxisSpacing: 10,
                                childAspectRatio:
                                    Get.size.width / (Get.size.height * 0.61),
                                children: List.generate(ctr.searchLists.length,
                                    // ctr.categoryList.length,
                                    (index) {
                                  return
                                      // Text(
                                      // controller.searchLists[index].title);
                                      CategoryItemsWidget(
                                    index: index,
                                    model: ctr.searchLists,
                                  );
                                }),
                              )
                            : GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                padding: EdgeInsets.zero,
                                // crossAxisSpacing: 10,
                                childAspectRatio:
                                    Get.size.width / (Get.size.height * 0.61),
                                children: List.generate(ctr.categoryList.length,
                                    // controller.categoryList.length,
                                    (index) {
                                  return
                                      // controller.categoryList[index].title);
                                      CategoryItemsWidget(
                                    index: index,
                                    model: ctr.categoryList,
                                  );
                                }),
                              ),
                  ]),
                ),
              ),
      ),
    );
  }
}
