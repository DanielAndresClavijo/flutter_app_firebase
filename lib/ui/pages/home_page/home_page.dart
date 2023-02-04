import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/model/route_info.dart';
import 'package:get/get.dart';

import 'package:flutter_app_firebase/injector.dart';
import 'package:flutter_app_firebase/ui/extensions/context_extension.dart';
import 'package:flutter_app_firebase/ui/pages/home_page/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Get.find<HomeController>();
  PageController pageController = PageController(initialPage: 2);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int currentPage = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: context.colorScheme.inversePrimary,
        toolbarHeight: 90,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Lorem Name',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.surface,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              controller.getPersonPhone,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.surface,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        leadingWidth: 70,
        leading: const Padding(
          padding: EdgeInsets.only(
            left: 16,
          ),
          child: Icon(
            Icons.account_circle_rounded,
            size: 60,
          ),
        ),
      ),
      endDrawer: Drawer(
        surfaceTintColor: context.colorScheme.surface,
        backgroundColor: context.colorScheme.surface,
        shadowColor: context.colorScheme.surface,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: context.colorScheme.inversePrimary,
              ),
              child: const Text(
                'MENU',
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              title: const Text('Ir a la sección 1 - Add'),
              onTap: () {
                closeDrawers();
                pageController.jumpToPage(0);
                setState(() {
                  currentPage = 0;
                });
              },
            ),
            ListTile(
              title: const Text('Ir a la sección 2 - Home'),
              onTap: () {
                closeDrawers();
                pageController.jumpToPage(1);
                setState(() {
                  currentPage = 1;
                });
              },
            ),
            ListTile(
              title: const Text('Ir a la sección 3 - Rutas'),
              onTap: () {
                closeDrawers();
                pageController.jumpToPage(2);
                setState(() {
                  currentPage = 2;
                });
              },
            ),
            ListTile(
              title: const Text('Ir a la sección 4 - Credit card'),
              onTap: () {
                closeDrawers();
                pageController.jumpToPage(3);
                setState(() {
                  currentPage = 3;
                });
              },
            ),
            ListTile(
              title: const Text('Ir a la sección 5 - Settings'),
              onTap: () {
                closeDrawers();
                pageController.jumpToPage(4);
                setState(() {
                  currentPage = 4;
                });
              },
            ),
            ListTile(
              title: const Text('Cerrar sesión'),
              onTap: () {
                closeDrawers();
                Get.offNamed(Injector.splashName);
              },
            ),
            ListTile(
              title: const Text('Cerrar Menu'),
              onTap: () {
                closeDrawers();
              },
            ),
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        children: [
          const Center(
            child: Text("Add"),
          ),
          const Center(
            child: Text("Home"),
          ),
          FutureBuilder<List<RouteInfo>>(
            future: controller.getRoutes(),
            builder: (context, snapshot) {
              if (snapshot.data == null ||
                  snapshot.data?.isEmpty == true ||
                  snapshot.connectionState == ConnectionState.none) {
                return const Center(
                  child: Text("No tienes ninguna ruta"),
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 16,
                        right: 16,
                      ),
                      child: Text(
                        "Rutas disponibles",
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemExtent: 100,
                        padding: const EdgeInsets.all(16),
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 9),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              border: Border.all(
                                width: 2,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.room_outlined,
                                  size: 56,
                                  color: context.colorScheme.outlineVariant,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data?[index].name ??
                                          "Ruta no encontrada",
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      getDistanceText(
                                          snapshot.data?[index].distance),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
              return const CircularProgressIndicator();
            },
          ),
          const Center(
            child: Text("Credict Card"),
          ),
          const Center(
            child: Text("Settings"),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: context.colorScheme.inversePrimary,
        padding: const EdgeInsets.only(top: 5),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          onTap: (value) {
            pageController.jumpToPage(value);
            setState(() {
              currentPage = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.add,
                color: currentPage == 0
                    ? context.colorScheme.inversePrimary
                    : context.colorScheme.scrim,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.home,
                color: currentPage == 1
                    ? context.colorScheme.inversePrimary
                    : context.colorScheme.scrim,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.credit_card,
                color: currentPage == 2
                    ? context.colorScheme.inversePrimary
                    : context.colorScheme.scrim,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.monetization_on_outlined,
                color: currentPage == 3
                    ? context.colorScheme.inversePrimary
                    : context.colorScheme.scrim,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.settings_rounded,
                color: currentPage == 4
                    ? context.colorScheme.inversePrimary
                    : context.colorScheme.scrim,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getDistanceText(int? distance) {
    return "${(distance ?? 0) / 1000} Km";
  }

  void closeDrawers() {
    if (_scaffoldKey.currentState != null) {
      if (_scaffoldKey.currentState!.isDrawerOpen) {
        _scaffoldKey.currentState!.closeDrawer();
      } else if (_scaffoldKey.currentState!.isEndDrawerOpen) {
        _scaffoldKey.currentState!.closeEndDrawer();
      }
    }
  }
}
