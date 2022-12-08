import '../../data/repository.dart';
import 'package:mobx/mobx.dart';

part 'profile.g.dart';

// ignore: library_private_types_in_public_api
class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  final Repository _repository;
  _ProfileStore(this._repository);

  @computed
  bool get profileInputDone => _repository.getProfileInputDone ?? false;
}
