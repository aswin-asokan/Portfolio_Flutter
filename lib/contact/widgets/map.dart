import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';

class MapWidget extends StatelessWidget {
  final LatLng location = const LatLng(10.1004, 76.3570); // Aluva, Kerala
  final double initialZoom = 13;

  const MapWidget({super.key});

  void _launch(String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw Exception('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launch("https://maps.app.goo.gl/tSvhm3HRWSR3cbjz6");
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          height: 140,
          child: FlutterMap(
            options: MapOptions(
              initialCenter: location,
              initialZoom: initialZoom,
              interactionOptions: const InteractionOptions(
                flags: ~InteractiveFlag.all, // Disable map interactions
              ),
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://mt.google.com/vt/lyrs=m&x={x}&y={y}&z={z}",
                subdomains: const ['a', 'b', 'c'],
                tileProvider: CancellableNetworkTileProvider(),
                userAgentPackageName: 'com.example.portfolio',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: location,
                    width: 40,
                    height: 40,
                    child: GestureDetector(
                      onTap: () {
                        _launch("https://maps.app.goo.gl/tSvhm3HRWSR3cbjz6");
                      },
                      child: Icon(
                        Icons.location_pin,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
