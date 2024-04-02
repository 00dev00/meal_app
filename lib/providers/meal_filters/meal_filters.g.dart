// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_filters.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mealFiltersExtendedDescHash() =>
    r'47078626f82561aa767d8277d7e735505136e8b8';

/// See also [mealFiltersExtendedDesc].
@ProviderFor(mealFiltersExtendedDesc)
final mealFiltersExtendedDescProvider =
    Provider<Map<MealFilter, ({String desc, String name})>>.internal(
  mealFiltersExtendedDesc,
  name: r'mealFiltersExtendedDescProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mealFiltersExtendedDescHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MealFiltersExtendedDescRef
    = ProviderRef<Map<MealFilter, ({String desc, String name})>>;
String _$mealFiltersHash() => r'4d64154dd4d0e88848587978208bd77e27f4a597';

/// See also [MealFilters].
@ProviderFor(MealFilters)
final mealFiltersProvider =
    NotifierProvider<MealFilters, Map<MealFilter, bool>>.internal(
  MealFilters.new,
  name: r'mealFiltersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mealFiltersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MealFilters = Notifier<Map<MealFilter, bool>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
