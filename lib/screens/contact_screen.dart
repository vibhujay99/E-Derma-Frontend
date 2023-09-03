import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back_rounded),
                  ),
                ),
                const Text(
                  'Contact Us',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                ClipOval(
                    child: Lottie.asset('images/contact_an.json',
                        width: 200, height: 200, repeat: false)),
                const SizedBox(
                  height: 13,
                ),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: const ListTile(
                      tileColor: Colors.white24,
                      leading: Icon(
                        Icons.email,
                        size: 28,
                        color: Colors.deepPurple,
                      ),
                      title: Text(
                        'ederma.contact@gmail.com',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )),
                const SizedBox(
                  height: 4,
                ),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: const ListTile(
                      tileColor: Colors.white24,
                      leading: Icon(
                        Icons.phone,
                        size: 28,
                        color: Colors.deepPurple,
                      ),
                      title: Text(
                        '0776677433',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )),
                const SizedBox(
                  height: 4,
                ),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: const ListTile(
                      tileColor: Colors.white24,
                      leading: Icon(
                        Icons.facebook,
                        size: 28,
                        color: Colors.deepPurple,
                      ),
                      title: Text(
                        'E-Derma',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
