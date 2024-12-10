import 'package:dio_kutuphanesi_example1/service/service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final service = Service();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dio Package"),
      ),
      body: FutureBuilder(
          future: service.getPosts(), //İşlem bitene kadar builder ı bekletecek
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              //Data alma işlemi devam ediyor
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.cyan,
              ));
            } else if (snapshot.hasData) {
              //Data varsa(geldiyse)
              final data = snapshot.data;
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(data[index].email.toString()),
                        subtitle: Text(data[index].body.toString()),
                        leading: Text(data[index].id.toString()),
                      ),
                    );
                  });
            }
            return const Text("Data yok!!");
          }),
    );
  }
}
