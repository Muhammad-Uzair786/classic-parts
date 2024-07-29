import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier
{
  Locale? _applocale;
  Locale? get applocal=>_applocale;
  String? isUrdu;
  Future<void> changelocaletype(Locale type)
  async {
    SharedPreferences _sp=await SharedPreferences.getInstance();
    _applocale=type;
    if(type==Locale("en"))
      {
        _sp.setString('language_code', 'en');
        print("eng");

      }else
      {
        _sp.setString('language_code', 'ur');
        print("urdu");

      }

    notifyListeners();

  }
  getlocal()
  async {
    SharedPreferences _sp=await SharedPreferences.getInstance();
    _applocale=Locale(_sp.getString('language_code')??'en');
  notifyListeners();
  }



}