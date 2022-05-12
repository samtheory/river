import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_editor/image_editor.dart' as editor;

class ImagePickerScreen extends HookConsumerWidget {
  ImagePickerScreen({Key? key}) : super(key: key);
  final ImagePicker _picker = ImagePicker();

  final editorOption = editor.ImageEditorOption()
    ..addOption(editor.ClipOption(x: 0, y: 0, width: 1080, height: 1080));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // editorOption.outputFormat(editor.OutputFormat.jpeg(88));
    final image = useState('');
    final compressed = useState('');
    final compressedSize = useState(0);
    final size = useState(0);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          children: [
            GestureDetector(
                onTap: () async {
                  print('call btn');
                  XFile? file =
                      await _picker.pickImage(source: ImageSource.gallery);
                  image.value = file?.path ?? '';
                  print(file?.mimeType ?? '');
                  print(await file?.length());
                  size.value = await file?.length() ?? 0;
                },
                child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.lightBlue,
                    child: const Text(
                      'Pick image',
                      textAlign: TextAlign.center,
                    ))),
            Image.file(File(image.value)),
            Text('${(size.value/1080).floor()} kb'),
            ElevatedButton(
                onPressed: () async {
                  editorOption.outputFormat = editor.OutputFormat.jpeg(60);
                  var edited = await editor.ImageEditor.editFileImageAndGetFile(
                      file: File(image.value), imageEditorOption: editorOption);
                  compressed.value = edited?.path ?? '';
                  compressedSize.value = await edited?.length() ?? 0;
                },
                child: Text('ویرایش')),
            Image.file(File(compressed.value)),
            Text('${(compressedSize.value / 1080).floor()} kb'),
          ],
        ),
      ),
    );
  }
}
