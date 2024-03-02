import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meal_app/models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem(
    this.meal,
    this.constraints, {
    super.key,
  });

  final BoxConstraints constraints;
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final cardHeight = constraints.maxHeight / 3;

    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: SizedBox(
        height: cardHeight,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: GestureDetector(
            onTap: () {
              debugPrint("You've chosen ${meal.title}");
            },
            child: Stack(
              children: [
                FadeInImage.assetNetwork(
                  image: meal.imageUrl,
                  placeholder: "assets/images/tomato.gif",
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      "assets/images/no_meal.png",
                    );
                    //return const Placeholder();
                  },
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height:
                        cardHeight > 200 ? cardHeight * 1 / 4 : cardHeight / 2,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          meal.title,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _getReceiptDetails(context, meal),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> _getReceiptDetails(BuildContext context, Meal meal) {
  var textStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
        color: Colors.white70,
      );

  return [
    for (({IconData icon, String text}) data in [
      (icon: Icons.watch_later_outlined, text: "${meal.duration} min"),
      (icon: Icons.work, text: toBeginningOfSentenceCase(meal.complexity.name)),
      (
        icon: Icons.attach_money,
        text: toBeginningOfSentenceCase(meal.affordability.name)
      )
    ]) ...[
      Icon(data.icon),
      if (data.icon case Icons.watch_later_outlined || Icons.work)
        const SizedBox(
          width: 5,
        ),
      Text(
        data.text,
        style: textStyle,
      ),
      const SizedBox(
        width: 15,
      )
    ],
  ];
}
