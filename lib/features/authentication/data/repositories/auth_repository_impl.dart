import '../../domain/repositories/auth_repository.dart';
import '../datasources/firebase_auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<void> signIn(String email, String password) async {
    await dataSource.signIn(email, password);
  }

  @override
  Future<void> signUp(String email, String password) async {
    await dataSource.signUp(email, password);
  }
}