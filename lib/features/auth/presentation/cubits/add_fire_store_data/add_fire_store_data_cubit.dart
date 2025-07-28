import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_fire_store_data_state.dart';

class AddFireStoreDataCubit extends Cubit<AddFireStoreDataState> {
  AddFireStoreDataCubit() : super(AddFireStoreDataInitial());
}
