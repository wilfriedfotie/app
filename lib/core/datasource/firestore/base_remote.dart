import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseFirestoreController {
  final CollectionReference ref;

  const BaseFirestoreController({required this.ref});
}
