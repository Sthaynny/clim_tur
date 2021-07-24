import 'package:clim_tur/core/ui/dimension_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  final ValueNotifier<String> search = ValueNotifier('');
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _animationController?.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
    search.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        alignment: Alignment.bottomCenter,
        child: SafeArea(
          bottom: false,
          left: false,
          right: false,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(_animationController!),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(10.w),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 24.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10.w),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Cidade:",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.ssp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.ssp,
                      ),
                      onChanged: (value) {
                        search.value = value;
                      },
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: search,
                    builder: (context, String value, child) => CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: value.isNotEmpty
                          ? () {
                              Navigator.pop(context, value);
                            }
                          : null,
                      child: Text(
                        'Search'.toUpperCase(),
                        style: TextStyle(color: Colors.red[300]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
