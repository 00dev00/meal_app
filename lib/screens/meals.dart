import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => ListView(
          children: [
            for (Meal meal in meals)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        Image.network(
                          meal.imageUrl,
                          fit: BoxFit.fill,
                          width: constraints.maxWidth,
                          height: constraints.maxHeight / 3,
                          errorBuilder: (context, error, stackTrace) {
                            // TODO(dk): redesign this thing.
                            // const assetName = 'assets/images/meal.svg';
                            // final Widget svg = SvgPicture.asset(
                            //   width: 600,
                            //   height: constraints.maxHeight / 3,
                            //   assetName,
                            //   semanticsLabel: 'Photo is missing',
                            // );
                            //return svg;
                            return const Text("erorr occurred");
                          },
                        ),
                        Positioned(
                          top: 160,
                          child: Container(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight / 8,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  meal.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: getReceiptDetails(context, meal),
                                ),
                                const SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}

List<Widget> getReceiptDetails(BuildContext context, Meal meal) {
  var textStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
        color: Colors.white70,
      );

  const bigBox = SizedBox(
    width: 15,
  );

  const smallBox = SizedBox(
    width: 5,
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
      if (data.icon case Icons.watch_later_outlined || Icons.work) smallBox,
      Text(
        data.text,
        style: textStyle,
      ),
      bigBox
    ],
  ];
}
