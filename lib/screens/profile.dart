import 'package:flutter/material.dart';
import 'package:start_hub/constants.dart';
import 'package:start_hub/models/project.dart';
import 'package:start_hub/screens/edit_profile.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Profile View",
            style: TextStyle(
                color: kTextColor,
                fontFamily: kfont,
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: kBackground,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(color: kBackground),
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VerticalSpacing(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'StartHub',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return EditProfile();
                        }));
                      },
                      child: Row(children: [
                        Icon(Icons.add, color: kTextColor),
                        Text(
                          'Edit Profile',
                          style: TextStyle(color: kTextColor),
                        )
                      ]))
                ],
              ),
              VerticalSpacing(),
              GestureDetector(
                onTap: () {},
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/dammy.JPG",
                    width: size.width * 0.25,
                    height: size.height * 0.12,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              VerticalSpacing(),
              const Text(
                "Intern name",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              VerticalDivider(),
              const Text(
                "intern@starthub.com",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              VerticalSpacing(),
              const Text(
                'Intern Track at StartHub',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              VerticalSpacing(),
              Text(
                "Hello World",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              VerticalSpacing(of: 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavItem(title: 'Projects', press: () {}, number: 26),
                  NavItem(title: 'Reviews', press: () {}, number: 25),
                  NavItem(title: 'Contacted', press: () {}, number: 26),
                ],
              ),
              Divider(
                thickness: 4.0,
              ),
              ProjectList(
                items: projects,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    Key key,
    @required this.title,
    @required this.press,
    @required this.number,
    this.isActive = false,
  }) : super(key: key);
  final String title;
  final GestureTapCallback press;
  final bool isActive;
  final int number;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(5),
        width: size.width * 0.2,
        height: size.height * 0.06,
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [kDefualtShadow],
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              '${number}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProjectList extends StatelessWidget {
  const ProjectList({Key key, this.items}) : super(key: key);

  final List<Project> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: ProjectBox(item: projects[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProjectView(item: projects[index]),
              ),
            );
          },
        );
      },
    );
  }
}

class ProjectView extends StatelessWidget {
  ProjectView({Key key, this.item}) : super(key: key);

  final Project item;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Project Details",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: kfont,
                  fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: kPrimaryColor,
          elevation: 0,
        ),
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                VerticalSpacing(
                  of: 0.03,
                ),
                Image.asset(
                  this.item.image,
                  width: size.width * 0.5,
                  height: size.height * 0.2,
                  fit: BoxFit.cover,
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(0.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Name: ' + this.item.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Description: ' + this.item.description),
                            Text('Date: ' + this.item.date.toString())
                          ],
                        ))),
                Divider()
              ]),
        ));
  }
}

class ProjectBox extends StatelessWidget {
  ProjectBox({Key key, this.item}) : super(key: key);
  final Project item;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.1,
      width: size.width,
      child: Column(children: <Widget>[
        Container(
          width: size.width,
          height: size.height * 0.05,
          decoration: BoxDecoration(image: DecorationImage(
                    image: AssetImage(this.item.image), fit: BoxFit.fill),),
        ),
            Row(
              children: [
                Text(
                  this.item.track,
                  style: TextStyle(fontSize: 12, color: kPrimaryColor),
                )
              ],
            ),
        
        Container(
            width: size.width,
            height: size.height * 0.03,
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Name: ' + this.item.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Description: ' + this.item.description),
                Text('Date: ' + this.item.date.toString()),
              ],
            ))
      ]),
    );
  }
}
