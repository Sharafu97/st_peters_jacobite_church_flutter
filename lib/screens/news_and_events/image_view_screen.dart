import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/loading_widget.dart';

class ImageViewScreen extends StatefulWidget {
  const ImageViewScreen({Key? key, required this.images}) : super(key: key);
  final List<String> images;

  @override
  State<ImageViewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const CustomAppbar(),
      body: PageView.builder(
        itemCount: widget.images.length,
        itemBuilder: (context, index) {
          return InteractiveViewer(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -
                  const CustomAppbar().preferredSize.height,
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
