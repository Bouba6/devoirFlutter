import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Inscription.dart';
import 'package:flutter_application_1/repositories/InscriptionRepositorie.dart';
import 'package:flutter_application_1/views/widgets/layout.dart';

class InscriptionPage extends StatefulWidget {
  final Inscriptionrepositorie inscriptionrepositorie;
  InscriptionPage({super.key, required this.inscriptionrepositorie});

  @override
  State<InscriptionPage> createState() => _ComptePageState();
}

class _ComptePageState extends State<InscriptionPage> {
  late Future<List<Inscription>> comptes;
  void refresh() {
    setState(() {
      comptes = widget.inscriptionrepositorie.getInscriptions();
    });
  }

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return layoutPage(
      contentPage: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<List<Inscription>>(
            future: comptes,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                print("Erreur appel fonction Lister Eleve : ${snapshot.error}");
                return const Center(child: Text("Erreur de chargement ..."));
              } else if (snapshot.hasData) {
                final InscriptionList = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: InscriptionList.length,
                  itemBuilder: (context, index) {
                    final inscription = InscriptionList[index];
                    return ListTile(
                      title: Text(inscription.id.toString()),
                      subtitle: Text(inscription.annee.toString()),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap:
                          () => {
                            // Navigator.pushNamedAndRemoveUntil(context, '/detailCompte', (route)=>true,arguments: {
                            //   'insc': inscription
                            // })
                          },
                    );
                  },
                );
              } else {
                return const Text("Aucun compte");
              }
            },
          ),
        ),
      ),
    );
  }
}
