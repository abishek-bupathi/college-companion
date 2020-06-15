import 'package:college_companion/classes.dart';
import 'package:hive/hive.dart';

class UserDetails {

  String id = "18280072",
      name = "Abishek Bupathi",
      course = "Electronic and Computer",
      university = "National University of Ireland, Galway",
      dob = "08/12/2000",
      current_avatar = "assets/Avatars/4.png";

  List<String> modules = [
    "Maths",
    "Programming",
    "Electrical",
    "Mechanics",
    "Analog",
    "Physics"
  ];

  List<String> skills = [
    "Julia",
    "C",
    "Raspberry Pi",
    "Java",
    "Python",
    "Badminton",
    "Flutter",
    "Tensor flow",
    "Scikit-Learn"
  ];

  final user_details = Hive.box('user_details');
  final modules_box = Hive.box('modules');
  final skills_box = Hive.box('skills');

  String getId(){
   // return id;
    return user_details.get(0);
  }
  void setId(String id_new){
    // id = id_new;
    user_details.put(0, id_new);
  }

  String getName(){
  //  return name;
    return user_details.get(1);
  }
  void setName(String name_new){
  //  name = name_new;
    user_details.put(1, name_new);
  }

  String getDob(){
   // return dob;
    return user_details.get(2);
  }
  void setDob(String dob_new){
  //  dob = dob_new;
    user_details.put(2, dob_new);
  }

  String getCourse(){
   // return course;
    return user_details.get(3);
  }
  void setCourse(String course_new){
  //  course = course_new;
    user_details.put(3, course_new);
  }

  String getUniversity(){
  // return university;
    return user_details.get(4);
  }
  void setUniversity(String university_new){
 //   university = university_new;
    user_details.put(4, university_new);
  }

  String getCurrentAvatar(){
   // return current_avatar;
    return user_details.get(5);
  }
  void setCurrentAvatar(String avatar_new){
    current_avatar = avatar_new;
    user_details.put(5, current_avatar);
  }
  List<String> getModules(){
    List<String> modules = [];
    if(modules_box.length > 0) {
      for (int i = 0; i < modules_box.length; i++) {
        modules.add(modules_box.getAt(i));
      }
    }
    return modules;

  }

  List<String> getSkills(){
    List<String> skills = [];
    if(skills_box.length > 0) {
      for (int i = 0; i < skills_box.length; i++) {
        skills.add(skills_box.getAt(i));
      }
    }
    return skills;
  }

  void addItem(String title, String item_new){
    if(title.compareTo("Modules") == 0)
   modules_box.add(item_new);
    else
      skills_box.add(item_new);
  }
  void deleteItem(String title, int index){
    if(title.compareTo("Modules") == 0)
    modules_box.deleteAt(index);
    else
      skills_box.deleteAt(index);
  }
  void modifyItem(String title, int index, String modified_item){
    if(title.compareTo("Modules") == 0)
      modules_box.put(index, modified_item);
    else
      skills_box.put(index, modified_item);
  }

  /*
  List<String> getModules(){
    return modules;
  }

  List<String> getSkills(){
    return skills;
  }

  void addItem(List list, String item_new){
    list.insert(0, item_new);
  }
  void deleteItem(List list, int index){
    list.removeAt(index);
  }
  void modifyItem(List list, int index, String modified_item){
    list[index] = modified_item;
  }
*/

}