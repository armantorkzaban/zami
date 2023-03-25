import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zemin/pages/custom_tile_page.dart';
import 'package:zemin/pages/interactive_page.dart';
import 'package:zemin/pages/markers_page.dart';
import 'package:zemin/pages/metro_lines_page.dart';
import 'package:zemin/pages/raster_map_page.dart';
import 'package:zemin/pages/shapes_page.dart';
import 'package:zemin/pages/twilight_page.dart';
import 'package:zemin/pages/vector_map_page.dart';

void main() => runApp(const MapApp());

class MapApp extends StatelessWidget {
  const MapApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map Examples',
      supportedLocales: const [Locale('en')],
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      theme: ThemeData(
        colorSchemeSeed: Colors.purple,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Examples'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Raster Map'),
            subtitle: const Text('Raster tiles from Google, OSM and etc.'),
            trailing: const Icon(Icons.chevron_right_sharp),
            onTap: () => _push(const RasterMapPage()),
          ),
          ListTile(
            title: const Text('Shapes'),
            subtitle: const Text('Display Polylines on the map.'),
            trailing: const Icon(Icons.chevron_right_sharp),
            onTap: () => _push(const ShapesPage()),
          ),
          ListTile(
            title: const Text('Custom Tiles'),
            subtitle: const Text('Use any Widget as map tiles.'),
            trailing: const Icon(Icons.chevron_right_sharp),
            onTap: () => _push(const CustomTilePage()),
          ),
          // ListTile(
          //   title: const Text('Metro Lines (Work in Progress)'),
          //   subtitle: const Text('Draw polyline overlays (Tehran Metro).'),
          //   trailing: const Icon(Icons.chevron_right_sharp),
          //   onTap: () => _push(const MetroLinesPage()),
          // ),
          // ListTile(
          //   title: const Text('Custom Projection'),
          //   subtitle:
          //       const Text('How we convert LatLng to XY. Useful for games.'),
          //   trailing: const Icon(Icons.chevron_right_sharp),
          //   onTap: _showNotImplemented,
          //   enabled: false,
          // ),
          // ListTile(
          //   title: const Text('Twilight'),
          //   subtitle: const Text('Day and night map, sun and moon position.'),
          //   trailing: const Icon(Icons.chevron_right_sharp),
          //   onTap: () => _push(const TwilightPage()),
          // ),
        ],
      ),
    );
  }

  void _showNotImplemented() {
    const snackBar =
        SnackBar(content: Text('This demo is not implemented yet.'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _push(Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}
