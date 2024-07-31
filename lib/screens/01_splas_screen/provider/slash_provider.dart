
import 'package:ibiza/core/constants/storage_keys.dart';
import 'package:ibiza/core/view_model/base_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider extends BaseViewModel {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  ///USER TOKEN
  String? _token;
  String? get token => _token;

  getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString(USER_TOKEN);
  }
}
