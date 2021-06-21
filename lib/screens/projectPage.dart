import 'package:flutter/material.dart';
import 'package:start_hub/constants.dart';
import 'package:start_hub/models/project.dart';
import 'package:start_hub/screens/profile.dart';

class ProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(color: kBackground),
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VerticalSpacing(
                of: 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                        color: kPrimaryColor, fontFamily: kfont, fontSize: 15),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchBox()),
                      );
                    },
                    child: Icon(Icons.search_rounded, color: kPrimaryColor,),
                  )
                ],
              ),
              VerticalSpacing(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  );
                },
                child: Text(
                  'Sign up to showcase your project',
                  style: TextStyle(
                      color: kPrimaryColor, fontFamily: kfont, fontSize: 15),
                ),
              ),
              VerticalSpacing(),
              ProjectList(
                items: projects,
              )
            ],
          ),
        ),
  
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: size.height * 0.05,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          hintText: "Search for Projects",
          hintStyle: TextStyle(
            fontSize: 15,
            color: Color(0xFFBDBDBD),
          ),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
