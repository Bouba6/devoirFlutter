import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/Eleve.dart';
import 'package:flutter_application_1/repositories/InscriptionRepositorie.dart';
import 'package:flutter_application_1/views/widgets/layout.dart';

class ElevePage extends StatefulWidget {
  final Inscriptionrepositorie inscriptionrepositorie;
  ElevePage({super.key, required this.inscriptionrepositorie});

  @override
  State<ElevePage> createState() => _ElevePageState();
}

class _ElevePageState extends State<ElevePage> {
  late Future<List<Eleve>> eleves;
  void refresh() {
    setState(() {
      eleves = widget.inscriptionrepositorie.getElevesInscripts();
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
          child: FutureBuilder<List<Eleve>>(
            future: eleves,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                print("Erreur appel fonction Lister Eleve : ${snapshot.error}");
                return const Center(child: Text("Erreur de chargement ..."));
              } else if (snapshot.hasData) {
                final EleveList = snapshot.data!;
                print(EleveList);
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: EleveList.length,

                  itemBuilder: (context, index) {
                    final eleve = EleveList[index];
                    print(eleve);
                    return ListTile(
                      title: Text(eleve.prenom.toString()),
                      subtitle: Text(eleve.nom.toString()),
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
