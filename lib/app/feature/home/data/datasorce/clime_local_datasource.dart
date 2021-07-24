import 'package:clim_tur/app/feature/home/data/models/clime_model.dart';
import 'package:clim_tur/app/feature/home/domain/entity/clime_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClimeLocalDatasource {
  Future<ClimeEntity?> getClimeLocal() async {
    final _prefs = await SharedPreferences.getInstance();
    try {
      final result = _prefs.getString('clime');
      if (result != null) return ClimeModel.fromJson(result);
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<bool> saveClimeLocal(ClimeEntity clime) async {
    final _prefs = await SharedPreferences.getInstance();
    try {
      return _prefs.setString('clime', (clime as ClimeModel).toJson());
    } catch (e) {
      return false;
    }
  }
}
