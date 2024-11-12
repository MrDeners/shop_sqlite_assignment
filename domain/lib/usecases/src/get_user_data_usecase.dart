import '../../domain.dart';
import 'usecase.dart';

class GetUserDataUseCase implements FutureUseCase<NoParams, int> {
  final UserDataRepository _userDataRepository;

  const GetUserDataUseCase({
    required UserDataRepository userDataRepository,
  }) : _userDataRepository = userDataRepository;

  @override
  Future<int> execute([NoParams? params]) async {
    return _userDataRepository.getUserId();
  }
}
