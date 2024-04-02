import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_category.freezed.dart';

@freezed
class MealCategory with _$MealCategory {
  const factory MealCategory({
    required String id,
    required String title,
    @Default(Colors.orange) Color color,
  }) = _MealCategory;
}
