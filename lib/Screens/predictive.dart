import 'dart:io';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sih_24/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class PredictiveScreen extends StatefulWidget {
  const PredictiveScreen({super.key});

  @override
  State<PredictiveScreen> createState() => _PredictiveScreenState();
}

class _PredictiveScreenState extends State<PredictiveScreen> {
  ChatUser user = ChatUser(id: '1', firstName: 'You');
  ChatUser otherUser = ChatUser(id: '2', firstName: 'Bot');
  List<ChatMessage> messages = <ChatMessage>[];
  Future<void> _openMedia(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.background,
        foregroundColor: Colors.white,
        title: Text(
          "Law Assistant",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: DashChat(
        messageOptions: MessageOptions(
          onTapMedia: (media) {
            _openMedia(media.url);
          },
        ),
        inputOptions: InputOptions(trailing: [
          IconButton(
            icon: Icon(Icons.camera_alt_rounded),
            onPressed: () async {
              final result =
                  await FilePicker.platform.pickFiles(type: FileType.image);
              if (result != null) {
                final file = result.files.first;
                // Handle the selected file
                print('Selected file path: ${file.path}');
                // You can send the file as a message or perform other actions
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.attach_file_rounded),
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['jpg', 'pdf', 'doc', 'jpeg'],
              );
              print("file picked...proceeding to download");
              print(result!.files.single.path!);
              if (result != null) {
                String fileName = result.files.first.name;
                File path = await File(result.files.single.path!);
                // Upload file
                TaskSnapshot snapshot = await FirebaseStorage.instance
                    .ref('uploads/$fileName')
                    .putFile(path);
                String downloadUrl = await snapshot.ref.getDownloadURL();
                print("file uploaded");
                print(downloadUrl);
                setState(() {
                  messages.insert(
                      0,
                      ChatMessage(
                          user: user,
                          createdAt: DateTime.now(),
                          medias: [
                            ChatMedia(
                                url: downloadUrl,
                                fileName: fileName,
                                type: MediaType.file)
                          ]));
                });

                // You can send the file as a message or perform other actions
              }
            },
          ),
        ]),
        currentUser: user,
        onSend: (ChatMessage m) {
          setState(() {
            messages.insert(0, m);
          });
        },
        messages: messages,
      ),
    );
  }
}
