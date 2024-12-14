import 'package:shared_preferences/shared_preferences.dart';
class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  static Future<bool>putData({required String key,required dynamic value})
  async{
    if(value is String){
      return await sharedPreferences!.setString(key,value);
    } 
    if(value is bool){
      return await sharedPreferences!.setBool(key, value);}
      if(value is int){
        return await sharedPreferences!.setInt(key, value);
      }
    return await sharedPreferences!.setDouble(key, value);
   
  }
 static bool getBoolen({required String key}){return
    sharedPreferences!.getBool(key) ?? false ;

    
  
  }
  static String getString({required String key }){
    return sharedPreferences!.getString(key)??'';
  }
  static Future<bool>removeData({required String key})async{
    await sharedPreferences!.remove(key);return true;
  }
  }
