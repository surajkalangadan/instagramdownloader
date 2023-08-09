part of 'instagram_bloc.dart';

@immutable
abstract class InstagramState {}

class InstagramInitial extends InstagramState {}
class InstagramLoading extends InstagramState {}
class InstagramLoaded extends InstagramState {}
class InstagramError extends InstagramState{}
