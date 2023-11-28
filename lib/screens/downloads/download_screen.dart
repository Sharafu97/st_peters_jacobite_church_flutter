import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/providers.dart';
import 'package:st_peters_jacobite_church_flutter/screens/drawer/side_drawer.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/title_board.dart';

import '../../config/utils/enums.dart';
import '../../widgets/contact_bottomsheet.dart';
import '../../widgets/loading_widget.dart';
import 'widgets/download_tile.dart';

class DownloadScreen extends ConsumerStatefulWidget {
  const DownloadScreen({super.key});

  @override
  ConsumerState<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends ConsumerState<DownloadScreen> {
  static final _drawerKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(downloadProvider).downloadList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                return const Center(child: LoadingWidget());
              } else if (data.status == ApiStatus.FAILED) {
                return Center(child: Text(data.error));
              } else if (data.status == ApiStatus.SUCCESS) {
                return Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(30),
                    itemCount: data.downloadItems.length,
                    separatorBuilder: (context, index) {
                      return Image.asset(AppAssets.imageSeperator, scale: 4);
                    },
                    itemBuilder: (context, index) {
                      return DownloadListTile(file: data.downloadItems[index]);
                    },
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
      bottomSheet: const ContactBottomsheet(),
    );
  }
}
