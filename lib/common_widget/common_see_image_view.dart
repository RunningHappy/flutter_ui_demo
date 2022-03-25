import 'package:app_assembly/app_assembly.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view_gallery.dart';

class CommonImageView extends StatefulWidget {
  final int currentIndex;
  final List<String> imageList;
  final double minScale;
  final double maxScale;
  final Function(int) downLoad;
  const CommonImageView({Key? key,this.currentIndex = 0,required this.imageList,this.minScale = 0.5,this.maxScale = 3,required this.downLoad}) : super(key: key);

  @override
  _CommonImageViewState createState() => _CommonImageViewState();
}

class _CommonImageViewState extends State<CommonImageView> {

  var currentIndex = 1;

  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
      initialPage: widget.currentIndex,
    );
    _pageController.addListener(() {

    });
    setState(() {
      currentIndex = widget.currentIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.close,
            color: Colors.white,
            size: 24.sp,
          ),
        ),
        title: Text(
          currentIndex.toString() + '/' + widget.imageList.length.toString(),
          style: TextStyle(
              fontSize: 15.sp,
              color: Colors.white
          ),
        ),
        actions: [
          Icon(
            Icons.close,
            color: Colors.transparent,
            size: 24.sp,
          ),
        ],
      ),
      body: Stack(
        children: [
          PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return widget.imageList[index].contains('http') || widget.imageList[index].contains('https') ? PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(
                  widget.imageList[index],
                )
              ) : PhotoViewGalleryPageOptions(
                imageProvider: AssetImage(
                  widget.imageList[index],
                ),
              );
            },
            itemCount: widget.imageList.length,
            backgroundDecoration: const BoxDecoration(color: Colors.black),
            pageController: PageController(initialPage: widget.currentIndex),
            onPageChanged: (index){
              setState(() {
                currentIndex = index + 1;
              });
            }
          ),
          Positioned(
            right: 10.w,
            bottom: 10.w,
            child: GestureDetector(
              onTap: (){
                widget.downLoad(currentIndex - 1);
              },
              child: Icon(
                Icons.download_sharp,
                color: Colors.white,
                size: 24.sp,
              ),
            )
          )
        ],
      )
    );
  }
}

class ImageItem extends StatefulWidget {
  final String imageUrl;
  final double minScale;
  final double maxScale;
  final Object heroTag;
  const ImageItem({Key? key,required this.imageUrl,this.minScale = 0.5,this.maxScale = 3,required this.heroTag}) : super(key: key);

  @override
  _ImageItemState createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem> {

  late double scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (
          BuildContext context,
          BoxConstraints constraints,
      ){
        return StreamBuilder(
          builder: (
            BuildContext context,
            AsyncSnapshot snapshot,
          ){
            return GestureDetector(
              onScaleUpdate: (ScaleUpdateDetails details){
                if(details.scale >= widget.minScale && details.scale <= widget.maxScale){
                  setState(() {
                    scale = details.scale;
                  });
                }
              },
              child: Container(
                child: Center(
                  child: Transform(
                    transform: Matrix4.identity()
                    // ..translate(_offset.dx, _offset.dy)
                      ..scale(scale, scale),
                    alignment: Alignment.center,
                    child: Hero(
                        tag: widget.heroTag,
                        child: widget.imageUrl.contains('http') ? CachedNetworkImage(
                          imageUrl: widget.imageUrl,
                          width: MediaQuery.of(context).size.width,
                        ) : Image.asset(
                          widget.imageUrl,
                          width: MediaQuery.of(context).size.width,
                        )
                    ),
                  ),
                ),
              ),
            );
          }
        );
      }
    );
  }
}

class CommonSeeImageView {
  const CommonSeeImageView._();

  /// 预览一组图片
  static Future<T?> preview<T>(
      BuildContext context, {
        int initialIndex = 0,
        required List<String> images,
        required Function(int) downLoad,
      }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => CommonImageView(imageList: images,currentIndex: initialIndex,downLoad: downLoad,)
      )
    );
  }
}