import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth {
  Stream<User?> get userChanges;
  Future<User?> signInAnonymously();
  Future<User?> signInWithGoogle();
  Future<User?> signInWithFacebook();
  Future<void> signOut();
}

class Auth implements BaseAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Stream<User?> get userChanges => _auth.authStateChanges();

  @override
  Future<User?> signInAnonymously() async {
    final UserCredential? _userCredential = await _auth.signInAnonymously();
    return _userCredential?.user;
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<User?> signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication? _googleSignInAuthentication =
        await googleSignInAccount?.authentication;
    final OAuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: _googleSignInAuthentication?.idToken,
      accessToken: _googleSignInAuthentication?.accessToken,
    );
    final UserCredential? _userCredential =
        await _auth.signInWithCredential(authCredential);
    return _userCredential?.user;
  }

  @override
  Future<User?> signInWithFacebook() async {
    final FacebookAuth facebookAuth = FacebookAuth.instance;
    final LoginResult? _facebookLoginResult = await facebookAuth.login();

    if (_facebookLoginResult?.status == LoginStatus.success) {
      final OAuthCredential authCredential = FacebookAuthProvider.credential(
        _facebookLoginResult!.accessToken!.token,
      );

      final UserCredential? _userCredential =
          await _auth.signInWithCredential(authCredential);

      return _userCredential?.user;
    } else {
      throw FirebaseAuthException(code: 'FAILED_TO_LOGIN_WITH_FACEBOOK');
    }
  }
}
