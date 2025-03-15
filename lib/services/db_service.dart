import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homequest_admin/models/agents.dart';
import 'package:homequest_admin/models/client.dart';
import 'package:homequest_admin/models/property_listing.dart';
import 'package:homequest_admin/models/user.dart';

final fetchUsersProvider = FutureProvider((ref) async {
  return ref.read(dbServiceProvider).fetchUsers();
});

final fetchListingsProvider = FutureProvider((ref) async {
  return ref.read(dbServiceProvider).fetchListings();
});

final deleteClientProvider = FutureProvider.family<void, String>((ref, id) async {
  return ref.read(dbServiceProvider).deleteClient(id);
});

final deleteAgentProvider = FutureProvider.family<void, String>((ref, id) async {
  return ref.read(dbServiceProvider).deleteAgent(id);
});

final dbServiceProvider = Provider((ref) {
  return DbService(firebaseFirestore: FirebaseFirestore.instance);
});

final fetchAgentDetailProvider = FutureProvider.family<AgentModel, String>((
  ref,
  uid,
) async {
  return ref.read(dbServiceProvider).fetchAgentDetail(uid);
});

class DbService {
  final FirebaseFirestore firebaseFirestore;

  DbService({required this.firebaseFirestore});

  Future<List<User>> fetchUsers() async {
    List<ClientModel> clients = await firebaseFirestore
        .collection('clients')
        .get()
        .then((value) {
          return value.docs.map((e) => ClientModel.fromJson(e.data())).toList();
        });

    List<AgentModel> agents = await firebaseFirestore
        .collection('agents')
        .get()
        .then((value) {
          return value.docs.map((e) => AgentModel.fromJson(e.data())).toList();
        });

    return [...clients, ...agents];
  }

  Future<void> deleteClient(String id) async {
    await firebaseFirestore.collection('clients').doc(id).delete();
  }

   Future<void> deleteAgent(String id) async {
    await firebaseFirestore.collection('agents').doc(id).delete();
  }

  Future<List<PropertyListing>> fetchListings() async {
    return firebaseFirestore.collection('listings').get().then((value) {
      return value.docs.map((e) => PropertyListing.fromJson(e.data())).toList();
    });
  }

  Future<AgentModel> fetchAgentDetail(String id) async {
    return firebaseFirestore.collection('agents').doc(id).get().then((value) {
      return AgentModel.fromJson(value.data()!);
    });
  }
}
