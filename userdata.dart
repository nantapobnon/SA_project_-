class data {
  String number;
  String name;
  String lname;

  data({this.number, this.name, this.lname});
}

class order_data {
  String number, name = "", lname;
  String url;
  String note = "";
  double time;
  bool isfinish;
  int sum = 0;
  int joke_quan = 0;
  int joke_egg_quan = 0;
  int S_joke_quan = 0;
  int Sjoke_egg_quan = 0;
  int egg_quan = 0;
  int pre_egg_quan = 0;
  int pork_quan = 0;
  int liver_quan = 0;
  int joke_price = 35;
  int joke_egg_price = 40;
  int S_joke_price = 45;
  int S_joke_egg_price = 50;
  int egg_price = 0;
  int pre_egg_price = 0;
  int pork_price = 0;
  int liver_price = 0;
}
