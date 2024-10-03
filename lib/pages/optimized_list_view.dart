part of 'import.dart';

class OptimizedListView extends StatelessWidget {
  final int itemCount = 1000;

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(title:const  Text('Optimized List with Bloc and GIFs',style: TextStyle(color: Colors.white),),backgroundColor: Colors.black,),
      body: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return CountdownItem(
            gifUrl:
                'https://media.giphy.com/media/JIX9t2j0ZTN9S/giphy.gif', itemId: index, 
          );
        },
      ),
    );
  }
}
