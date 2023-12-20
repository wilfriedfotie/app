import 'dart:io';

import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/core/size_config.dart';
import 'package:LASYLAB/feature/authentication/logic/bloc/user/user_bloc.dart';
import 'package:LASYLAB/feature/chat/data/request/chat_fetch_params.dart';
import 'package:LASYLAB/feature/chat/data/response/message_response.dart';
import 'package:LASYLAB/feature/chat/logic/bloc/bloc/chat_bloc.dart';
import 'package:LASYLAB/feature/chat/logic/cubit/message/message_cubit.dart';
import 'package:LASYLAB/feature/chat/data/request/message_request.dart';
import 'package:LASYLAB/feature/chat/data/response/group_response.dart';
import 'package:LASYLAB/feature/chat/data/response/user_response.dart';
import 'package:LASYLAB/feature/chat/presentation/pages/test_recorder.dart';
import 'package:LASYLAB/feature/chat/presentation/widget/image_choose_widget.dart';
import 'package:LASYLAB/feature/chat/provider/chat_provider.dart';
import 'package:LASYLAB/feature/chat/service/audio_recording_service.dart';
import 'package:LASYLAB/forms/message_widget.dart';
import 'package:LASYLAB/models/message.dart';
import 'package:LASYLAB/models/user.dart';
import 'package:LASYLAB/services/audio_service/audio_recorder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class DiscussionPage extends StatefulWidget {
  static const routeName = "/discussions";

  const DiscussionPage({Key? key, this.user}) : super(key: key);
  final Usermodel? user;

  @override
  _DiscussionPageState createState() => _DiscussionPageState();
}

