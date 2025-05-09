// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_application_1/models/Eleve.dart';

class Inscription {
  late String _id;
  late String annee;
  late List<Eleve?> _eleves = [];

  @override
  String toString() {
    return 'Inscription{_id: $_id, _annee: $annee, _eleves: $_eleves}';
  }

  Inscription({required id, required annee});

  Inscription.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    annee = json['annee'];
    if (json['eleves'] != null) {
      json['eleves'].forEach((v) {
        _eleves.add(Eleve.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['annee'] = annee;

    return data;
  }

  get id => _id;
}
