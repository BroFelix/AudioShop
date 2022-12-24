import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static var _instance;

  static AuthService get instance => _instance ??= AuthService._();

  AuthService._();

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<AuthStatus> mailSignUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthStatus.successful;
    } on FirebaseAuthException catch (error) {
      throw AuthExceptionHandler.generateErrorMessage(AuthExceptionHandler.handleAuthException(error));
    } finally {
      return AuthStatus.unknown;
    }
  }

  Future<AuthStatus> mailSignIn(
    String email,
    String password,
  ) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthStatus.successful;
    } on FirebaseAuthException catch (error) {
      throw AuthExceptionHandler.generateErrorMessage(AuthExceptionHandler.handleAuthException(error));
    } finally {
      return AuthStatus.unknown;
    }
  }

  Future resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return AuthStatus.successful;
    } catch (error) {
      print(error.toString());
      rethrow;
    } finally {
      return AuthStatus.unknown;
    }
  }

  Future<String?> signUpWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn(clientId: '722426845137-1e37be532he2bf988eok2utn2tcvbho4.apps.googleusercontent.com').signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );
      await _auth.signInWithCredential(credential);
      return 'Success';
    } on FirebaseAuthException catch (error) {
      throw AuthExceptionHandler.generateErrorMessage(AuthExceptionHandler.handleAuthException(error));
    } catch (error) {
      throw (error.toString());
    } finally {
      return null;
    }
  }

  Future<String?> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return AuthStatus.successful.name;
    } on FirebaseAuthException catch (error) {
      return AuthExceptionHandler.handleAuthException(error);
    }
  }

  Future<UserCredential?> signInWithFacebook() async {
    return null;

    // Trigger the sign-in flow
    // final loginResult = await FacebookAuth.instance.login();
    // Create a credential from the access token
    // final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken.token);
    // Once signed in, return the UserCredential
    // return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}

enum AuthStatus {
  successful,
  wrongPassword,
  emailAlreadyExists,
  invalidEmail,
  weakPassword,
  unknown,
}

class AuthExceptionHandler {
  static handleAuthException(FirebaseAuthException e) {
    AuthStatus status;
    switch (e.code) {
      case 'invalid-email':
        status = AuthStatus.invalidEmail;
        break;
      case 'wrong-password':
        status = AuthStatus.wrongPassword;
        break;
      case 'weak-password':
        status = AuthStatus.weakPassword;
        break;
      case 'email-already-in-use':
        status = AuthStatus.emailAlreadyExists;
        break;
      default:
        status = AuthStatus.unknown;
    }
    return status;
  }

  static String generateErrorMessage(AuthStatus error) {
    String errorMessage;
    switch (error) {
      case AuthStatus.invalidEmail:
        errorMessage = 'Your email address appears to be malformed.';
        break;
      case AuthStatus.weakPassword:
        errorMessage = 'Your password should be at least 6 characters.';
        break;
      case AuthStatus.wrongPassword:
        errorMessage = 'Your email or password is wrong.';
        break;
      case AuthStatus.emailAlreadyExists:
        errorMessage = 'The email address is already in use by another account.';
        break;
      default:
        errorMessage = 'An error occured. Please try again later.';
    }
    return errorMessage;
  }
}
