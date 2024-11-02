import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          itemBuilder: (context, index)
      {


        return const ListTile(

          title: Text("Account"),
          leading: Icon(Icons.arrow_forward_ios_rounded),
        );
      })
    );
  }
}
