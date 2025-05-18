import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';

class MapWidget extends StatelessWidget {
  final LatLng location = const LatLng(10.1004, 76.3570); // Aluva, Kerala
  final double initialZoom = 13;
  final bool isDark;

  const MapWidget({super.key, required this.isDark});
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
                flags: ~InteractiveFlag.all, // Disable all map interactions
              ),
            ),
            children: [
              TileLayer(
                urlTemplate:
                    isDark
                        ? "https://tiles.stadiamaps.com/tiles/alidade_smooth_dark/{z}/{x}/{y}{r}.png"
                        : "https://tiles.stadiamaps.com/tiles/alidade_smooth/{z}/{x}/{y}{r}.png",
                tileProvider: CancellableNetworkTileProvider(),
                userAgentPackageName: 'com.example.portfolio',
                retinaMode: false,
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
                      child: const Icon(
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
