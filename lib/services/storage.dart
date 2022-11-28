import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class StorageService extends StatefulWidget {
  const StorageService({super.key});

  @override
  State<StorageService> createState() => _StorageServiceState();
}

class _StorageServiceState extends State<StorageService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                final results = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: FileType.custom,
                  allowedExtensions: ['png', 'jpg'],
                );
                if (results == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("No file selected."),
                    ),
                  );
                  return null;
                }
                final path = results.files.single.path!;
                final fileName = results.files.single.name;
                print(path);
                print(fileName);
              },
              child: Text('Upload Image'))
        ],
      )),
    );
  }
}
