import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/model/download_model.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/providers.dart';
import 'package:st_peters_jacobite_church_flutter/screens/drawer/side_drawer.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/title_board.dart';

import '../../config/utils/enums.dart';
import '../../theme/color.dart';
import '../../theme/text_theme.dart';
import '../../widgets/contact_bottombar.dart';
import '../../widgets/loading_widget.dart';
import 'widgets/download_tile.dart';

class DownloadScreen extends ConsumerStatefulWidget {
  const DownloadScreen({super.key});

  @override
  ConsumerState<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends ConsumerState<DownloadScreen>
    with TickerProviderStateMixin {
  static final _drawerKey = GlobalKey<ScaffoldState>();
  late TabController tabController;

  List<String> tabs = ['GALLERY', 'PUBLICATIONS/MESSAGES', 'FORMS'];

  double tabwidth = 0;

  void _checkStoragePermission() async {
    try {
      if (AppConstants().isIOS) {
        await Permission.storage.request();
      } else {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        if (androidInfo.version.sdkInt >= 33) {
          await Permission.manageExternalStorage.request();
        } else {
          await Permission.storage.request();
        }
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    setupTabController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(downloadProvider).downloadList();
    });
    _checkStoragePermission();
    super.initState();
  }

  setupTabController() {
    tabController = TabController(length: 3, vsync: this)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    tabwidth = (MediaQuery.of(context).size.width - 30) / 3;
    return Scaffold(
      key: _drawerKey,
      appBar: CustomAppbar(drawerKey: _drawerKey),
      drawer: const SideDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imageLogoWatermark),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 55),
            const TitleBoard(title: 'DOWNLOADS'),
            Consumer(builder: (_, ref, __) {
              final data = ref.watch(downloadProvider);
              if (data.status == ApiStatus.LOADING) {
                return const Expanded(child: Center(child: LoadingWidget()));
              } else if (data.status == ApiStatus.FAILED) {
                return Expanded(child: Center(child: Text(data.error)));
              } else if (data.status == ApiStatus.SUCCESS) {
                return Expanded(
                  child: Column(
                    children: [
                      TabBar(
                        controller: tabController,
                        onTap: (i) {},
                        indicator: const BoxDecoration(
                          color: AppColors.brown995D3C,
                        ),
                        indicatorSize: TabBarIndicatorSize.label,
                        dividerColor: AppColors.transparent,
                        labelPadding: EdgeInsets.zero,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28, vertical: 20),
                        indicatorPadding: const EdgeInsets.only(bottom: 2),
                        tabs: List.generate(
                          3,
                          (index) => Container(
                              color: tabController.index != index
                                  ? AppColors.brown41210A
                                  : AppColors.transparent,
                              width: tabwidth,
                              height: 35,
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              alignment: Alignment.center,
                              child: Text(
                                tabs[index],
                                textAlign: TextAlign.center,
                                style: textTheme.labelSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    height: 0,
                                    color: AppColors.whiteFFFFFF),
                              )),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            tabView(data.galleryDownloadItems),
                            tabView(data.otherDownloadItems),
                            tabView(data.formDownloadItems),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
            const SizedBox(height: 20)
          ],
        ),
      ),
      bottomSheet: const ContactBottomBar(),
    );
  }

  Widget tabView(List<Downloads> downloadItems) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      itemCount: downloadItems.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 5);
      },
      itemBuilder: (context, index) {
        return DownloadListTile(file: downloadItems[index], index: index);
      },
    );
  }
}
