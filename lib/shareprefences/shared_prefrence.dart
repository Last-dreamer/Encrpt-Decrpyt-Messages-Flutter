import 'package:openpgp/openpgp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefrences {
  static SharedPreferences? preferences;

  static const userNameKey = 'username';
  static const bitsKey = 'BitsKey';
  static const validationKey = 'ValidationKey';
  static const passphraseKey = 'passphrase';
  static Future init() async =>
      preferences = await SharedPreferences.getInstance();

  static Future setUserName(String username) async {
    await preferences!.setString(userNameKey, username);
  }


  static Future setPubK(String enc) async {
    await preferences!.setString("public", enc);
  }

  static getPubK() {
    final key = preferences!.getString('public');
    key == null ? 'Please Username' : key;
    // print("itS enc $key");
    return key;
  }

  static Future setPrivK(String enc) async {
    await preferences!.setString("private", enc);
  }

  static getPrivK() {
    final key = preferences!.getString('private');
    key == null ? 'Please Username' : key;
    // print("itS provat $key");
    return key;
  }



  static Future setEnc(String enc) async {
    await preferences!.setString("Enc", enc);
  }

  static getUser() {
    final username = preferences!.getString(userNameKey);
    username == null ? 'Please Username' : username;
    print(username);
    return username;
  }


  static getEnc() {
    final Enc = preferences!.getString('Enc');
    Enc == null ? 'Please Enc' : Enc;
    print("itS enc $Enc");
    return Enc;
  }

  static Future setBits(int bitsValue) async {
    await preferences!.setInt(bitsKey, bitsValue);
  }

  static getBits() async {
    final bits = preferences!.getInt(bitsKey);
    print(bits);
    return bits;
  }

  static Future setValidation(String date) async {
    await preferences!.setString(validationKey, date);
  }

  static getValidation() {
    final date = preferences!.getString(validationKey);
    date == null ? 'YY/MM/DD (Default not expire)' : date;
    print(date);
    return date;
  }

  static Future setPassphrase(String passphrase) async {
    await preferences!.setString(passphraseKey, passphrase);
  }

  static getPassphrase() {
    final pass = preferences!.getString(passphraseKey);
    pass == null ? 'YY/MM/DD (Default not expire)' : pass;
    print(pass);
    return pass;
  }
}
