import 'dart:convert';
import 'package:briidea/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/GroupChatModel.dart';

class MyDesktopBody extends StatefulWidget {
  MyDesktopBody({Key? key}) : super(key: key);

  @override
  State<MyDesktopBody> createState() => _MyDesktopBodyState();
}

class _MyDesktopBodyState extends State<MyDesktopBody> {
  late ChatGroup chatGroup;
  UserResponse? userResponse;

  @override
  void initState() {
    GetGroupChatModel();
    UserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (chatGroup == null || userResponse == null) {
      // Display a loading indicator until the data is fetched
      return const CircularProgressIndicator();
    }
    return Scaffold(
      body:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Expanded(
            child: Column(
              children: [
                Expanded(child: Container(child: SingleChildScrollView(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Card(
                              child: Container(
                                margin: const EdgeInsets.all(90),

                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: const [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Icon(
                                            Icons.wallpaper_outlined,
                                            color: Colors.blue,
                                            size: 40,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Briidea",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          prefixIcon: const Icon(
                                            Icons.search,
                                            color: Colors.black,
                                          ),
                                          filled: true,
                                          hintStyle: TextStyle(color: Colors.grey[800]),
                                          hintText: "Search",
                                          fillColor: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: const [
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          "Direct Massage",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold, fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 300,
                                      child: Scrollbar(
                                        trackVisibility: true,
                                        thickness: 10,
                                        thumbVisibility: true,
                                        child: ListView.builder(
                                          primary: true,
                                          itemCount: userResponse!.data.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            User userData = userResponse!.data[index];
                                            return Container(
                                              color: Colors.grey[200],
                                              child: ListTile(
                                                leading: const CircleAvatar(
                                                  backgroundImage:
                                                  AssetImage('assets/images.png'),
                                                  backgroundColor: Colors.greenAccent,
                                                  radius: 20,
                                                ),
                                                title: Text(userData.firstname as String,
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20)),
                                                subtitle:
                                                Text(userData.message ?? "No message"),
                                                trailing: Column(
                                                  children: [
                                                    Text(
                                                        userData.message_time.substring(0, 10)),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.pink,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: Colors.pink,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: ClipOval(
                                                        child: Text(userData.is_sent,
                                                            style: const TextStyle(
                                                                color: Colors.white)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: const [
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          "Commute/Group",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold, fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 300,
                                      child: Scrollbar(
                                        trackVisibility: true,
                                        thickness: 10,
                                        child: ListView.builder(
                                          primary: true,
                                          itemCount: chatGroup.data.length,
                                          shrinkWrap: true,
                                          itemBuilder: (BuildContext context, int index) {
                                            GroupData groupData = chatGroup.data[index];
                                            return Container(
                                              color: Colors.grey[200],
                                              child: ListTile(
                                                focusColor: Colors.grey,
                                                leading: const Text(
                                                  "@",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                title: Text(groupData.chatGroupName),
                                                trailing: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.pink,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Colors.pink,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: ClipOval(
                                                      child: Text(groupData.groupMessagesId,
                                                          style: const TextStyle(
                                                              color: Colors.white))),
                                                ),
                                                onTap: () {
                                                  // Handle tile tap
                                                  // For example, navigate to a chat screen with the selected group data
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: const [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                            'assets/person.png',
                                          ),
                                          radius: 20,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Dashboard",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold, fontSize: 20),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: const [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        ClipOval(
                                          child: Icon(
                                            Icons.settings,
                                            color: Colors.grey,
                                            size: 40,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Setting",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold, fontSize: 20),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),))
              ],
            ),
          ),
            Expanded(
            child: Column(
              children: [
                Expanded(child: Container(child: Card(child:Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    leading:  CircleAvatar(
                      backgroundImage:
                      AssetImage('assets/images.png'),
                      backgroundColor: Colors.greenAccent,
                      radius: 20,
                    ),
                    title: Column(children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Product Team ",style: TextStyle(color: Colors.black,),),
                        ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        Text("3 participants",style: TextStyle(color: Colors.grey,fontSize: 10),),
                      ],)

                    ],),
                    actions: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.video_camera_back_sharp,color: Colors.grey,)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.call,color: Colors.grey,)),
                    ],
                  ),
                  body:  _chatInput(),
                ))))
              ],
            ),
          ),
            Expanded(
            child: Column(
              children: [
              Expanded(child: Container(
                padding: EdgeInsets.all(10),
                child: Card(
                child: Column(
                  children: [
                    Container(
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(width: 20,),
                          Text("Task",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          Row(
                            children: [
                              SizedBox(width: 40,),
                              Text("3  Task",style: TextStyle(color: Colors.grey),),
                              SizedBox(width: 30,),
                              Icon(Icons.arrow_drop_up,color: Colors.grey,)
                            ],)
                        ],),
                      padding: EdgeInsets.all(10),
                    ),

                    ListTile(
                      leading: Icon(Icons.table_rows_outlined,color: Colors.black,),
                      title: Text("Work On gmail"),
                      trailing:Text ("..."),
                    ),
                    SizedBox(height: 10,),
                    ListTile(
                      leading: Icon(Icons.table_rows_outlined,color: Colors.black,),
                      title: Text("visite memeber "),
                      trailing:Text ("..."),
                    ),
                    SizedBox(height: 10,),
                    ListTile(
                      leading: Icon(Icons.table_rows_outlined,color: Colors.black,),
                      title: Text("make appointment"),
                      trailing:Text ("..."),
                    ),
                    SizedBox(height: 50,),
                    Row(children: [
                      SizedBox(width: 30,),
                      Icon(Icons.add,color: Colors.pinkAccent,),
                      Text(" view all"),
                      SizedBox(height: 50,),

                    ],),
                    Divider(height: 5,),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      Text("Alert",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Icon(Icons.arrow_drop_up,color: Colors.grey,)
                    ],),
                    ListTile(
                      leading: Icon(Icons.warning,color: Colors.black,),
                      title: Text("Interest rate change to 5%"),
                      trailing:Text ("..."),
                    ),
                    SizedBox(height: 10,),
                    ListTile(
                      leading: Icon(Icons.warning,color: Colors.black,),
                      title: Text("Fill form of onboarding"),
                      trailing:Text ("..."),
                    ),
                    SizedBox(height: 10,),
                    ListTile(
                      leading: Icon(Icons.warning,color: Colors.black,),
                      title: Text("Check leave count of month"),
                      trailing:Text ("..."),
                    ),
                    SizedBox(height: 10,),
                    ListTile(
                      leading: Icon(Icons.warning,color: Colors.black,),
                      title: Text("New schemes Closed"),
                      trailing:Text ("..."),
                    ),
                    Row(children: [
                      SizedBox(width: 30,),
                      Icon(Icons.add,color: Colors.pinkAccent,),
                      Text(" view all"),
                      SizedBox(height: 50,),

                    ],),
                  ],
                ),

              ),))
              ],
            ),
          )],

        ),
      );
  }

  Future<void> GetGroupChatModel() async {
    try {
      final response = await http
          .get(Uri.parse(
              "https://briidea.ensurechat.com/api/ChatGroup/showGroupListforChat?id=1"))
          .timeout(const Duration(minutes: 5));
      print("response.statusCode ---${response.statusCode}");
      print("GroupData Reso--${json.decode(response.body).toString()}");

      if (response.statusCode == 200) {
        setState(() {
          final jsonResponse = json.decode(response.body);
          chatGroup = ChatGroup.fromJson(jsonResponse);
        });
      }
    } catch (e) {
      print("error-----${e.toString()}");
    }
  }

  Future<void> UserData() async {
    try {
      final response = await http
          .get(Uri.parse(
              "https://briidea.ensurechat.com/api/UserChat/showUserListforChat/?id=1"))
          .timeout(const Duration(minutes: 5));
      print("response.statusCode ---${response.statusCode}");
      print("UserData Reso--${json.decode(response.body).toString()}");

      if (response.statusCode == 200) {
        setState(() {
          final jsonResponse = json.decode(response.body);
          if (jsonResponse != null) {
            userResponse = UserResponse.fromJson(jsonResponse);
          } else {
            print("null value error");
          }
        });
      }
    } catch (e) {
      print("error-----${e.toString()}");
    }
  }

  Widget _chatInput() {
    return  Column(
      children: [
        Container(
          height: 800,
          color: Colors.white,
        ),
        Row(
            children: [
              Expanded(
                child: Card(
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.emoji_emotions,
                            color: Colors.blueAccent,
                          )),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Type Something...',
                            hintStyle: TextStyle(color: Colors.blueAccent),
                            border: InputBorder.none),
                      )),
                      IconButton(
                          onPressed: () {},
                          icon:
                              Icon(Icons.image, color: Colors.blueAccent, size: 26)),
                      IconButton(
                          onPressed: () {},


                          icon: Icon(Icons.camera_alt_rounded,
                              color: Colors.blueAccent, size: 26)),
                    ],
                  ),
                ),
              ),
              MaterialButton(
                padding: EdgeInsets.all(10),
                onPressed: () {},
                child: Icon(
                  Icons.send,
                  color: Colors.purple,
                  size: 28,
                ),
              )
            ],
          ),
      ],
    );
  }
}
