import 'package:cubit_327/counter_cubit.dart';
import 'package:cubit_327/list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPage extends StatelessWidget {
  List<Map<String, dynamic>> mNotes = [];

  @override
  Widget build(BuildContext context) {

    mNotes = context.watch<ListCubit>().state.mData;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
        itemCount:  mNotes.length,
          itemBuilder: (_, index){
        return ListTile(
          title: Text(mNotes[index]["title"]),
          subtitle: Text(mNotes[index]["desc"]),
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: [
                IconButton(onPressed: (){
                  ///update
                  context.read<ListCubit>().updateMap(index: index, updatedData: {
                    "title" : "Life",
                    "desc" : "Live life king size."
                  });
                }, icon: Icon(Icons.edit)),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red,)),
              ],
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddNotePage(),));
      }, child: Icon(Icons.add),),
    );
  }
}

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          context.read<ListCubit>().addMap({
            "title" : "Imp Note",
            "desc" : "Either run you day or day will ruin you."
          });
        }, child: Text('Add')),
      ),
    );
  }
}

