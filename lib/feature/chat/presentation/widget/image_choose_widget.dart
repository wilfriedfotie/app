import 'dart:io';

import 'package:LASYLAB/services/image_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class GetImage extends StatefulWidget {
  final bool rad;
  const GetImage({Key? key, this.rad = false}) : super(key: key);

  @override
  _GetImageState createState() => _GetImageState();
}

class _GetImageState extends State<GetImage> {
  late ImagePickerService _imagePickerService =
      GetIt.instance<ImagePickerService>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: <Widget>[
          ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text('Importer de la gallerie',
                  style: Theme.of(context).textTheme.bodyLarge),
              onTap: () async {
                final File? image =
                    await _imagePickerService.pickImageFromGallery();

                Navigator.of(context)
                    .pop(image != null ? File(image.path) : null);
              }),
          ListTile(
            leading: const Icon(Icons.photo_camera),
            title: Text('Camera', style: Theme.of(context).textTheme.bodyLarge),
            onTap: () async {
              final File? image =
                  await _imagePickerService.pickImageFromGallery();

              image != null
                  ? Navigator.of(context).pop(File(image.path))
                  : Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
