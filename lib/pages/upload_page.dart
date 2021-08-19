import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UploadPicture extends StatefulWidget {
  @override
  _UploadPictureState createState() => _UploadPictureState();
}

class _UploadPictureState extends State<UploadPicture> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return Center(
      child: Icon(
        Icons.file_upload,
        size: 57,
        color: Colors.white,
      ),
    );
  }
}
