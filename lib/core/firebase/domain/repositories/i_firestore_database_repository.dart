import 'package:splittr/core/user/data/dtos/user_dto.dart';
import 'package:splittr/utils/utils.dart';

abstract interface class IFirestoreDatabaseRepository {
  FutureEitherFailure<UserDto> saveUser(UserDto user);

  FutureEitherFailure<UserDto> updateUser(UserDto user);

  FutureEitherFailure<UserDto> fetchUser(String userId);

  Future<void> deleteUser(String userId);
}
