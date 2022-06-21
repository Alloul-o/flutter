import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/bloc/users.bloc.dart';
import 'package:flutter_project/ui/widgets/MainDrawer.widgets.dart';

class GitUsersPage extends StatelessWidget {
  const GitUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController= TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text("Git Users "),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                      controller: textEditingController,
                    )),
                IconButton(onPressed: (){
                  String  kw= textEditingController.text;
                 context.read<UsersBloc>().add(SearchUsersEvent(keyword: kw));

                },
                    icon: const Icon(Icons.search))
              ],
            ),
          ),
          BlocBuilder<UsersBloc,UsersState>(builder: (context,state){
            if(state is SearchUsersLoadingState){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if(state is SearchUsersErrorState){
              return Column(
                children: [
                Text(state.errorMasage,style: Theme.of(context).textTheme.headline6,),

                ],
              );
            }else if(state is SearchUsersSuccessState){
              return Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) =>
                   ListTile(
                      title: Row(
                            children: [
                            Text(state.listUsers.items[index].login)
                            ],
                            ),

                ),
                    separatorBuilder: (context,index){
                  return const  Divider(
                  height:2,
                  );
            },
                    itemCount: state.listUsers.items.length
                ),
              );
            }else{
              return Container();
            }
         }
         )
        ],
      ),
    );
  }
}
