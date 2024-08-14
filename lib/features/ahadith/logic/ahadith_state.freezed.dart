// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ahadith_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AhadithState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String message) error,
    required TResult Function() getBooks,
    required TResult Function() getImamBooks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(String message)? error,
    TResult? Function()? getBooks,
    TResult? Function()? getImamBooks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String message)? error,
    TResult Function()? getBooks,
    TResult Function()? getImamBooks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Loaded<T> value) loaded,
    required TResult Function(Error<T> value) error,
    required TResult Function(GetBooks<T> value) getBooks,
    required TResult Function(GetImamBooks<T> value) getImamBooks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Loaded<T> value)? loaded,
    TResult? Function(Error<T> value)? error,
    TResult? Function(GetBooks<T> value)? getBooks,
    TResult? Function(GetImamBooks<T> value)? getImamBooks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Loaded<T> value)? loaded,
    TResult Function(Error<T> value)? error,
    TResult Function(GetBooks<T> value)? getBooks,
    TResult Function(GetImamBooks<T> value)? getImamBooks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AhadithStateCopyWith<T, $Res> {
  factory $AhadithStateCopyWith(
          AhadithState<T> value, $Res Function(AhadithState<T>) then) =
      _$AhadithStateCopyWithImpl<T, $Res, AhadithState<T>>;
}

