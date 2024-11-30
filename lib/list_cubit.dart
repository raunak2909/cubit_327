import 'package:cubit_327/list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCubit extends Cubit<ListState> {
  ///initial data
  ListCubit() : super(ListState(mData: []));

  addMap(Map<String, dynamic> eachData) {
    List<Map<String, dynamic>> currentData = state.mData;

    ///item added in current data
    currentData.add(eachData);

    emit(ListState(mData: currentData));
  }

  updateMap({required int index,
    required Map<String, dynamic> updatedData}) {

    var currentData = state.mData;
    currentData[index] = updatedData;

    emit(ListState(mData: currentData));

  }
}
