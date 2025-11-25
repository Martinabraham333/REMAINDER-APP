// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SignInWithGoogle value)?  signInWithGoogle,TResult Function( SignInWithEmailPassword value)?  signInWithEmailPassword,TResult Function( SignUpWithEmailPassword value)?  signUpWithEmailPassword,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SignInWithGoogle() when signInWithGoogle != null:
return signInWithGoogle(_that);case SignInWithEmailPassword() when signInWithEmailPassword != null:
return signInWithEmailPassword(_that);case SignUpWithEmailPassword() when signUpWithEmailPassword != null:
return signUpWithEmailPassword(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SignInWithGoogle value)  signInWithGoogle,required TResult Function( SignInWithEmailPassword value)  signInWithEmailPassword,required TResult Function( SignUpWithEmailPassword value)  signUpWithEmailPassword,}){
final _that = this;
switch (_that) {
case SignInWithGoogle():
return signInWithGoogle(_that);case SignInWithEmailPassword():
return signInWithEmailPassword(_that);case SignUpWithEmailPassword():
return signUpWithEmailPassword(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SignInWithGoogle value)?  signInWithGoogle,TResult? Function( SignInWithEmailPassword value)?  signInWithEmailPassword,TResult? Function( SignUpWithEmailPassword value)?  signUpWithEmailPassword,}){
final _that = this;
switch (_that) {
case SignInWithGoogle() when signInWithGoogle != null:
return signInWithGoogle(_that);case SignInWithEmailPassword() when signInWithEmailPassword != null:
return signInWithEmailPassword(_that);case SignUpWithEmailPassword() when signUpWithEmailPassword != null:
return signUpWithEmailPassword(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  signInWithGoogle,TResult Function( String email,  String password)?  signInWithEmailPassword,TResult Function( String email,  String password)?  signUpWithEmailPassword,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SignInWithGoogle() when signInWithGoogle != null:
return signInWithGoogle();case SignInWithEmailPassword() when signInWithEmailPassword != null:
return signInWithEmailPassword(_that.email,_that.password);case SignUpWithEmailPassword() when signUpWithEmailPassword != null:
return signUpWithEmailPassword(_that.email,_that.password);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  signInWithGoogle,required TResult Function( String email,  String password)  signInWithEmailPassword,required TResult Function( String email,  String password)  signUpWithEmailPassword,}) {final _that = this;
switch (_that) {
case SignInWithGoogle():
return signInWithGoogle();case SignInWithEmailPassword():
return signInWithEmailPassword(_that.email,_that.password);case SignUpWithEmailPassword():
return signUpWithEmailPassword(_that.email,_that.password);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  signInWithGoogle,TResult? Function( String email,  String password)?  signInWithEmailPassword,TResult? Function( String email,  String password)?  signUpWithEmailPassword,}) {final _that = this;
switch (_that) {
case SignInWithGoogle() when signInWithGoogle != null:
return signInWithGoogle();case SignInWithEmailPassword() when signInWithEmailPassword != null:
return signInWithEmailPassword(_that.email,_that.password);case SignUpWithEmailPassword() when signUpWithEmailPassword != null:
return signUpWithEmailPassword(_that.email,_that.password);case _:
  return null;

}
}

}

/// @nodoc


class SignInWithGoogle implements AuthEvent {
  const SignInWithGoogle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInWithGoogle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.signInWithGoogle()';
}


}




/// @nodoc


