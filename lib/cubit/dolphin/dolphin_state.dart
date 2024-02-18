


abstract class DolphinState{
  final String? photoUrl;

  DolphinState({ this.photoUrl});
}

class DolphinInitial extends DolphinState {
  DolphinInitial({super.photoUrl});
}


class SuccessState extends DolphinState{
  SuccessState({super.photoUrl});
}


class FailedState extends DolphinState{}

class PauseState extends DolphinState{}
class PlayState extends DolphinState{}
class RewindState extends DolphinState{}


class AddedPhotoSuccessfully extends DolphinState{}


class PhotoIndexAdded extends DolphinState{}

