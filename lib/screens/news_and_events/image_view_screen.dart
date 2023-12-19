import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/screens/drawer/side_drawer.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/loading_widget.dart';

class ImageViewScreen extends StatefulWidget {
  const ImageViewScreen({super.key, required this.images});
  final List<String> images;

  @override
  State<ImageViewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  static final _drawerKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      appBar: CustomAppbar(drawerKey: _drawerKey),
      drawer: const SideDrawer(),
      body: PageView.builder(
        itemCount: widget.images.length,
        itemBuilder: (context, index) {
          return InteractiveViewer(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -
                  CustomAppbar(drawerKey: _drawerKey).preferredSize.height,
              child: CachedNetworkImage(
                imageUrl: widget.images[index],
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width,
                progressIndicatorBuilder: (context, url, progress) =>
                    const Center(
                  child: LoadingWidget(),
                ),
              ),
            ),
          );
        },
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('${_currentIndex + 1}/${widget.images.length}'),
      ),
    );
  }
}
