import 'package:flutter/material.dart';
import 'package:book_store/custom_widgets/inputfromfield.dart';
import 'package:book_store/models/feedbacks.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {

  
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController subjectcontroller = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final List<Feedbacks> feedbackdata = [];

  final supabase = Supabase.instance.client;

  Future<void> addFeedback() async {
    final response = await supabase.from('feedbacks').insert({
      'name': nameController.text,
      'email': emailcontroller.text,
      'subject': subjectcontroller.text,
      'message': messageController.text,
    });

    if (response.error == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Feedback submitted!')));
      nameController.clear();
      emailcontroller.clear();
      subjectcontroller.clear();
      messageController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${response.error!.message}')),
      );
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
                top: 50,
                left: 100,
                right: 100,
                bottom: 20,
              ),
              child: Text(
                'Share Feedbacks',
                textAlign: TextAlign.center,
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
                'we value your comments and feedbacks',
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            InputAccepter(
              label: 'Your name',
              header: 'name',
              controller: nameController,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            InputAccepter(
              label: 'example@gmail.com ...',
              header: 'Email',
              controller: emailcontroller,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            InputAccepter(
              label: 'feedback subject/type',
              header: 'Subject',
              controller: subjectcontroller,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            TextFormField(
              controller: messageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

                label: Text(
                  'feedback message',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            SizedBox(
              height: 60,
              width: 350,
              child: FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 24, 45, 63),
                onPressed: () {
                  addFeedback();
                },
                child: Text(
                  'Submit',
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
