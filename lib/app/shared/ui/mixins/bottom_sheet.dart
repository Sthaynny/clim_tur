import 'package:clim_tur/core/ui/dimension_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin BottomSheetMixin {
  Future<String?> bottomSheetSearch(BuildContext context) {
    return showDialog<String>(
        context: context,
        useSafeArea: true,
        builder: (context) {
          final ValueNotifier<String> search = ValueNotifier('');
          return Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(10.w),
              ),
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Cidade:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.ssp,
                    ),
                  ),
                  TextField(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.ssp,
                    ),
                    onChanged: (value) {
                      search.value = value;
                    },
                  ),
                  const Divider(),
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
          );
        });
  }
}
