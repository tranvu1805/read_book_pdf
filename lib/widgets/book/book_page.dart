import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookPage extends StatefulWidget {
  BookPage({super.key});

  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  var bookPath = '';

  @override
  Widget build(BuildContext context) {
    if (bookPath.isEmpty) {
      return Center(
        child: SizedBox(
          width: 160,
          child: ElevatedButton(
              onPressed: () async {
                String path = await _getFile();
                setState(() {
                  bookPath = path;
                });
              },
              child: Row(
                children: [
                  const Icon(Icons.folder),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Pick File",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              )),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter PDF Viewer'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.bookmark,
                color: Colors.white,
                semanticLabel: 'Bookmark',
              ),
              onPressed: () {
                widget._pdfViewerKey.currentState?.openBookmarkView();
              },
            ),
          ],
        ),
        body: SfPdfViewer.file(
          File(bookPath),
        ),
      );
    }
  }

  Future<String> _getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      debugPrint('path: ${result.files.single.path!}');
      return result.files.single.path!;
    } else {
      const SnackBar(
        content: Text('No file selected'),
      );
      return '';
    }
  }
}
