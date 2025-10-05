import 'package:flutter/material.dart';
import 'package:book_store/custom_widgets/inputfromfield.dart';
import 'package:file_picker/file_picker.dart';
import 'package:book_store/models/resuorces.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();
  final TextEditingController urlcontroller = TextEditingController();

  final List<Book> uploadedBooks = [];

  void uploadfile() {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        tagsController.text.isNotEmpty &&
        urlcontroller.text.isNotEmpty) {
      setState(() {
        uploadedBooks.add(
          Book(
            title: titleController.text,
            description: descriptionController.text,
            tags: tagsController.text,
            imageUrl: urlcontroller.text,
          ),
        );

        titleController.clear();
        descriptionController.clear();
        tagsController.clear();
        urlcontroller.clear();
      });
    }
  }

  String? fileName;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
        'doc',
        'docx',
        'txt',
        'jpg',
        'img',
        'png',
        'jpeg',
      ],
    );

    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
      });
    } else {
      print("No file selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(
                top: 80,
                left: 100,
                right: 100,
                bottom: 20,
              ),
              child: Text(
                'Upload Books',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.001),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 100,
                vertical: 0,
              ),
              child: Text(
                'share resources with others',
                overflow: TextOverflow.clip,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            InputAccepter(
              label: 'book title',
              header: 'Title',
              controller: titleController,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            InputAccepter(
              label: 'Description about the book',
              header: 'Details',
              controller: descriptionController,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            InputAccepter(
              label: 'tags e.g fiction,biography...',
              header: 'Tags',
              controller: tagsController,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            SizedBox(
              height: 60,
              width: 350,
              child: FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 82, 83, 83),
                onPressed: pickFile,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload, size: 30, color: Colors.white),
                    Text(
                      'choose file',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            SizedBox(
              height: 60,
              width: 350,
              child: FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 24, 45, 63),
                onPressed: () {},
                child: Text(
                  'Upload',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
