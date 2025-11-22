import 'dart:io';

import 'package:medi_link/core/services/storage_services.dart';
import 'package:medi_link/core/utils/backend_endpoints.dart';
import 'package:path/path.dart' as path;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class SupabaseStorageServices implements StorageServices {
  static late Supabase _supabase;
  static Future<void> createBucket(String bucketName) async {
    final buckets = await _supabase.client.storage.listBuckets();
    bool isBucketExists = false;
    for (var i in buckets) {
      if (i.id == bucketName) {
        isBucketExists = true;
        break;
      }
    }
    if (!isBucketExists) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  static Future<void> initSupabase() async {
    _supabase = await Supabase.initialize(
      url: 'https://zbxddpbbnbeqrgblremc.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpieGRkcGJibmJlcXJnYmxyZW1jIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MTU2MTM0MCwiZXhwIjoyMDc3MTM3MzQwfQ.Li0lPq2BFcdoEP5ngYLPhiiurmrBrkkG_omjhzcGYRI',
    );
  }

  @override
  @override
  Future<String> uploadFile(File file, String filePath) async {
    final supabase = Supabase.instance.client;

    final uuid = const Uuid();
    String fileName = '${uuid.v4()}${path.extension(file.path)}';

    final String fullPath = '$filePath/$fileName';

    await supabase.storage
        .from(BackendEndpoints.supabaseStorageName)
        .upload(fullPath, file);

    return supabase.storage
        .from(BackendEndpoints.supabaseStorageName)
        .getPublicUrl(fullPath);
  }

}