/// @nodoc
class _$AhadithStateCopyWithImpl<T, $Res, $Val extends AhadithState<T>>
    implements $AhadithStateCopyWith<T, $Res> {
  _$AhadithStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$AhadithStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl<T> implements Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AhadithState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String message) error,
    required TResult Function() getBooks,
    required TResult Function() getImamBooks,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(String message)? error,
    TResult? Function()? getBooks,
    TResult? Function()? getImamBooks,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String message)? error,
    TResult Function()? getBooks,
    TResult Function()? getImamBooks,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Loaded<T> value) loaded,
    required TResult Function(Error<T> value) error,
    required TResult Function(GetBooks<T> value) getBooks,
    required TResult Function(GetImamBooks<T> value) getImamBooks,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Loaded<T> value)? loaded,
    TResult? Function(Error<T> value)? error,
    TResult? Function(GetBooks<T> value)? getBooks,
    TResult? Function(GetImamBooks<T> value)? getImamBooks,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Loaded<T> value)? loaded,
    TResult Function(Error<T> value)? error,
    TResult Function(GetBooks<T> value)? getBooks,
    TResult Function(GetImamBooks<T> value)? getImamBooks,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial<T> implements AhadithState<T> {
  const factory Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<T, $Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl<T> value, $Res Function(_$LoadingImpl<T>) then) =
      __$$LoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<T, $Res>
    extends _$AhadithStateCopyWithImpl<T, $Res, _$LoadingImpl<T>>
    implements _$$LoadingImplCopyWith<T, $Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl<T> _value, $Res Function(_$LoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl<T> implements Loading<T> {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AhadithState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String message) error,
    required TResult Function() getBooks,
    required TResult Function() getImamBooks,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(String message)? error,
    TResult? Function()? getBooks,
    TResult? Function()? getImamBooks,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String message)? error,
    TResult Function()? getBooks,
    TResult Function()? getImamBooks,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Loaded<T> value) loaded,
    required TResult Function(Error<T> value) error,
    required TResult Function(GetBooks<T> value) getBooks,
    required TResult Function(GetImamBooks<T> value) getImamBooks,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Loaded<T> value)? loaded,
    TResult? Function(Error<T> value)? error,
    TResult? Function(GetBooks<T> value)? getBooks,
    TResult? Function(GetImamBooks<T> value)? getImamBooks,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Loaded<T> value)? loaded,
    TResult Function(Error<T> value)? error,
    TResult Function(GetBooks<T> value)? getBooks,
    TResult Function(GetImamBooks<T> value)? getImamBooks,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements AhadithState<T> {
  const factory Loading() = _$LoadingImpl<T>;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<T, $Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl<T> value, $Res Function(_$LoadedImpl<T>) then) =
      __$$LoadedImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<T, $Res>
    extends _$AhadithStateCopyWithImpl<T, $Res, _$LoadedImpl<T>>
    implements _$$LoadedImplCopyWith<T, $Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl<T> _value, $Res Function(_$LoadedImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$LoadedImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$LoadedImpl<T> implements Loaded<T> {
  const _$LoadedImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'AhadithState<$T>.loaded(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<T, _$LoadedImpl<T>> get copyWith =>
      __$$LoadedImplCopyWithImpl<T, _$LoadedImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String message) error,
    required TResult Function() getBooks,
    required TResult Function() getImamBooks,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(String message)? error,
    TResult? Function()? getBooks,
    TResult? Function()? getImamBooks,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String message)? error,
    TResult Function()? getBooks,
    TResult Function()? getImamBooks,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Loaded<T> value) loaded,
    required TResult Function(Error<T> value) error,
    required TResult Function(GetBooks<T> value) getBooks,
    required TResult Function(GetImamBooks<T> value) getImamBooks,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Loaded<T> value)? loaded,
    TResult? Function(Error<T> value)? error,
    TResult? Function(GetBooks<T> value)? getBooks,
    TResult? Function(GetImamBooks<T> value)? getImamBooks,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Loaded<T> value)? loaded,
    TResult Function(Error<T> value)? error,
    TResult Function(GetBooks<T> value)? getBooks,
    TResult Function(GetImamBooks<T> value)? getImamBooks,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded<T> implements AhadithState<T> {
  const factory Loaded(final T data) = _$LoadedImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<T, _$LoadedImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<T, $Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl<T> value, $Res Function(_$ErrorImpl<T>) then) =
      __$$ErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<T, $Res>
    extends _$AhadithStateCopyWithImpl<T, $Res, _$ErrorImpl<T>>
    implements _$$ErrorImplCopyWith<T, $Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl<T> _value, $Res Function(_$ErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl<T> implements Error<T> {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AhadithState<$T>.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      __$$ErrorImplCopyWithImpl<T, _$ErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String message) error,
    required TResult Function() getBooks,
    required TResult Function() getImamBooks,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(String message)? error,
    TResult? Function()? getBooks,
    TResult? Function()? getImamBooks,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String message)? error,
    TResult Function()? getBooks,
    TResult Function()? getImamBooks,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Loaded<T> value) loaded,
    required TResult Function(Error<T> value) error,
    required TResult Function(GetBooks<T> value) getBooks,
    required TResult Function(GetImamBooks<T> value) getImamBooks,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Loaded<T> value)? loaded,
    TResult? Function(Error<T> value)? error,
    TResult? Function(GetBooks<T> value)? getBooks,
    TResult? Function(GetImamBooks<T> value)? getImamBooks,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Loaded<T> value)? loaded,
    TResult Function(Error<T> value)? error,
    TResult Function(GetBooks<T> value)? getBooks,
    TResult Function(GetImamBooks<T> value)? getImamBooks,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<T> implements AhadithState<T> {
  const factory Error(final String message) = _$ErrorImpl<T>;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetBooksImplCopyWith<T, $Res> {
  factory _$$GetBooksImplCopyWith(
          _$GetBooksImpl<T> value, $Res Function(_$GetBooksImpl<T>) then) =
      __$$GetBooksImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$GetBooksImplCopyWithImpl<T, $Res>
    extends _$AhadithStateCopyWithImpl<T, $Res, _$GetBooksImpl<T>>
    implements _$$GetBooksImplCopyWith<T, $Res> {
  __$$GetBooksImplCopyWithImpl(
      _$GetBooksImpl<T> _value, $Res Function(_$GetBooksImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetBooksImpl<T> implements GetBooks<T> {
  const _$GetBooksImpl();

  @override
  String toString() {
    return 'AhadithState<$T>.getBooks()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetBooksImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String message) error,
    required TResult Function() getBooks,
    required TResult Function() getImamBooks,
  }) {
    return getBooks();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(String message)? error,
    TResult? Function()? getBooks,
    TResult? Function()? getImamBooks,
  }) {
    return getBooks?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String message)? error,
    TResult Function()? getBooks,
    TResult Function()? getImamBooks,
    required TResult orElse(),
  }) {
    if (getBooks != null) {
      return getBooks();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Loaded<T> value) loaded,
    required TResult Function(Error<T> value) error,
    required TResult Function(GetBooks<T> value) getBooks,
    required TResult Function(GetImamBooks<T> value) getImamBooks,
  }) {
    return getBooks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Loaded<T> value)? loaded,
    TResult? Function(Error<T> value)? error,
    TResult? Function(GetBooks<T> value)? getBooks,
    TResult? Function(GetImamBooks<T> value)? getImamBooks,
  }) {
    return getBooks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Loaded<T> value)? loaded,
    TResult Function(Error<T> value)? error,
    TResult Function(GetBooks<T> value)? getBooks,
    TResult Function(GetImamBooks<T> value)? getImamBooks,
    required TResult orElse(),
  }) {
    if (getBooks != null) {
      return getBooks(this);
    }
    return orElse();
  }
}

