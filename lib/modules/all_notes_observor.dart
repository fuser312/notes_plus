import 'package:bloc/bloc.dart';

class AllNotesObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.state.toString()} $change');
    super.onChange(cubit, change);
  }
}