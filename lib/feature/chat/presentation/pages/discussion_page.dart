import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/core/size_config.dart';
import 'package:LASYLAB/forms/message_widget.dart';
import 'package:LASYLAB/models/message.dart';
import 'package:LASYLAB/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class DiscussionPage extends StatefulWidget {
  const DiscussionPage({Key? key, this.user}) : super(key: key);
  final Usermodel? user;
  @override
  _DiscussionPageState createState() => _DiscussionPageState();
}

class _DiscussionPageState extends State<DiscussionPage>
    with TickerProviderStateMixin {
  AnimationController? animationcontroller;
  final _controller = TextEditingController();
  String message = '';
  String imageUrl = '';
  List<Message> messages = [
    Message(
        content: "bonjour",
        createdAt: DateTime.now(),
        receiverUid: "fneojbfih",
        senderUid: "cdjlzjbihd",
        type: "texte",
        uid: "kjczebibczybe",
        isMe: true),
    Message(
        content:
            "bonjour dknzlenlli eclziehpiz celzocpizpei cepiepjaz cipaicnapihoi ceohpihoha dpicachoahe,s pefhoaheiofihi lcolehofihzpief ohzoefhozieh",
        createdAt: DateTime.now(),
        receiverUid: "fneojbfih",
        senderUid: "cdjlzjbihd",
        type: "texte",
        uid: "kjczebibczybe",
        isMe: false),
    // Message(
    //     content: "bonjour",
    //     createdAt: DateTime.now(),
    //     receiverUid: "fneojbfih",
    //     senderUid: "cdjlzjbihd",
    //     type: "texte",
    //     uid: "kjczebibczybe",
    //     isMe: true),
    // Message(
    //     content: "bonjour",
    //     createdAt: DateTime.now(),
    //     receiverUid: "fneojbfih",
    //     senderUid: "cdjlzjbihd",
    //     type: "texte",
    //     uid: "kjczebibczybe",
    //     isMe: false),
    // Message(
    //     content: "bonjour",
    //     createdAt: DateTime.now(),
    //     receiverUid: "fneojbfih",
    //     senderUid: "cdjlzjbihd",
    //     type: "texte",
    //     uid: "kjczebibczybe",
    //     isMe: true),
    // Message(
    //     content: "bonjour",
    //     createdAt: DateTime.now(),
    //     receiverUid: "fneojbfih",
    //     senderUid: "cdjlzjbihd",
    //     type: "texte",
    //     uid: "kjczebibczybe",
    //     isMe: false),
  ];
  // void sendMessage() async {
  //   FocusScope.of(context).unfocus();
  //   var msg = Message(
  //     content: _controller.text.isEmpty ? imageUrl : _controller.text,
  //     createdAt: DateTime.now(),
  //     receiverUid: widget.user!.id,
  //     type: _controller.text.isEmpty ? "image" : "texte",
  //     senderUid: AuthService().user != null
  //         ? AuthService().user!.uid
  //         : DBService().getLocalUser()!.id,
  //   );
  //
  //   await DBService().sendMessage(msg);
  //   Logger().d("message envoyé");
  //   _controller.clear();
  // }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black, // navigation bar color
        statusBarColor: Color(0xffED9B0C),
        statusBarIconBrightness: Brightness.light, // status bar color
      ),
    );
    animationcontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationcontroller!.dispose();
    super.dispose();
  }

  // File? imageFile;
  // Future getImage() async {
  //   _controller.clear();
  //   ImagePicker _picker = ImagePicker();
  //   await _picker.pickImage(source: ImageSource.gallery).then((xFile) async {
  //     if (xFile != null) {
  //       setState(() {
  //         imageFile = File(xFile.path);
  //       });
  //       await uploadImage();
  //     }
  //   });
  // }

  // Future uploadImage() async {
  //   String fileName = Uuid().v1();
  //   Logger().d("Begin send image");
  //
  //   var ref =
  //       FirebaseStorage.instance.ref().child("images").child("$fileName.jpg");
  //   var uploadTask = await ref.putFile(imageFile!).catchError((error) async {
  //     //supprimer le fichier
  //   });
  //
  //   imageUrl = await uploadTask.ref.getDownloadURL();
  //
  //   sendMessage();
  //   Logger().d("End send image");
  //   Logger().d("Image URL " + imageUrl);
  // }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: screenSize.height * .17,
            padding: EdgeInsets.only(top: screenSize.height * .035),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffED9B0C),
                    Color.fromRGBO(254, 147, 48, 0.8),
                  ],
                )),
            child: Column(
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: dimensH(25, sm: 35),
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Container(
                        height: dimensH(screenSize.height * .07,
                            sm: screenSize.height * .1),
                        width: dimensW(screenSize.width * .14,
                            sm: screenSize.width * .18),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.white),
                            shape: BoxShape.circle,
                            color: Color(0xffE5E5E5),
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/Female_Memojis.png"))),
                      ),
                      SizedBox(
                        width: dimensW(10),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Vanessa",
                              style: TextStyle(
                                  fontSize: dimensH(
                                      4.1 * SizeConfig.textMultiplier,
                                      sm: 30),
                                  color: Colors.white.withOpacity(.8),
                                  fontWeight: FontWeight.w700),
                            ),
                            Container(
                              height: screenSize.height * .03,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                "MATHS",
                                style: TextStyle(
                                    color: AppTheme.blueColor,
                                    fontSize: dimensH(
                                        1.75 * SizeConfig.textMultiplier,
                                        sm: 14),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "En ligne",
                                style: TextStyle(
                                    fontSize: dimensH(
                                        1.65 * SizeConfig.textMultiplier,
                                        sm: 12),
                                    color: Colors.white.withOpacity(.8),
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: dimensW(screenSize.width * .25),
                      ),
                      InkWell(
                        child: Container(
                          height: screenSize.height * .05,
                          width: screenSize.width * .05,
                          child: Image.asset(
                            "assets/images/phone.png",
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * .01,
                ),
              ],
            ),
          ),
          //liste des messages
          Expanded(
              child: ListView.builder(
                  itemCount: messages.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  reverse: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    return MessageWidget(message: msg);
                  })),
          //body end
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: TextField(
                      controller: _controller,
                      autocorrect: true,
                      maxLines: 1,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * .05),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(
                              color: AppTheme.grayColor,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(
                              color: AppTheme.grayColor,
                            )),
                        filled: true,
                        hintStyle: TextStyle(
                            color: AppTheme.grayColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                        hintText: "Message",
                        fillColor: Color(0xffF7F7F7),
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            // await getImage();
                          },
                          child: Icon(
                            Icons.image,
                            color: Colors.black, // HexColor("#AFAFAF"),
                          ),
                        ),
                      ),
                      onChanged: (value) => setState(() {
                        message = value;
                      }),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    // message.trim().isEmpty
                    //     ? () {
                    //         Navigator.push(context,
                    //             MaterialPageRoute(builder: (_) {
                    //           return Container();
                    //         }));
                    //       }
                    //     : sendMessage,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF7F7F7),
                          border: Border.all(
                            color: AppTheme.grayColor,
                          )),
                      alignment: Alignment.center,
                      child: Icon(
                        message.trim().isEmpty ? Icons.mic_none : Icons.send,
                        color: AppTheme.grayColor,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildText(String text) => Center(
        child: Text(
          "Dites quelque chose ...",
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            color: HexColor("#AFAFAF"),
            textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
