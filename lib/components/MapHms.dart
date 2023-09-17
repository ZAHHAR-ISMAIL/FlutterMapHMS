import 'package:flutter/material.dart';
import 'package:huawei_map/huawei_map.dart';

class MapHmsWidget extends StatefulWidget {
  const MapHmsWidget({super.key});

  @override
  State<MapHmsWidget> createState() => _MapHmsWidgetState();
}

class _MapHmsWidgetState extends State<MapHmsWidget> {
  @override
  void initState() {
    _initHMSMap();
    super.initState();
  }

  void _initHMSMap() {
    HuaweiMapInitializer.initializeMap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Map"),
      ),
      body: const Stack(children: <Widget>[
        HuaweiMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(41.012959, 28.997438),
            zoom: 12,
          ),
          mapType: MapType.normal,
          tiltGesturesEnabled: true,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
        )
      ]),
    );
  }
}
