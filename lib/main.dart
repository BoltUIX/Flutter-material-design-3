import 'package:flutter/material.dart';
import 'ScreenExplore.dart';
import 'ScreenAbout.dart';
import 'component/navigation.dart';
import 'ScreenComponents.dart';

/*This is a Flutter app that demonstrates how to use Material Design components.
 The app allows you to switch between two different versions of Material Design, Material 2 and Material 3. You can also change the theme of the app, such as changing the color scheme and switching between light and dark mode. The app has three screens, "ScreenComponents", "ScreenExplore", and "ScreenAbout". The main purpose of the app is to show how Material Design components can be used in a Flutter app.*/

void main() {
  runApp(const Material3Demo());
}

class Material3Demo extends StatefulWidget {
  const Material3Demo({super.key});

  @override
  State<Material3Demo> createState() => _Material3DemoState();
}

const Color m3BaseColor = Color(0xff6750a4);
const List<Color> colorOptions = [
  m3BaseColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];
const List<String> colorText = <String>[
  "M3 Baseline",
  "Blue",
  "Teal",
  "Green",
  "Yellow",
  "Orange",
  "Pink",
];

class _Material3DemoState extends State<Material3Demo> {
  bool useMaterial3 = true;
  bool useLightMode = true;
  int colorSelected = 0;
  int screenIndex = 0;

  late ThemeData themeData;

  @override
  initState() {
    super.initState();
    themeData = updateThemes(colorSelected, useMaterial3, useLightMode);
  }

  ThemeData updateThemes(int colorIndex, bool useMaterial3, bool useLightMode) {
    return ThemeData(
        colorSchemeSeed: colorOptions[colorSelected],
        useMaterial3: useMaterial3,
        brightness: useLightMode ? Brightness.light : Brightness.dark);
  }

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  void handleBrightnessChange() {
    setState(() {
      useLightMode = !useLightMode;
      themeData = updateThemes(colorSelected, useMaterial3, useLightMode);
    });
  }

  void handleMaterialVersionChange() {
    setState(() {
      useMaterial3 = !useMaterial3;
      themeData = updateThemes(colorSelected, useMaterial3, useLightMode);
    });
  }

  void handleColorSelect(int value) {
    setState(() {
      colorSelected = value;
      themeData = updateThemes(colorSelected, useMaterial3, useLightMode);
    });
  }

  Widget createScreenFor(int screenIndex) {//, bool showNavBarExample
    switch (screenIndex) {
      case 0:
        return const ScreenComponents();
      case 1:
        return const ScreenExplore();
      case 2:
        return const ScreenAbout();
      default:
        return const ScreenComponents();
    }
  }

  PreferredSizeWidget createAppBar() {
    return AppBar(
      title: useMaterial3 ? const Text("Material 3") : const Text("Material 2"),
      actions: [
        IconButton(
          icon: useLightMode
              ? const Icon(Icons.wb_sunny_outlined)
              : const Icon(Icons.wb_sunny),
          onPressed: handleBrightnessChange,
          tooltip: "Toggle brightness",
        ),
        IconButton(
          icon: useMaterial3
              ? const Icon(Icons.filter_3)
              : const Icon(Icons.filter_2),
          onPressed: handleMaterialVersionChange,
          tooltip: "Switch to Material ${useMaterial3 ? 2 : 3}",
        ),
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          itemBuilder: (context) {
            return List.generate(colorOptions.length, (index) {
              return PopupMenuItem(
                  value: index,
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          index == colorSelected
                              ? Icons.color_lens
                              : Icons.color_lens_outlined,
                          color: colorOptions[index],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(colorText[index]))
                    ],
                  ));
            });
          },
          onSelected: handleColorSelect,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material 3',
      themeMode: useLightMode ? ThemeMode.light : ThemeMode.dark,
      theme: themeData,
      home:
         Scaffold(
             appBar: createAppBar(),

             body: Row(children: <Widget>[
                createScreenFor(screenIndex),
             ]),

             bottomNavigationBar: NavigationBars(
              onSelectItem: handleScreenChanged,
              selectedIndex: screenIndex,
             ),


           floatingActionButton: FloatingActionButton(
               heroTag: "fab",
               elevation: 3,
               child: const Icon(Icons.arrow_downward),
               onPressed: () {
                 setState(() {
                 });
               }
           ),

         ),
    );
  }
}
