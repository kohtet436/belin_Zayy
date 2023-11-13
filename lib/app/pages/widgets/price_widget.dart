import 'package:belin_zayy/app/pages/widgets/text_widget.dart';
import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    Key? key,
    required this.salePrice,
    required this.price,
    // required this.textPrice,
    // required this.isOnSale,
  }) : super(key: key);
  final double salePrice, price;
  // final String textPrice;
  // final bool isOnSale;
  @override
  Widget build(BuildContext context) {
    // final Color color = Utils(context).color;
    // double userPrice = isOnSale? salePrice : price;
    return FittedBox(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          text: '${price}Ks',
          // '\$${(userPrice * int.parse(textPrice)).toStringAsFixed(2)}',
          color: ColorManager.primaryColor,
          textSize: 16,
        ),
        const SizedBox(
          width: 15,
        ),
        Visibility(
          // visible: isOnSale? true :false,
          child: Text(
            '${price}Ks',
            // '\$${(price * int.parse(textPrice)).toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.blue,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ),
      ],
    ));
  }
}
