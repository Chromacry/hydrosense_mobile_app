import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hydrosense_mobile_app/src/models/user.dart';

class AuthService {
  Future<UserCredential> register({email, password}) {
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> login({email, password}) {
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> forgotPassword({email}) {
    return FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Stream<User?> getAuthUser() {
    return FirebaseAuth.instance.authStateChanges();
  }

  logOut() {
    return FirebaseAuth.instance.signOut();
  }

  Future<void> changePassword({required password }) {
    User? currentUser = getCurrentUser();
    return currentUser!.updatePassword(password);
  }

  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  String? getCurrentUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }
}
