import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/config/routes.dart';
import 'package:st_peters_jacobite_church_flutter/model/areaunits_model.dart';
import 'package:st_peters_jacobite_church_flutter/screens/drawer/side_drawer.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/contact_bottomsheet.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/title_board.dart';

import '../../config/utils/enums.dart';
import '../../network/riverpod/providers.dart';
import '../../widgets/loading_widget.dart';
import 'widgets/spiritual_org_listtile.dart';

class SpiritualOrganisationsScreen extends ConsumerStatefulWidget {
  const SpiritualOrganisationsScreen({Key? key}) : super(key: key);

  static final _drawerKey = GlobalKey<ScaffoldState>();

  @override
  ConsumerState<SpiritualOrganisationsScreen> createState() =>
      _SpiritualOrganisationsScreenState();
}

class _SpiritualOrganisationsScreenState
    extends ConsumerState<SpiritualOrganisationsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(spiritualOrgProvider).getSpiritualOrganizations();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: SpiritualOrganisationsScreen._drawerKey,
      appBar: CustomAppbar(drawerKey: SpiritualOrganisationsScreen._drawerKey),
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
                    const TitleBoard(title: 'SPIRITUAL ORGANIZATIONS'),
                    const SizedBox(height: 5),
                    Consumer(builder: (_, ref, __) {
                      final data = ref.watch(spiritualOrgProvider);
                      if (data.status == ApiStatus.LOADING) {
                        return const Center(child: LoadingWidget());
                      } else if (data.status == ApiStatus.FAILED) {
                        return Center(child: Text(data.error));
                      } else if (data.status == ApiStatus.SUCCESS) {
                        return Flexible(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(
                                AppConstants.defaultPadding),
                            separatorBuilder: (context, index) {
                              return Image.asset(AppAssets.imageSeperator,
                                  scale: 3);
                            },
                            itemBuilder: (context, index) {
                              return SpritualOrgListTile(
                                index: index,
                                org: data.spiritualOrganizations[index],
                              );
                            },
                            itemCount: data.spiritualOrganizations.length,
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
      bottomSheet: const ContactBottomsheet(),
    );
  }
}
