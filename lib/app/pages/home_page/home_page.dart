import 'package:belin_zayy/app/controllers/product_controller.dart';
import 'package:belin_zayy/app/pages/widgets/category_items_widget.dart';
import 'package:belin_zayy/app/pages/widgets/empty_product_widget.dart';
import 'package:belin_zayy/app/pages/widgets/item_widget.dart';
import 'package:belin_zayy/app/ui/themes.dart/TextFieldBoxTheme.dart';
import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:belin_zayy/app/utilites/widget_utils.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

// class HomePage extends GetView<ProductController> {
//   HomePage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
// CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             backgroundColor: Colors.blue,
//             expandedHeight: 200,
//             floating: true,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               // :Text("Belin Zayy"),
//               background: SizedBox(
//                 height: Get.height * 0.27,
//                 child: Swiper(
//                   itemBuilder: (BuildContext context, int index) {
//                     return Image.asset(
//                       TextFieldBoxThemes.offerImages[index],
//                       fit: BoxFit.fill,
//                     );
//                   },
//                   autoplay: true,
//                   itemCount: TextFieldBoxThemes.offerImages.length,
//                   pagination: const SwiperPagination(
//                       alignment: Alignment.bottomCenter,
//                       builder: DotSwiperPaginationBuilder(
//                           color: Colors.white, activeColor: Colors.red)),
//                 ),
//               ),
//             ),
//             title: const Text("Belin Zayy"),
//           ),

//           //  Column(
//           //    children: [
//           //  SizedBox(
//           //    height: Get.height * 0.27,
//           //    child: Swiper(
//           //      itemBuilder: (BuildContext context, int index) {
//           //        return Image.asset(
//           //        TextFieldBoxThemes.offerImages[index],
//           //          fit: BoxFit.fill,
//           //        );
//           //      },
//           //      autoplay: true,
//           //      itemCount: TextFieldBoxThemes.offerImages.length,
//           //      pagination: const SwiperPagination(
//           //          alignment: Alignment.bottomCenter,
//           //          builder: DotSwiperPaginationBuilder(
//           //              color: Colors.white, activeColor: Colors.red)),
//           //      // control: const SwiperControl(color: Colors.black),
//           //    ),
//           //  ),
//           //  const SizedBox(
//           //    height: 6,
//           //  ),
//           //  TextButton(
//           //    onPressed: (){
//           //  ///GoTo Onsale Page

//           //    },

