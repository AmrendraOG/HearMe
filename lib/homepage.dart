import 'package:flutter/material.dart';
import 'package:grievance_app/components/text_bubbles.dart';
import 'package:grievance_app/services/sendEmail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  List<TextBubbles> messageUI = [];

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffA7AAE1),
      appBar: AppBar(
        title: Text("HearMe", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff696FC7),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              messageUI.isEmpty
                  ? "No messages"
                  : "Restarting the app will clear these messages",
            ),
          ),
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messageUI.length,
              itemBuilder: (context, index) {
                return messageUI[index];
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff696FC7),
                        hintText: "Type your message",
                        hintStyle: TextStyle(color: Colors.white54),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white54,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    onPressed: () {
                      if (controller.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Please enter something first."),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      } else {
                        setState(() {
                          messageUI.add(
                            TextBubbles(
                              message: controller.text,
                              day:
                                  "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                              time:
                                  "${DateTime.now().hour}:${DateTime.now().minute}",
                            ),
                          );
                        });
                        sendEmail(
                          'New Grievance Posted',
                          'Cute User',
                          controller.text,
                        );
                        controller.clear();
                      }
                    },
                    icon: Icon(Icons.send, size: 24),
                    color: Colors.white,
                    style: IconButton.styleFrom(
                      backgroundColor: Color(0xff696FC7),
                      padding: EdgeInsets.all(16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
