import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/auth_response_model.dart';

class AuthService {
  AuthService({FirebaseAuth? firebaseAuth})
    : _auth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Must be called once at app startup, before any Google sign-in attempt.
  /// Replace the serverClientId below with your actual Web Client ID
  /// from Firebase Console -> Project Settings -> your Android/iOS app,
  /// or Google Cloud Console -> APIs & Services -> Credentials.
  Future<void> initializeGoogleSignIn() async {
    await _googleSignIn.initialize(
      serverClientId:
          '778026764896-ra4v7k6889lvupankvp47l9387l88ejc.apps.googleusercontent.com',
    );
  }

  Future<AuthResponseModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      return AuthResponseModel.success();
    } on FirebaseAuthException catch (e) {
      return AuthResponseModel.failure(_firebaseError(e));
    } catch (_) {
      return AuthResponseModel.failure('Something went wrong.');
    }
  }

  Future<AuthResponseModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      await credential.user?.updateDisplayName(name);

      return AuthResponseModel.success();
    } on FirebaseAuthException catch (e) {
      return AuthResponseModel.failure(_firebaseError(e));
    } catch (_) {
      return AuthResponseModel.failure('Something went wrong.');
    }
  }

  Future<AuthResponseModel> googleSignIn() async {
    try {
      final googleUser = await _googleSignIn.authenticate();

      final idToken = googleUser.authentication.idToken;

      final credential = GoogleAuthProvider.credential(idToken: idToken);

      await _auth.signInWithCredential(credential);

      return AuthResponseModel.success();
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return AuthResponseModel.failure('Sign-in cancelled.');
      }
      return AuthResponseModel.failure('Google sign-in failed.');
    } on FirebaseAuthException catch (e) {
      return AuthResponseModel.failure(_firebaseError(e));
    } catch (_) {
      return AuthResponseModel.failure('Something went wrong.');
    }
  }

  Future<AuthResponseModel> sendPasswordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());

      return AuthResponseModel.success();
    } on FirebaseAuthException catch (e) {
      return AuthResponseModel.failure(_firebaseError(e));
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  String _firebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'Invalid email address.';

      case 'user-not-found':
        return 'No account found.';

      case 'wrong-password':
        return 'Incorrect password.';

      case 'invalid-credential':
        return 'Invalid email or password.';

      case 'email-already-in-use':
        return 'Email already exists.';

      case 'weak-password':
        return 'Password is too weak.';

      case 'network-request-failed':
        return 'Network error.';

      default:
        return e.message ?? 'Authentication failed.';
    }
  }
}
