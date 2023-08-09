part of 'instagram_bloc.dart';

@immutable
abstract class InstagramEvent {}
class Fetchinsta extends InstagramEvent{
  final String message;
  Fetchinsta({required this.message});
}
