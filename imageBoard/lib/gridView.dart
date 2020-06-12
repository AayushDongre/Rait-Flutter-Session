import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:imageBoard/models/galleryImage.dart';

class ImageGrid extends StatefulWidget {
  ImageGrid({Key key}) : super(key: key);

  @override
  _ImageGridState createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  List<GalleryImage> imageList = [];
  int page = 1;
  ScrollController _scrollController = ScrollController();

  void fetchImage() async {
    try {
      final http.Response response =
          await http.get('https://picsum.photos/v2/list?page=${page}');
      if (response.statusCode == 200) {
        final List result = json.decode(response.body);
        result.forEach((element) {
          final GalleryImage galleryImage = GalleryImage.fromJson(element);
          setState(() {
            imageList.add(galleryImage);
          });
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchImage();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 300) {
        page++;
        fetchImage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: GridView.builder(
        itemCount: imageList.length,
        controller: _scrollController,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        cacheExtent: MediaQuery.of(context).size.height,
        itemBuilder: (context, index) {
          GalleryImage image = imageList[index];
          return Container(
            margin: EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Image.network(
                image.downloadUrl,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
