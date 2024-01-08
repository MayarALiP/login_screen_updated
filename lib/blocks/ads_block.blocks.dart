import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:login_screen_updated/models/ads.models.dart';

// Events
abstract class AdsEvent {}

class LoadAdsEvent extends AdsEvent {}

// States
abstract class AdsState {}

class AdsLoadingState extends AdsState {}

class AdsLoadedState extends AdsState {
  final List<Ad> ads;

  AdsLoadedState(this.ads);
}

class AdsErrorState extends AdsState {
  final String error;

  AdsErrorState(this.error);
}

// Bloc
class AdsBloc extends Bloc<AdsEvent, AdsState> {
  AdsBloc() : super(AdsLoadingState()) {
    on<LoadAdsEvent>(_loadAds);
  }

  void _loadAds(LoadAdsEvent event, Emitter<AdsState> emit) async {
    emit(AdsLoadingState());
    try {
      var adsData = await rootBundle.loadString('assets/data/sample.json');
      var dataDecoded =
          List<Map<String, dynamic>>.from(jsonDecode(adsData)['ads']);
      List<Ad> adsList = dataDecoded.map((e) => Ad.fromJson(e)).toList();
      emit(AdsLoadedState(adsList));
    } catch (e) {
      emit(AdsErrorState("Error loading ads"));
    }
  }
}