class SignInWithEmailPassword implements AuthEvent {
  const SignInWithEmailPassword({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInWithEmailPasswordCopyWith<SignInWithEmailPassword> get copyWith => _$SignInWithEmailPasswordCopyWithImpl<SignInWithEmailPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInWithEmailPassword&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.signInWithEmailPassword(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $SignInWithEmailPasswordCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $SignInWithEmailPasswordCopyWith(SignInWithEmailPassword value, $Res Function(SignInWithEmailPassword) _then) = _$SignInWithEmailPasswordCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$SignInWithEmailPasswordCopyWithImpl<$Res>
    implements $SignInWithEmailPasswordCopyWith<$Res> {
  _$SignInWithEmailPasswordCopyWithImpl(this._self, this._then);

  final SignInWithEmailPassword _self;
  final $Res Function(SignInWithEmailPassword) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(SignInWithEmailPassword(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignUpWithEmailPassword implements AuthEvent {
  const SignUpWithEmailPassword({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpWithEmailPasswordCopyWith<SignUpWithEmailPassword> get copyWith => _$SignUpWithEmailPasswordCopyWithImpl<SignUpWithEmailPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpWithEmailPassword&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.signUpWithEmailPassword(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $SignUpWithEmailPasswordCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $SignUpWithEmailPasswordCopyWith(SignUpWithEmailPassword value, $Res Function(SignUpWithEmailPassword) _then) = _$SignUpWithEmailPasswordCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$SignUpWithEmailPasswordCopyWithImpl<$Res>
    implements $SignUpWithEmailPasswordCopyWith<$Res> {
  _$SignUpWithEmailPasswordCopyWithImpl(this._self, this._then);

  final SignUpWithEmailPassword _self;
  final $Res Function(SignUpWithEmailPassword) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(SignUpWithEmailPassword(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AuthState {

 String get msg; bool get isLoading; bool get isSuccess; ActionType get actionType; UserEntity? get userDetails;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.msg, msg) || other.msg == msg)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.userDetails, userDetails) || other.userDetails == userDetails));
}


@override
int get hashCode => Object.hash(runtimeType,msg,isLoading,isSuccess,actionType,userDetails);

@override
String toString() {
  return 'AuthState(msg: $msg, isLoading: $isLoading, isSuccess: $isSuccess, actionType: $actionType, userDetails: $userDetails)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 String msg, bool isLoading, bool isSuccess, ActionType actionType, UserEntity? userDetails
});




}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? msg = null,Object? isLoading = null,Object? isSuccess = null,Object? actionType = null,Object? userDetails = freezed,}) {
  return _then(_self.copyWith(
msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,actionType: null == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as ActionType,userDetails: freezed == userDetails ? _self.userDetails : userDetails // ignore: cast_nullable_to_non_nullable
as UserEntity?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,){
final _that = this;
switch (_that) {
case _AuthState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String msg,  bool isLoading,  bool isSuccess,  ActionType actionType,  UserEntity? userDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.msg,_that.isLoading,_that.isSuccess,_that.actionType,_that.userDetails);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String msg,  bool isLoading,  bool isSuccess,  ActionType actionType,  UserEntity? userDetails)  $default,) {final _that = this;
switch (_that) {
case _AuthState():
return $default(_that.msg,_that.isLoading,_that.isSuccess,_that.actionType,_that.userDetails);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String msg,  bool isLoading,  bool isSuccess,  ActionType actionType,  UserEntity? userDetails)?  $default,) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.msg,_that.isLoading,_that.isSuccess,_that.actionType,_that.userDetails);case _:
  return null;

}
}

}

/// @nodoc


class _AuthState implements AuthState {
  const _AuthState({this.msg = '', this.isLoading = false, this.isSuccess = false, this.actionType = ActionType.none, this.userDetails});
  

@override@JsonKey() final  String msg;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSuccess;
@override@JsonKey() final  ActionType actionType;
@override final  UserEntity? userDetails;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.msg, msg) || other.msg == msg)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.userDetails, userDetails) || other.userDetails == userDetails));
}


@override
int get hashCode => Object.hash(runtimeType,msg,isLoading,isSuccess,actionType,userDetails);

@override
String toString() {
  return 'AuthState(msg: $msg, isLoading: $isLoading, isSuccess: $isSuccess, actionType: $actionType, userDetails: $userDetails)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 String msg, bool isLoading, bool isSuccess, ActionType actionType, UserEntity? userDetails
});




}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? msg = null,Object? isLoading = null,Object? isSuccess = null,Object? actionType = null,Object? userDetails = freezed,}) {
  return _then(_AuthState(
msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,actionType: null == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as ActionType,userDetails: freezed == userDetails ? _self.userDetails : userDetails // ignore: cast_nullable_to_non_nullable
as UserEntity?,
  ));
}


}

// dart format on
