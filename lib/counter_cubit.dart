import 'package:cubit_327/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState>{

  CounterCubit() : super(CounterState(count: 0));

  void incrementCount(){
    emit(CounterState(count: state.count+1));
  }

  void decrementCount(){
    if(state.count>0) {
      emit(CounterState(count: state.count-1));
    }
  }

}