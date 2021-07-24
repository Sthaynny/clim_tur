import 'package:bloc/bloc.dart';
import 'package:clim_tur/app/feature/home/domain/entity/clime_entity.dart';
import 'package:clim_tur/app/feature/home/domain/usercases/get_clime_local_usercase.dart';
import 'package:clim_tur/app/feature/home/domain/usercases/get_clime_usercase.dart';
import 'package:clim_tur/app/feature/home/domain/usercases/save_clime_local_usercase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required GetClimeUsercase usercase,
    required SaveLocalClimeUsercase saveLocalClimeUsercase,
    required GetClimeLocalUsercase localUsercase,
  })   : _usercase = usercase,
        _usercaseSaveLocal = saveLocalClimeUsercase,
        _usercaseGetLocal = localUsercase,
        super(HomeInitial());
  final GetClimeUsercase _usercase;
  final SaveLocalClimeUsercase _usercaseSaveLocal;
  final GetClimeLocalUsercase _usercaseGetLocal;
  Future<void> loadClimeApi(String search) async {
    emit(HomeLoading());
    final result = await _usercase(search);
    result.fold(
      (_) => emit(HomeLoadedError()),
      (clime) async {
        await _usercaseSaveLocal(clime);
        emit(HomeLoaded(clime));
      },
    );
  }

  Future loadClimeLocal() async {
    emit(HomeLoading());
    final result = await _usercaseGetLocal();
    if (result != null) {
      emit(HomeLoaded(result));
    } else {
      emit(HomeLoadedLocalError());
    }
  }
}