//           //    child: TextWidget(
//           //      text: 'View all',
//           //      maxLines: 1,
//           //      color: Colors.blue,
//           //      textSize: 20,
//           //    ),
//           //  ),
//           //  // const SizedBox(
//           //  //   height: 6,
//           //  // ),
//           //  // Row(
//           //  //   children: [
//           //  //     // RotatedBox(
//           //  //     //   quarterTurns: -1,
//           //  //     //   child: Row(
//           //  //     //     children: [
//           //  //     //       TextWidget(
//           //  //     //         text: 'On sale'.toUpperCase(),
//           //  //     //         color: Colors.red,
//           //  //     //         textSize: 22,
//           //  //     //         isTitle: true,
//           //  //     //       ),
//           //  //     //       const SizedBox(
//           //  //     //         width: 5,
//           //  //     //       ),
//           //  //     //       const Icon(
//           //  //     //         Icons.discount_outlined,
//           //  //     //         // IconlyLight.discount,
//           //  //     //         color: Colors.red,
//           //  //     //       ),
//           //  //     //     ],
//           //  //     //   ),
//           //  //     // ),
//           //  //     const SizedBox(
//           //  //       width: 8,
//           //  //     ),
//           //  //     Flexible(
//           //  //       child: SizedBox(
//           //  //         height: Get.height * 0.24,
//           //  //         child: ListView.builder(
//           //  //             itemCount: 5,
//           //  //             // productsOnSale.length < 10
//           //  //                 // ? productsOnSale.length
//           //  //                 // : 10,
//           //  //             scrollDirection: Axis.horizontal,
//           //  //             itemBuilder: (ctx, index) {
//           //  //               return Text("On Sale");
//           //  //               // ChangeNotifierProvider.value(
//           //  //               //     value: productsOnSale[index],
//           //  //               //     child:
//           //  //                   // const OnSaleWidget();
//           //  //                   // );
//           //  //             }),
//           //  //       ),
//           //  //     ),
//           //  //   ],
//           //  // ),
//           //  // const SizedBox(
//           //  //   height: 10,
//           //  // ),
//           //  Padding(
//           //    padding: const EdgeInsets.symmetric(horizontal: 8),
//           //    child: Row(
//           //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //      children: [
//           //        TextWidget(
//           //          text: 'Our products',
//           //          color: Colors.red,
//           //          textSize: 22,
//           //          isTitle: true,
//           //        ),
//           //        // const Spacer(),
//           //        TextButton(
//           //          onPressed: () {
//           //           ///GoTo FeedsPage
//           //          },
//           //          child: TextWidget(
//           //            text: 'Browse all',
//           //            maxLines: 1,
//           //            color: Colors.blue,
//           //            textSize: 20,
//           //          ),
//           //        ),
//           //      ],
//           //    ),
//           //  ),
//           // Obx(
//             // () =>
//              Obx(()=>
//                 controller.loading == false
//                   ? const SliverToBoxAdapter(
//                       child: Center(
//                       child: CircularProgressIndicator(),
//                     ))
//                   :
//                    SliverToBoxAdapter(
//                      child:  GridView.builder(
//                           primary: false,
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                             maxCrossAxisExtent: 200,
//                             childAspectRatio: Get.width / (Get.height * 0.61),
//                             crossAxisSpacing: 10,
//                           ),
//                           itemCount: controller.productList.length,
//                           itemBuilder: (BuildContext ctx, index) {
//                             return ItemWidget(
//                               index: index,
//                             );
//                           }),
//                     ),

//                   //            SliverList(
//                   //             delegate: SliverChildListDelegate(
//                   //              [ ListView.builder(
//                   //                shrinkWrap: true,
//                   //                physics: NeverScrollableScrollPhysics(),
//                   //                itemCount: controller.productList.length,
//                   //                itemBuilder: (BuildContext context, int index) {
//                   //              return ItemWidget(index: index);
//                   //                }
//                   //                                  )]),

//                   //  ),

//              // Expanded(child: SliverList(delegate: SliverChildListDelegate(List.generate(controller.productList.length, (index) => ItemWidget(index: index))))),

//                 // Expanded(
//                   // child: SliverToBoxAdapter(
//                       // child:
//                       // Expanded(
//                       //   child: ListView.builder(
//                       //     shrinkWrap: true,
//                       //     physics:const NeverScrollableScrollPhysics(),
//                       //     // primary: false,
//                       //       itemCount:controller.productList.length,

//                       //     itemBuilder: (
//                       //       context,index)=>ItemWidget(index: index)),
//                       // )
//       GridView.builder(
//           primary: false,
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//             maxCrossAxisExtent: 200,
//             childAspectRatio: Get.width / (Get.height * 0.61),
//             crossAxisSpacing: 10,
//           ),
//           itemCount: controller.productList.length,
//           itemBuilder: (BuildContext ctx, index) {
//             return ItemWidget(
//               index: index,
//             );
//           }),
//     ),
// ),
//        )
//                        // GridView.count(
//                        // shrinkWrap: true,
//                        // physics: const NeverScrollableScrollPhysics(),
//                        //   crossAxisCount: 2,
//                        //   padding: EdgeInsets.zero,
//                        //   // crossAxisSpacing: 10,
//                        //  childAspectRatio: Get.width / (Get.height * 0.61),
//                        //   children: List.generate(
//                        //     controller.productList.length,

//                        //           (index) {
//                        //     return
//                        //         ItemWidget(index: index,);

//                        //     }
//                        //   ),
//                 )   // )
//         ]
//       ),

//       //  ],)
//     );
//   }
// }

// import 'package:flutter/material.dart';

