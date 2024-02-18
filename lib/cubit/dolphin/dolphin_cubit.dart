import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/constants/utils.dart';
import 'package:new_app/services/dolphin_service.dart';

import '../../models/dolphin_model.dart';
import 'dolphin_state.dart';

class DolphinCubit extends Cubit<DolphinState> {
  static DolphinCubit get(context) => BlocProvider.of(context);

  late final StreamController<DolphinModel> _streamController;
  late final Stream<DolphinModel> _dolphinStream;

  bool isPlaying = true;
  int showCount = 0;
  bool showMemory = false;
  String photoUrl='';
  List<DolphinModel> photos = [];

  DolphinCubit()
      : super(DolphinInitial(
            photoUrl:
                'https://api.unsplash.com/photos/random?query=dolphin&client_id=jzvgudAi28obHbOw87rNGI_dcO3hrxG4ugPlYYYByJY')) {
    _streamController = StreamController<DolphinModel>();
    _dolphinStream = _streamController.stream.asBroadcastStream();
    _initializeStream();
  }

  Stream<DolphinModel> get dolphinStream => _dolphinStream;

  void _initializeStream() async {
    isPlaying = true;
    while (isPlaying) {
      final DolphinModel image = await DolphinService.fetchRandomDolphinPhoto();
      _streamController.add(image);
      showCount++;
      addToMemory(image);
      await Future.delayed(const Duration(seconds: 2));
    }
  }

  void addToMemory(DolphinModel dolphin) {
    if (photos.length >= 5) {
      photos.removeAt(0);
      photos.add(dolphin);
    } else {
      photos.add(dolphin);
    }

    emit(AddedPhotoSuccessfully());
  }

  void pauseFetchingPhoto() {
    if (isPlaying) {
      isPlaying = false;
      emit(PauseState());
    }
  }

  void playFetchingPhoto() {
    if (!isPlaying) {
      isPlaying = true;
      showMemory = false;
      photoUrl='';
      _initializeStream();
    }
    emit(PlayState());
  }

  void rewind() {
    pauseFetchingPhoto();
    showMemory = true;
    photoUrl=photos.last.photoUrl;
    if (photos.length > 5) {
      showToast(
          text: 'Cannot remember any more dolphins',
          state: ToastStates.WARNING);
    }
    emit(RewindState());
  }

  void setPhotoIndex(int index) {
    photoUrl=photos[index].photoUrl;
    emit(PhotoIndexAdded());
  }

  @override
  Future<void> close() async {
    await _streamController.close();
    return super.close();
  }
}

