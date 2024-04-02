// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MealCategory {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MealCategoryCopyWith<MealCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealCategoryCopyWith<$Res> {
  factory $MealCategoryCopyWith(
          MealCategory value, $Res Function(MealCategory) then) =
      _$MealCategoryCopyWithImpl<$Res, MealCategory>;
  @useResult
  $Res call({String id, String title, Color color});
}

/// @nodoc
class _$MealCategoryCopyWithImpl<$Res, $Val extends MealCategory>
    implements $MealCategoryCopyWith<$Res> {
  _$MealCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealCategoryImplCopyWith<$Res>
    implements $MealCategoryCopyWith<$Res> {
  factory _$$MealCategoryImplCopyWith(
          _$MealCategoryImpl value, $Res Function(_$MealCategoryImpl) then) =
      __$$MealCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, Color color});
}

/// @nodoc
class __$$MealCategoryImplCopyWithImpl<$Res>
    extends _$MealCategoryCopyWithImpl<$Res, _$MealCategoryImpl>
    implements _$$MealCategoryImplCopyWith<$Res> {
  __$$MealCategoryImplCopyWithImpl(
      _$MealCategoryImpl _value, $Res Function(_$MealCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? color = null,
  }) {
    return _then(_$MealCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$MealCategoryImpl implements _MealCategory {
  const _$MealCategoryImpl(
      {required this.id, required this.title, this.color = Colors.orange});

  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey()
  final Color color;

  @override
  String toString() {
    return 'MealCategory(id: $id, title: $title, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MealCategoryImplCopyWith<_$MealCategoryImpl> get copyWith =>
      __$$MealCategoryImplCopyWithImpl<_$MealCategoryImpl>(this, _$identity);
}

abstract class _MealCategory implements MealCategory {
  const factory _MealCategory(
      {required final String id,
      required final String title,
      final Color color}) = _$MealCategoryImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  Color get color;
  @override
  @JsonKey(ignore: true)
  _$$MealCategoryImplCopyWith<_$MealCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
