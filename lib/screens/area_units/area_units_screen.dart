import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/enums.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/providers.dart';
import 'package:st_peters_jacobite_church_flutter/screens/area_units/widgets/areaunits_tile.dart';
import 'package:st_peters_jacobite_church_flutter/screens/drawer/side_drawer.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/contact_bottombar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/loading_widget.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/title_board.dart';

class AreaUnitsScreen extends ConsumerStatefulWidget {
  const AreaUnitsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AreaUnitsScreen> createState() => _AreaUnitsScreenState();
}

class _AreaUnitsScreenState extends ConsumerState<AreaUnitsScreen> {
  static final _drawerKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(areaUnitsProvider).getAreaUnits();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _drawerKey,
      appBar: CustomAppbar(
        drawerKey: _drawerKey,
      ),
      drawer: const SideDrawer(),
      body: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Stack(
            children: [
              Positioned(
                top: screenHeight * 0.15,
                child: Image.asset(
                  AppAssets.imageLogoWatermark,
                  width: constraints.maxWidth,
                  scale: 2,
                ),
              ),
              SizedBox(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: Column(
                  children: [
                    const SizedBox(height: 55),
                    const TitleBoard(title: 'AREA UNITS'),
                    const SizedBox(height: 5),
                    Consumer(builder: (_, ref, __) {
                      final data = ref.watch(areaUnitsProvider);
                      if (data.status == ApiStatus.LOADING) {
                        return const Expanded(
                            child: Center(child: LoadingWidget()));
                      } else if (data.status == ApiStatus.FAILED) {
                        return Expanded(child: Center(child: Text(data.error)));
                      } else if (data.status == ApiStatus.SUCCESS) {
                        return Flexible(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(
                                AppConstants.defaultPadding),
                            itemCount: data.areaUnits.length,
                            separatorBuilder: (context, index) {
                              return Image.asset(AppAssets.imageSeperator,
                                  scale: 3);
                            },
                            itemBuilder: (context, index) {
                              return AreaUnitsListTile(
                                  index: index,
                                  areaUnit: data.areaUnits[index]);
                            },
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                    const SizedBox(height: 45),
                  ],
                ),
              )
            ],
          ),
        );
      }),
      bottomSheet: const ContactBottomBar(),
    );
  }
}
