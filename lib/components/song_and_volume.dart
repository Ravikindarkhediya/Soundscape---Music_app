import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/config/colors.dart';
import 'package:music_app/controller/song_player_controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SongAndVolume extends StatelessWidget {
  const SongAndVolume({super.key});

  @override
  Widget build(BuildContext context) {
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    return Obx(
      () => SfRadialGauge(
        animationDuration: 1,
        enableLoadingAnimation: true,
        axes: [
          RadialAxis(
            useRangeColorForAxis: true,
            startAngle: 0,
            endAngle: 180,
            canRotateLabels: false,
            interval: 10,
            isInversed: false,
            minimum: 0,
            maximum: 1,
            showAxisLine: true,
            showLabels: false,
            showTicks: false,
            ranges: [
              GaugeRange(
                startValue: 0,
                endValue: songPlayerController.volumeLevel.value,
                color: primaryColor,
              )
            ],
            pointers: [
              MarkerPointer(
                color: primaryColor,
                borderWidth: 30,
                value: songPlayerController.volumeLevel.value,
                onValueChanged: (newValue) {
                  songPlayerController.changeVolume(newValue);
                },
                enableAnimation: true,
                enableDragging: true,
                markerType: MarkerType.diamond,
                markerHeight: 25,
                markerWidth: 25,
              )
            ],
            annotations: [
              GaugeAnnotation(
                  horizontalAlignment: GaugeAlignment.center,
                  widget: Container(
                    width: 220,
                    height: 220,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/carousel_img3.jpeg',
                            ),
                            fit: BoxFit.cover),
                        color: divColor,
                        borderRadius: BorderRadius.circular(1000)),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
