
import 'package:flutter/material.dart';

class PageViewFlutter extends StatelessWidget {
  const PageViewFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 3,
        scrollDirection: Axis.vertical,
        itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            color: Colors.orange,
            child: Text("data$index"),
            width: 300,
            height: 100,
          ),
        );
      }),
    );
  }
}


class GridviewFlutter extends StatelessWidget {
  const GridviewFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 100,
                borderOnForeground: false,
                color: Colors.grey,
                child: Center(child: Text('$index')),
              ),
            );
          }
    ),
    );
  }
}


class ListviewWidget extends StatelessWidget {
  const ListviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body:ListView.custom(
          childrenDelegate: SliverChildBuilderDelegate(

            (BuildContext context, int index) {
              int childindex = index;
              var item = [].indexOf(index);
                  return Container(
                  color: Colors.amber,
                  width: 300,
                  height: 100,
                  child: Text("container $index"),
                );
            },
            childCount: 20,
           
          ),
        )); 
      // ListView.custom(

      //   separatorBuilder: (context, index) {
      //     return SizedBox(
      //       height: 20,
      //     );
      //   },
      //   scrollDirection: Axis.horizontal,
      //   itemCount: 20,
      //   itemBuilder: (context, index){
      //     return Padding(
      //       padding: const EdgeInsets.all(20.0),
      //       child: Container(
      //         color: Colors.amber,
      //         width: 300,
      //         height: 100,
      //         child: Text("container $index"),
      //       ),
      //     );
      // }));   
  }
}