abstract class GetBooks<T> implements AhadithState<T> {
  const factory GetBooks() = _$GetBooksImpl<T>;
}

/// @nodoc
abstract class _$$GetImamBooksImplCopyWith<T, $Res> {
  factory _$$GetImamBooksImplCopyWith(_$GetImamBooksImpl<T> value,
          $Res Function(_$GetImamBooksImpl<T>) then) =
      __$$GetImamBooksImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$GetImamBooksImplCopyWithImpl<T, $Res>
    extends _$AhadithStateCopyWithImpl<T, $Res, _$GetImamBooksImpl<T>>
    implements _$$GetImamBooksImplCopyWith<T, $Res> {
  __$$GetImamBooksImplCopyWithImpl(
      _$GetImamBooksImpl<T> _value, $Res Function(_$GetImamBooksImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetImamBooksImpl<T> implements GetImamBooks<T> {
  const _$GetImamBooksImpl();

  @override
  String toString() {
    return 'AhadithState<$T>.getImamBooks()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetImamBooksImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String message) error,
    required TResult Function() getBooks,
    required TResult Function() getImamBooks,
  }) {
    return getImamBooks();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(String message)? error,
    TResult? Function()? getBooks,
    TResult? Function()? getImamBooks,
  }) {
    return getImamBooks?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String message)? error,
    TResult Function()? getBooks,
    TResult Function()? getImamBooks,
    required TResult orElse(),
  }) {
    if (getImamBooks != null) {
      return getImamBooks();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Loaded<T> value) loaded,
    required TResult Function(Error<T> value) error,
    required TResult Function(GetBooks<T> value) getBooks,
    required TResult Function(GetImamBooks<T> value) getImamBooks,
  }) {
    return getImamBooks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Loaded<T> value)? loaded,
    TResult? Function(Error<T> value)? error,
    TResult? Function(GetBooks<T> value)? getBooks,
    TResult? Function(GetImamBooks<T> value)? getImamBooks,
  }) {
    return getImamBooks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Loaded<T> value)? loaded,
    TResult Function(Error<T> value)? error,
    TResult Function(GetBooks<T> value)? getBooks,
    TResult Function(GetImamBooks<T> value)? getImamBooks,
    required TResult orElse(),
  }) {
    if (getImamBooks != null) {
      return getImamBooks(this);
    }
    return orElse();
  }
}

abstract class GetImamBooks<T> implements AhadithState<T> {
  const factory GetImamBooks() = _$GetImamBooksImpl<T>;
}
