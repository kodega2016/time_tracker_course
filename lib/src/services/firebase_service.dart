import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();
  FirebaseService._internal();
  factory FirebaseService() => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.doc(path).set(data, SetOptions(merge: true));
  }

  Future<void> deleteData(String path) async {
    await _firestore.doc(path).delete();
  }

  Stream<List<T>> streamData<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String id) builder,
    Query Function(Query)? queryBuilder,
  }) {
    Query _query = _firestore.collection(path);
    if (queryBuilder != null) {
      _query = queryBuilder(_query);
    }

    final _snapshots = _query.snapshots();

    return _snapshots.map(
      (event) => event.docs
          .map((doc) => builder(doc.data() as Map<String, dynamic>, doc.id))
          .toList(),
    );
  }
}
