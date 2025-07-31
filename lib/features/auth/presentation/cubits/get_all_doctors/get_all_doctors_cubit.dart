import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_all_doctors_state.dart';

class GetAllDoctorsCubit extends Cubit<GetAllDoctorsState> {
  GetAllDoctorsCubit() : super(GetAllDoctorsInitial());
}
