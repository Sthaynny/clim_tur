import 'package:clim_tur/app/feature/home/presentation/components/change_theme_button_widget.dart';
import 'package:clim_tur/app/feature/home/presentation/components/clime_widget.dart';
import 'package:clim_tur/app/feature/home/presentation/cubit/home_cubit.dart';
import 'package:clim_tur/app/feature/search/search_screen.dart';
import 'package:clim_tur/app/injection_container.dart';
import 'package:clim_tur/app/shared/components/progress_indicator/progress_indicator_widget.dart';
import 'package:clim_tur/app/shared/ui/mixins/bottom_sheet.dart';
import 'package:clim_tur/core/ui/dimension_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with BottomSheetMixin {
  HomeCubit? cubit;
  @override
  void initState() {
    cubit = dependency<HomeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clim Tur'),
        actions: [
          ChangeThemeButtonWidget(),
        ],
        backgroundColor: Theme.of(context).appBarTheme.color,
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        bloc: cubit,
        listener: (context, state) {
          if (state is HomeInitial) {
            cubit?.loadClimeLocal();
          }
        },
        builder: (context, state) {
          if (state is HomeLoading) {
            return const ProgressIndicatorWidget();
          }
          if (state is HomeLoadedError) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 36.w),
                child: const Text(
                  '''Tivemos um problema ao carregar o clima...\n Tente novamente!''',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            );
          }
          if (state is HomeLoaded) {
            return Center(
              child: ClimeWidget(state.climeEntity),
            );
          }
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 300.w,
                  ),
                  const Text(
                    'Pesquise a cidade para visualizar o clima!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showDialog<String>(
            context: context,
            builder: (context) => const SearchScreen(),
          );

          if (result != null && result.isNotEmpty) {
            cubit!.loadClimeApi(result);
          }
        },
        backgroundColor: Theme.of(context).appBarTheme.color,
        child: Icon(
          Icons.search,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