class _DiscussionPageState extends State<DiscussionPage>
    with TickerProviderStateMixin {
  AnimationController? animationcontroller;
  ScrollController _scrollController = ScrollController();
  final _controller = TextEditingController();
  String message = '';
  File? _image;
  bool _loading = false, _hasMore = false;
  int nbre = 20;
  bool _isVoiceRecorde = false;
  DocumentSnapshot? lastDocument;
  late AudioRecordingService _audioRecordingService =
      GetIt.instance<AudioRecordingService>();

  bool showPlayer = false;

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

    context.read<ChatBloc>().add(FetchChatMessages());

    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    animationcontroller!.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _fetchData();
    }
  }

  Future<void> _fetchData() async {
    if (_hasMore) {
      setState(() {
        nbre = nbre + nbre;
      });
    }

    // context.read<ChatBloc>().add(FetchMoreChatMessages(
    //     params: ChatFecthParams(
    //         lastMessage: context.read<ChatBloc>().state.lastDocumentSnapshot,
    //         nbre: 10,
    //         isOrderBydate: false,
    //         id: response.id!.id)));
  }

  @override
  Widget build(BuildContext context) {
    GroupResponse response =
        ModalRoute.of(context)?.settings.arguments as GroupResponse;
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 140,
            padding: EdgeInsets.only(top: kToolbarHeight),
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
                          image:
                              AssetImage("assets/images/Female_Memojis.png"))),
                ),
                SizedBox(
                  width: dimensW(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Vanessa",
                        style: TextStyle(
                            fontSize: dimensH(4.1 * SizeConfig.textMultiplier,
                                sm: 30),
                            color: Colors.white.withOpacity(.8),
                            fontWeight: FontWeight.w700),
                      ),
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
                            fontSize: dimensH(1.75 * SizeConfig.textMultiplier,
                                sm: 14),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "En ligne",
                        style: TextStyle(
                            fontSize: dimensH(1.65 * SizeConfig.textMultiplier,
                                sm: 12),
                            color: Colors.white.withOpacity(.8),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                Spacer(),
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
          //liste des messages
          Expanded(
              child: StreamBuilder<List<MessageResponse>>(
                  stream: GetIt.instance<ChatProvider>()
                      .getLastChatMessages(ChatFecthParams(
                          lastMessage: lastDocument,
                          nbre: nbre,
                          isOrderBydate: true,
                          id: response.id!.id))
                      .map((event) {
                    lastDocument = event.docs.last;
                    _hasMore = event.docs.length % nbre == 0 ? true : false;
                    _loading = false;
                    return event.docs
                        .map((e) =>
                            MessageResponse.fromMap({...e.data(), "id": e.id}))
                        .toList();
                  }),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return ListView(
                          controller: _scrollController,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          reverse: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            ...snapshot.data!.map((e) => Column(
                                  children: [
                                    MessageWidget(
                                        message: Message(
                                      createdAt: e.date ?? DateTime.now(),
                                      receiverUid: "fneojbfih",
                                      senderUid: "cdjlzjbihd",
                                      type: "texte",
                                      uid: "uisdbnjsdnks",
                                      isMe: (context.read<UserBloc>().state
                                                  as UserSuccess)
                                              .data
                                              .id ==
                                          e.sender,
                                      content: e.message,
                                    )),
                                  ],
                                )),
                            if (_hasMore)
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                )),
                              ),
                          ]);
                    }
                    if (snapshot.hasError) {
                      return Container();
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  })),
          //body end
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
            child: Column(
              children: [
                if (_image is File)
                  Stack(
                    children: [
                      Image.file(
                        _image!,
                        height: 200,
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                _image = null;
                              });
                            },
                            icon: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    shape: BoxShape.circle),
                                child: Icon(Icons.close))),
                      )
                    ],
                  ),
                Row(
                  children: [
                    _isVoiceRecorde
                        ? Container()
                        : Expanded(
                            child: TextFormField(
                                maxLines: 7,
                                keyboardType: TextInputType.multiline,
                                minLines: 1,
                                controller: _controller,
                                autocorrect: true,
                                textCapitalization:
                                    TextCapitalization.sentences,
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
                                    child: IconButton(
                                        onPressed: () async {
                                          final result =
                                              await showModalBottomSheet(
                                                  context: context,
                                                  builder: (BuildContext bc) {
                                                    return const GetImage(
                                                        rad: true);
                                                  });

                                          setState(() {
                                            _image = result;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.image,
                                          color: Colors
                                              .black, // HexColor("#AFAFAF"),
                                        )),
                                  ),
                                )),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () async {
                          if (_controller.text.isNotEmpty) {
                            // response

                            context.read<MessageCubit>().sendMessage(
                                MessageRequest(
                                    message: _controller.text.trim(),
                                    createdAt: DateTime.now(),
                                    type: MessageResponseType.text,
                                    isAnswer: false,
                                    sender: UserResponse(
                                        id: response.initiator.id,
                                        name: "Wilfried"),
                                    chat: response));
                          } else {
                            if (showPlayer) {
                              _audioRecordingService
                                  .stopRecording()
                                  .then((value) {
                                setState(() {
                                  showPlayer = !showPlayer;
                                });
                              });
                              return;
                            }
                            await _audioRecordingService.requestPermissions();
                            _audioRecordingService
                                .startRecording()
                                .then((value) {
                              setState(() {
                                showPlayer = !showPlayer;
                              });
                            });
                          }
                        },
                        child: Container(
                          width: _isVoiceRecorde
                              ? MediaQuery.of(context).size.width / 1.2
                              : null,
                          padding: EdgeInsets.all(8),
                          decoration: _isVoiceRecorde
                              ? BoxDecoration()
                              : BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffF7F7F7),
                                  border: Border.all(
                                    color: AppTheme.grayColor,
                                  )),
                          alignment: Alignment.center,
                          child: BlocConsumer<MessageCubit, MessageState>(
                            listener: (context, state) {
                              if (state is SendMessageLoading) {
                                _controller.clear();
                              }
                            },
                            builder: (context, state) {
                              // if (state is SendMessageLoading) {
                              //   return Container(
                              //     alignment: Alignment.center,
                              //     height: 20,
                              //     width: 20,
                              //     child: CircularProgressIndicator(
                              //       strokeWidth: 2,
                              //     ),
                              //   );
                              // }
                              return ValueListenableBuilder(
                                  valueListenable: _controller,
                                  builder: (context, val, __) {
                                    if (val.text.trim().isEmpty &&
                                        _image is! File) {
                                      return TestRecorder();
                                    }
                                    return Icon(
                                      val.text.trim().isEmpty && _image is! File
                                          ? Icons.mic_none
                                          : Icons.send,
                                      color: AppTheme.grayColor,
                                      size: 24,
                                    );
                                  });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
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
