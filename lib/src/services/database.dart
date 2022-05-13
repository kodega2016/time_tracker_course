import 'package:ptracker/src/models/entry/entry.dart';
import 'package:ptracker/src/models/job/job.dart';
import 'package:ptracker/src/services/doc_path.dart';
import 'package:ptracker/src/services/firebase_service.dart';

abstract class Database {
  Future<void> createOrUpdateJob(Job job);
  Stream<List<Job>> jobsStream();
  Future<void> deleteJob(String id);

  Future<void> createOrUpdateEntry(Entry entry);
  Stream<List<Entry>> entriesStream({String? jobId});
  Future<void> deleteEntry(String id);
}

class FirestoreDatabase implements Database {
  final String uid;
  FirestoreDatabase({required this.uid});

  final FirebaseService _service = FirebaseService();

  @override
  Future<void> createOrUpdateJob(Job job) async {
    await _service.setData(path: DocPath.job(uid, job.id), data: job.toJson());
  }

  @override
  Stream<List<Job>> jobsStream() {
    return _service.streamData<Job>(
      path: DocPath.jobs(uid),
      builder: (data, id) {
        data['id'] = id;
        return Job.fromJson(data);
      },
    );
  }

  @override
  Future<void> deleteJob(String id) async {
    final _entries = await entriesStream(jobId: id).first;

    for (var item in _entries) {
      await deleteEntry(item.id);
    }

    await _service.deleteData(DocPath.job(uid, id));
  }

  @override
  Future<void> createOrUpdateEntry(Entry entry) async {
    await _service.setData(
      path: DocPath.entry(uid, entry.id),
      data: entry.toJson(),
    );
  }

  @override
  Future<void> deleteEntry(String id) async {
    await _service.deleteData(DocPath.entry(uid, id));
  }

  @override
  Stream<List<Entry>> entriesStream({String? jobId}) {
    return _service.streamData<Entry>(
      path: DocPath.entries(uid),
      queryBuilder: jobId == null
          ? null
          : (query) => query.where('jobId', isEqualTo: jobId),
      builder: (data, id) {
        data['id'] = id;
        return Entry.fromJson(data);
      },
    );
  }
}
