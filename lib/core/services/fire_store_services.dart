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

  Future<List<Map<String, dynamic>>> getDoctorsBySpecialization({
    required String specialization,
  }) async {
    final snapshot = await firestore
        .collection(BackendEndpoints.doctorEndpoint)
        .where('speciality', isEqualTo: specialization)
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> getDoctors() async {
    {
      final snapshot = await firestore
          .collection(BackendEndpoints.doctorEndpoint)
          .get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    }
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

  Future<List<Map<String, dynamic>>> getPatientBookings(
    String patientId,
  ) async {
    final snapshot = await firestore
        .collection(BackendEndpoints.bookingsEndpoint)
        .where('patientId', isEqualTo: patientId)
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<void> updateBookingStatus(String bookingId, String newStatus) async {
    await firestore
        .collection(BackendEndpoints.bookingsEndpoint)
        .doc(bookingId)
        .update({'status': newStatus});
  }

  Future<void> deleteBooking(String bookingId) async {
    await firestore
        .collection(BackendEndpoints.bookingsEndpoint)
        .doc(bookingId)
        .delete();
  }

  Future<void> deletePatient(String patientId) async {
    await firestore
        .collection(BackendEndpoints.patientsEndpoint)
        .doc(patientId)
        .delete();
  }

  Future<void> deleteDoctor(String doctorId) async {
    await firestore
        .collection(BackendEndpoints.doctorEndpoint)
        .doc(doctorId)
        .delete();
  }

  Future<void> updatePatientData({
    required Map<String, dynamic> data,
    required String uId,
  }) async {
    final querySnapshot = await firestore
        .collection(BackendEndpoints.patientsEndpoint)
        .where('id', isEqualTo: uId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      await firestore
          .collection(BackendEndpoints.patientsEndpoint)
          .doc(querySnapshot.docs.first.id)
          .update(data);
    }
  }

  Future<void> updateDoctorData({
    required Map<String, dynamic> data,
    required String uId,
  }) async {
    final querySnapshot = await firestore
        .collection(BackendEndpoints.doctorEndpoint)
        .where('id', isEqualTo: uId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      await firestore
          .collection(BackendEndpoints.doctorEndpoint)
          .doc(querySnapshot.docs.first.id)
          .update(data);
    }
  }
}
