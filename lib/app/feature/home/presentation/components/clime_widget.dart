import 'package:clim_tur/app/feature/home/domain/entity/clime_entity.dart';
import 'package:clim_tur/app/feature/home/presentation/components/text_clime_widget.dart';
import 'package:clim_tur/app/feature/home/presentation/components/title_widget.dart';
import 'package:clim_tur/core/ui/dimension_screen.dart';
import 'package:flutter/material.dart';

class ClimeWidget extends StatelessWidget {
  const ClimeWidget(
    this.climeEntity, {
    Key? key,
  }) : super(key: key);
  final ClimeEntity climeEntity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitleCenterWidget(
            title: climeEntity.name,
            fontSize: 24.ssp,
            fontWeight: FontWeight.w500,
            padding: EdgeInsets.symmetric(vertical: 8.h),
          ),
          TextClimeWidget(
            climeEntity: climeEntity,
          ),
          TitleCenterWidget(
            title:
                '''Humidade: ${climeEntity.weatherForecast.humidity}% | Min: ${climeEntity.weatherForecast.tempMin} ºC | Max: ${climeEntity.weatherForecast.tempMax} ºC''',
            fontSize: 12.ssp,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
