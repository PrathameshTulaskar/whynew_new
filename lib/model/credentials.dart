import 'package:firebase_auth/firebase_auth.dart';

class Credentials {
  String userId;
  String identifier;
  String contactNumber;
  String emailAddress;
  String profileUrl;
  // UserCredential googleSignIn;
  // UserCredential fbSignIn;
  Credentials(
      {
        
      this.userId,
      // this.fbSignIn,
      // this.googleSignIn,
      this.identifier,
      this.emailAddress,this.profileUrl,
      this.contactNumber});
}
