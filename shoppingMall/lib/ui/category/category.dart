

import 'package:flutter/material.dart';
import 'package:shoppingMall/ui/category/category_content.dart';

import 'category_search.dart';

const searchList = ["正在流行","上衣","裤子","裙子","内衣","女鞋","男友","包包","运动","配饰","美妆","个护","家居","百货","母婴","食品"];

final recentSuggest = [
  "上衣","裤子","男鞋","个护"
];

bool flag = false;

class SHCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("商品分类")),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context: context, delegate: SearchBarDelegate());
            },
          )
        ],
      ),
      body: SHCategoryContent(),
    );
  }
}

class SearchBarDelegate extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: ()=> query = "",
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow, progress: transitionAnimation,
      ),
      onPressed: ()=> close(context,null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    for(var i=0;i<searchList.length;i++){
      if(query == searchList[i]){
        flag = true;
        break;
      }else{
        flag = false;
      }
    }
    return flag == true?Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        child: InkWell(
          child: Text(query),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SHTextScreen(query)
            ));
          },
        ),
      ),
    ):Center(child: Text("没有找到需要搜索的内容"),);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = searchList.where((element) => element.contains(query)).toList();

    if(query.isEmpty){
      return searchHistory(context);
    }else{
      return ListView.builder(
          itemCount: suggestionList.length,
          itemBuilder: (context, index){
            return ListTile(
              title: RichText(
                text: TextSpan(
                    text: suggestionList[index].substring(0,query.length),
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: suggestionList[index].substring(query.length),
                          style: TextStyle(color:Colors.grey)
                      )
                    ]
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder:  (context) => SHTextScreen(suggestionList[index])
                ));
                if(recentSuggest.contains(query)){
                  return null;
                }else{
                  recentSuggest.add(query);
                  if(recentSuggest.length > 5){
                    recentSuggest.removeAt(0);
                  }
                }
              },
            );
          }
      );
    }


  }

  Widget searchHistory(context){
    return Container(
      height: 200,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            child: Text("搜索历史",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 20,),
          Wrap(
            children: recentSuggest.map((e) => GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SHTextScreen(e)
                ));
              },
              child: Card(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.grey[200],
                    height: 30,
                      width: 60,
                      child: Text(e))),
            )).toList(),
          )
        ],
      ),
    );
  }
}





