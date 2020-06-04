import 'package:flutter/material.dart';

List<String> depts = [
  "None",
  "Animal Husbandry",
  "BDPO",
  "Civil Hospital",
  "DHBVN(Urban)",
  "DHBVN(Rural)",
  "Distt. Town planner ",
  "Education(Elementary)",
  "Education(Higher)",
  "Fire Department",
  "HVPNL",
  "Irrigation",
  "Nagar Parishad",
  "PWD",
  "PUBLIC HEALTH(Water)",
  "Public health(Sewage)",
  "Public health (Reny Well)",
  "Social Welfare",
  "Tehsil"
];

List<String> getWardsList() {
  List<String> wards = [];
  wards.add("None");
  for (int i = 1; i <= 31; i++) {
    wards.add(i.toString());
  }

  return wards;
}

var brandText = RichText(
  text: TextSpan(
      text: "Sama",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 44,
          letterSpacing: 1,
          color: Colors.black),
      children: <TextSpan>[
        TextSpan(
            text: "dhaan",
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 44,
                color: Colors.grey[500],
                fontFamily: "Sans Serif"))
      ]),
);
var complaintText = RichText(
  text: TextSpan(
      text: "File",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 44,
          letterSpacing: 1,
          color: Colors.black),
      children: <TextSpan>[
        TextSpan(
            text: "Complaint",
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 44,
                color: Colors.grey[500],
                fontFamily: "Sans Serif"))
      ]),
);

var trackText = RichText(
  text: TextSpan(
      text: "Track",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 44,
          letterSpacing: 1,
          color: Colors.black),
      children: <TextSpan>[
        TextSpan(
            text: "Complaint",
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 44,
                color: Colors.grey[500],
                fontFamily: "Sans Serif"))
      ]),
);

var villages = [
  "None",
//  "Dhatir",
//  "Allika",
//  "Ghughera",
//  "Yadupur",
//  "Karna",
//  "Rajolka",
//  "Kakrali",
//  "Lalwa",
//  "Asaavta",
//  "Chajju Nagar",
//  "Chirwadi",
//  "Lalpur Kadim",
//  "Milak Ganniki",
//  "Pelak",
//  "Sihaul",
//  "Sujwadi",
//  "Taraka",
//  "Acheja",
//  "Aaya Nagar",
//  "Akbarpur Dakor",
//  "Badoli",
//  "Baadka",
//  "Bagpur Kala",
//  "Balayi",
//  "Bholdha",
//  "Bhued",
//  "Chandhut",
//  "Farizanpur Khelda",
//  "Ghodi",
//  "Gurwadi",
//  "Hunsapur",
//  "Hoshangabad",
//  "Munirgadi",
//  "Jevabad Khedli",
//  "Kamravali",
//  "Kulena",
//  "Maksudpur",
//  "Kusak",
//  "Lalghad",
//  "Mustafabad",
//  "Mala Singh Farm",
//  "Misa",
//  "Nagliya Khurd",
//  "Zhuppa",
//  "Nandawal",
//  "Pehruka",
//  "Prhaladpur",
//  "Rampur Khor",
//  "Rasulpur",
//  "Dostpur",
//  "Rahimpur",
//  "Shekpur",
//  "Behrampur",
//  "Soldha",
//  "Sunheri ka Nagla",
//  "Bambu Nagla",
//  "Sultanpur",
//  "Tekri Gujjar",
//  "Thantari",
//  "Patli Khurd",
//  "Atoha",
//  "Hidayatpur",
//  "Ladiyaka",
//  "Nagal Bhraman",
//  "Rundhi",
//  "Amroli",
//  "Aatva",
//  "Ajijabad",
//  "Baata",
//  "Bela",
//  "Bilochpur",
//  "Bamariyaka",
//  "Bharatgadh",
//  "Sehdev Nangla",
//  "Bhavana",
//  "Chavvan Ka Nangla",
//  "Fatsko Nagar",
//  "Gundvas",
//  "Hafzabad(Surjan Nagla)",
//  "Karimpur",
//  "Kashipur",
//  "Lulwadi",
//  "Nai Nagla",
//  "Peer Gadi",
//  "Raydaska",
//  "Sheru ka Nagla",
//  "Aatar Chahta",
//  "Tappa",
  "Aatar Chahta",
  "Aatva",
  "Aaya Nagar",
  "Acheja",
  "Ajijabad",
  "Akbarpur Dakor",
  "Allika",
  "Amroli",
  "Asaavta",
  "Atoha",
  "Baadka",
  "Baata",
  "Badoli",
  "Bagpur Kala",
  "Balayi",
  "Bamariyaka",
  "Bambu Nagla",
  "Behrampur",
  "Bela",
  "Bharatgadh",
  "Bhavana",
  "Bholdha",
  "Bhued",
  "Bilochpur",
  "Chajju Nagar",
  "Chandhut",
  "Chavvan Ka Nangla",
  "Chirwadi",
  "Dhatir",
  "Dostpur",
  "Farizanpur Khelda",
  "Fatsko Nagar",
  "Ghodi",
  "Ghughera",
  "Gundvas",
  "Gurwadi",
  "Hafzabad (Surjan Nagla)",
  "Hidayatpur",
  "Hoshangabad",
  "Hunsapur",
  "Jevabad Khedli",
  "Kakrali",
  "Kamravali",
  "Karimpur",
  "Karna",
  "Kashipur",
  "Kulena",
  "Kusak",
  "Ladiyaka",
  "Lalghad",
  "Lalpur Kadim",
  "Lalwa",
  "Lulwadi",
  "Maksudpur",
  "Mala Singh Farm",
  "Milak Ganniki",
  "Misa",
  "Munirgadi",
  "Mustafabad",
  "Nagal Bhraman",
  "Nagliya Khurd",
  "Nai Nagla",
  "Nandawal",
  "Patli Khurd",
  "Peer Gadi",
  "Pehruka",
  "Pelak",
  "Prhaladpur",
  "Rahimpur",
  "Rajolka",
  "Rampur Khor",
  "Rasulpur",
  "Raydaska",
  "Rundhi",
  "Sehdev Nangla",
  "Shekpur",
  "Sheru ka Nagla",
  "Sihaul",
  "Soldha",
  "Sujwadi",
  "Sultanpur",
  "Sunheri ka Nagla",
  "Tappa",
  "Taraka",
  "Tekri Gujjar",
  "Thantari",
  "Yadupur",
  "Zhuppa",
];

Widget bottomSheet(String title, String refNum, BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Expanded(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 46),
              ),
              SizedBox(
                height: 15,
              ),
              Flexible(
                child: Hero(
                  tag: '',
                  child: Icon(
                    Icons.check_circle_outline,
                    size: 200,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                child: Hero(
                  tag: "1",
                  child: Text(
                    "Tracking Number:",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                refNum,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Text(
                '*Note down the tracking ID or take Screenshot',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget trackSheet(String name, String phone, String date, String dept,
    String currdept, String status, BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Name:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 20),
              ),
              Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Phone Number:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 20),
              ),
              Text(
                phone,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Date of Filing Complaint:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 20),
              ),
              Text(
                date,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Department",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 20),
              ),
              Text(
                dept,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Current Department",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 20),
              ),
              Text(
                currdept,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Status",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 20),
              ),
              Text(
                status,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ],
          ),
        ),
      );
    },
  );
}
