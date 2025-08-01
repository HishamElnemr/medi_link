import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medi_link/core/utils/backend_endpoints.dart';

class FireStoreServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> addPatientData({required Map<String, dynamic> data}) async {
    await firestore.collection(BackendEndpoints.patientsEndpoint).add(data);
  }

  Future<void> addDoctorData({required Map<String, dynamic> data}) async {
    await firestore.collection(BackendEndpoints.doctorEndpoint).add(data);
  }

  Future<List<Map<String, dynamic>>> getAllDoctors() async {
    final snapshot = await firestore
        .collection(BackendEndpoints.doctorEndpoint)
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> getAllPatients() async {
    final snapshot = await firestore
        .collection(BackendEndpoints.patientsEndpoint)
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<void> addBookingData({required Map<String, dynamic> data}) async {
    final docRef = await firestore
        .collection(BackendEndpoints.bookingsEndpoint)
        .add(data);
    await docRef.update({'id': docRef.id});
  }

  Future<List<Map<String, dynamic>>> getDoctorBookings(String doctorId) async {
    final snapshot = await firestore
        .collection(BackendEndpoints.bookingsEndpoint)
        .where('doctorId', isEqualTo: doctorId)
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}