class HomePage extends GetView<ProductController> {
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await controller.fetchProducts();
      },
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 248, 241, 241),
          body: Obx(() => controller.loading == false
              ? const Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primaryColor,
                  ),
                )
              : PageStorage(
                  bucket: PageStorageBucket(),
                  key: const PageStorageKey('page'),
                  child: CustomScrollView(
                      controller: controller.scrollController,
                      slivers: [
                        SliverAppBar(
                          expandedHeight: 200,
                          floating: true,
                          pinned: true,
                          flexibleSpace: FlexibleSpaceBar(
                            background: SizedBox(
                              height: Get.height * 0.27,
                              child: Swiper(
                                itemBuilder: (BuildContext context, int index) {
                                  return Image.asset(
                                    TextFieldBoxThemes.offerImages[index],
                                    fit: BoxFit.fill,
                                  );
                                },
                                autoplay: true,
                                itemCount:
                                    TextFieldBoxThemes.offerImages.length,
                                pagination: const SwiperPagination(
                                    alignment: Alignment.bottomCenter,
                                    builder: DotSwiperPaginationBuilder(
                                        color: Colors.white,
                                        activeColor:
                                            ColorManager.primaryColor)),
                              ),
                            ),
                          ),
                          title: controller.searchInTotal == false
                              ? const Text("Belin Zayy")
                              : TextFormField(
                                  autofocus: true,
                                  onChanged: (e) {
                                    controller.searchQueryInTotal(e);
                                  },
                                  controller: controller.searchTextController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      hintText: "Search",
                                      isDense: true,
                                      hintStyle:
                                          TextStyle(color: Colors.white54)),
                                ),
                          actions: <Widget>[
                            controller.searchInTotal == false
                                ? IconButton(
                                    onPressed: () {
                                      controller.searchInTotalFun();
                                    },
                                    icon: const Icon(Icons.search))
                                : IconButton(
                                    onPressed: () {
                                      controller.searchInTotalFun();
                                    },
                                    icon: Icon(Icons.close))
                          ],
                        ),
                        GetBuilder<ProductController>(
                            id: "updateTotal",
                            builder: (ctr) => ctr
                                        .searchTextController.text.isNotEmpty &&
                                    ctr.searchList.isEmpty
                                ?
                                // SliverToBoxAdapter(child: Text("Empty"))
                                SliverToBoxAdapter(
                                    child: EmptyProductWidget(
                                        text:
                                            "No product found.please try another keyword"),
                                  )
                                : ctr.searchTextController.text.isNotEmpty &&
                                        ctr.searchList.isNotEmpty
                                    ? SliverToBoxAdapter(
                                        child: Padding(
                                          padding:
                                              WidgetUtil.defaultAllPadding(),
                                          child: GridView.custom(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            gridDelegate:
                                                SliverWovenGridDelegate.count(
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 0,
                                              crossAxisSpacing: 0,
                                              pattern: [
                                                const WovenGridTile(
                                                  0.9,
                                                ),
                                                const WovenGridTile(5 / 7,
                                                    crossAxisRatio: 0.93),
                                              ],
                                            ),
                                            childrenDelegate:
                                                SliverChildBuilderDelegate(
                                              childCount: ctr.searchList.length,
                                              (context, index) =>
                                                  //  Text(ctr
                                                  // .searchList[index].title
                                                  // .toString())
                                                  // CategoryItemsWidget(
                                                  // model: ctr.searchList,
                                                  // index: index)
                                                  ItemWidget(
                                                index: index,
                                                isSearch: true,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : SliverToBoxAdapter(
                                        child: Padding(
                                          padding:
                                              WidgetUtil.defaultAllPadding(),
                                          child: GridView.custom(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            gridDelegate:
                                                SliverWovenGridDelegate.count(
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 0,
                                              crossAxisSpacing: 0,
                                              pattern: [
                                                const WovenGridTile(
                                                  0.9,
                                                ),
                                                const WovenGridTile(5 / 7,
                                                    crossAxisRatio: 0.93),
                                              ],
                                            ),
                                            childrenDelegate:
                                                SliverChildBuilderDelegate(
                                              childCount:
                                                  controller.productList.length,
                                              (context, index) =>
                                                  ItemWidget(index: index),
                                            ),
                                          ),
                                        ),
                                      ))
                      ])))),
    );
  }
}
