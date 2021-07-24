import 'package:clim_tur/app/feature/home/domain/entity/clime_entity.dart';
import 'package:clim_tur/app/feature/home/presentation/components/title_widget.dart';
import 'package:clim_tur/core/ui/dimension_screen.dart';
import 'package:flutter/material.dart';

class TextClimeWidget extends StatelessWidget {
  const TextClimeWidget({Key? key, required this.climeEntity})
      : super(key: key);
  final ClimeEntity climeEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TitleCenterWidget(
          title: '${climeEntity.weatherForecast.temp} ºC',
          fontSize: 50.ssp,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          fontWeight: FontWeight.bold,
        ),
        if (climeEntity.weather.isNotEmpty)
          Container(
            width: 100.w,
            height: 100.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                stops: [
                  0.5,
                  0.9,
                ],
                colors: [
                  climeEntity.weather[0].icon.contains('n')
                      ? Colors.blue.shade900.withOpacity(0.60)
                      : Colors.blueAccent.shade100.withOpacity(0.60),
                  Colors.white30,
                ],
              ),
              borderRadius: BorderRadius.circular(12.w),
              image: DecorationImage(
                image: NetworkImage(
                    'https://openweathermap.org/img/wn/${climeEntity.weather[0].icon}@2x.png'),
                fit: BoxFit.fill,
              ),
            ),
          )
      ],
    );
  }
}
