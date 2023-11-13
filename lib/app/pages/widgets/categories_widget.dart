import 'package:belin_zayy/app/pages/widgets/text_widget.dart';
import 'package:belin_zayy/app/routes/routes.dart';
import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:belin_zayy/app/values/font_manager.dart';
import 'package:belin_zayy/app/values/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {Key? key,
      required this.catText,
      required this.imgPath,
      required this.passedColor})
      : super(key: key);
  final String catText, imgPath;
  final Color passedColor;
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // final themeState = Provider.of<DarkThemeProvider>(context);
    double _screenWidth = MediaQuery.of(context).size.width;
    // final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.eachCategoryPage, arguments: catText);
        // Navigator.pushNamed(context, CategoryScreen.routeName,
        // arguments: catText);
      },
      child: Card(
        elevation: 5,
        child: Container(
          height: _screenWidth * 0.5,
          decoration: BoxDecoration(
            // color: passedColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            // border: Border.all(
            //   color: passedColor.withOpacity(0.7),
            //   width: 2,
            // ),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Container for the image
                Container(
                  height: _screenWidth * 0.35,
                  width: _screenWidth * 0.40,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage(
                          imgPath,
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
                // Category name
                Text(catText,
                    style: getSemiBoldStyle(
                      fontSize: FontSize.defaultFontSize,
                      color: Colors.black,
                    ))
              ]),
        ),
      ),
    );
  }
}
