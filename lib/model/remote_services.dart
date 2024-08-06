
import 'package:http/http.dart';
import 'package:web_app/model/post.dart';

class RemoteServices{
  Future <List<Post>?> getpost()async{
    var client = Client();
   var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
   var response = await client.get(uri);
   if(response.statusCode == 200){
     var json =response.body;
     return postFromJson(json);
   }
  }
}