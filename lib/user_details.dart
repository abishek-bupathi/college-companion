
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

  String getId(){
    return id;
  }
  void setId(String id_new){
    id = id_new;
  }

  String getName(){
    return name;
  }
  void setName(String name_new){
    name = name_new;
  }

  String getDob(){
    return dob;
  }
  void setDob(String dob_new){
    dob = dob_new;
  }

  String getCourse(){
    return course;
  }
  void setCourse(String course_new){
    course = course_new;
  }

  String getUniversity(){
    return university;
  }
  void setUniversity(String university_new){
    university = university_new;
  }

  String getCurrentAvatar(){
    return current_avatar;
  }
  void setCurrentAvatar(String avatar_new){
    current_avatar = avatar_new;
  }

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
}