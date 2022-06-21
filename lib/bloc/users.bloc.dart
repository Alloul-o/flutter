
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/model/users.model.dart';
import 'package:flutter_project/repository/Users.repository.dart';

abstract class UsersEvent{}
class SearchUsersEvent extends UsersEvent{
  final String keyword;

   SearchUsersEvent(
       { required this.keyword,}
       );
}
abstract class UsersState {}
class SearchUsersSuccessState extends UsersState{
  final ListUsers listUsers ;

    SearchUsersSuccessState({ required this.listUsers});
}
class SearchUsersLoadingState extends UsersState{}
class SearchUsersErrorState extends UsersState{
  final String errorMasage;

  SearchUsersErrorState({ required this.errorMasage});
}

class UsersInitialeState extends UsersState{}

class UsersBloc extends Bloc<UsersEvent,UsersState> {
  UsersRepository usersRepository = UsersRepository();
  UsersBloc() : super(UsersInitialeState()){
    on((SearchUsersEvent event, emit)async{
      emit(SearchUsersLoadingState());
      try{
        ListUsers listUsers=await  usersRepository.searchUsers(event.keyword, 0, 20);
        emit(SearchUsersSuccessState(listUsers: listUsers));
      }catch(e){
       emit(SearchUsersErrorState(errorMasage: e.toString()));
      }
    });
  }
}
