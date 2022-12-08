import 'package:cybernate_retail_mobile/data/repository.dart';
import 'package:mobx/mobx.dart';

part 'introduction.g.dart';

// ignore: library_private_types_in_public_api
class IntroductionStore = _IntroductionStore with _$IntroductionStore;

abstract class _IntroductionStore with Store {
  final Repository _repository;
  _IntroductionStore(this._repository);

  bool get checkIfIntroductionIsDone =>
      _repository.checkIfIntroductionIsDone ?? false;

  @action
  Future<bool> setIntroductionDone() async {
    return await _repository.setIntroductionIsDone();
  }
}
