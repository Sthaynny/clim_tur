import 'package:clim_tur/app/feature/home/data/models/clime_model.dart';
import 'package:clim_tur/app/feature/home/domain/entity/clime_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClimeLocalDatasource {
  Future<ClimeEntity?> getClimeLocal(String search) async {
    final _prefs = await SharedPreferences.getInstance();
    try {
      final response = _prefs.getStringList('climes') ?? <String>[];
      final result =
          response.map((clime) => ClimeModel.fromJson(clime)).toList();

      return result.firstWhere(
        (element) => element.name.toLowerCase().contains(search.toLowerCase()),
      );
    } catch (e) {
      return null;
    }
  }

  Future<bool> saveClimeLocal(ClimeEntity clime) async {
    final _prefs = await SharedPreferences.getInstance();
    try {
      final response = _prefs.getStringList('climes') ?? <String>[];
      final List<ClimeEntity> result =
          response.map((clime) => ClimeModel.fromJson(clime)).toList();
      if (result.length > 10) {
        result.removeLast();
      }

      result.insert(0, clime as ClimeModel);
      final List<String> listData =
          result.map((e) => (e as ClimeModel).toJson()).toList();
      return _prefs.setStringList('climes', listData);
    } catch (e) {
      return false;
    }
  }
}
