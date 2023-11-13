import 'package:belin_zayy/app/pages/widgets/categories_widget.dart';
import 'package:belin_zayy/app/pages/widgets/text_widget.dart';
import 'package:belin_zayy/app/utilites/widget_utils.dart';
import 'package:flutter/material.dart';

// class CategoriesPage extends StatelessWidget {
//   const CategoriesPage({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(child: Text("This is Categories Page"),),
//     );
//   }
// }
class CategoriesPage extends StatelessWidget {
  CategoriesPage({Key? key}) : super(key: key);

  List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];

  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'images/cat/men_wears.png',
      'catText': 'Men',
    },
    {
      'imgPath': 'images/cat/women_wears.png',
      'catText': 'Women',
    },
    {
      'imgPath': 'images/cat/kids.png',
      'catText': 'Kids',
    },
    {
      'imgPath': 'images/cat/beverage.png',
      'catText': 'Beverage',
    },
    {
      'imgPath': 'images/cat/food.png',
      'catText': 'Food',
    },
    {
      'imgPath': 'images/cat/cosmetic.png',
      'catText': 'Cosmetic',
    },
  ];
  @override
  Widget build(BuildContext context) {
    // final utils = Utils(context);
    Color color = Colors.red;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Categories",
          ),
        ),
        body: Padding(
          padding: WidgetUtil.defaultAllPadding(),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 240 / 250,
            crossAxisSpacing: 10, // Vertical spacing
            mainAxisSpacing: 10, // Horizontal spacing
            children: List.generate(6, (index) {
              return CategoriesWidget(
                catText: catInfo[index]['catText'],
                imgPath: catInfo[index]['imgPath'],
                passedColor: gridColors[index],
              );
            }),
          ),
        ));
  }
}
