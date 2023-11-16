import 'package:LASYLAB/core/components/styling.dart';
import 'package:LASYLAB/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class MessageWidget extends StatefulWidget {
  final Message? message;

  const MessageWidget({
    required this.message,
  });

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget>
    with TickerProviderStateMixin {
  AnimationController? animationcontroller;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    animationcontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationcontroller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var date = widget.message!.createdAt!.toLocal();
    Size screeSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: widget.message!.isMe == true
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: widget.message!.isMe == true
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            widget.message!.type == "texte"
                ? Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      bottom: 5,
                    ),
                    constraints: BoxConstraints(maxWidth: screeSize.width * .8),
                    decoration: BoxDecoration(
                      color: widget.message!.isMe == true
                          ? AppTheme.out_coming_msg
                          : AppTheme
                              .in_coming_msg, // HexColor("#F4F8FB") contre #235390
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: buildMessage(),
                  )
                : Container(
                    margin: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      bottom: 5,
                    ),
                    child: buildImage(),
                  ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: Text(
                "Envoyé à ${date.hour}h ${date.minute}",
                style: GoogleFonts.poppins(
                  color: HexColor("#AFAFAF"),
                  textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildMessage() => Column(
        crossAxisAlignment: widget.message!.isMe == true
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.message!.content!,
            style: GoogleFonts.poppins(
              color: Colors.black,
              textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            textAlign: widget.message!.isMe == true
                ? TextAlign.start
                : TextAlign.start,
          ),
        ],
      );

  Widget buildImage() => GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailImage(
              image: widget.message!.content!,
            );
          }));
        },
        child: Hero(
          tag: "imageHero",
          child: Column(
            crossAxisAlignment: widget.message!.isMe == true
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: <Widget>[
              widget.message!.content != ''
                  ? Container(
                      constraints:
                          BoxConstraints(maxWidth: 250, maxHeight: 150),
                      decoration: BoxDecoration(
                        borderRadius: widget.message!.isMe == true
                            ? BorderRadius.all(Radius.circular(12)).subtract(
                                BorderRadius.only(
                                    bottomRight: Radius.circular(12)))
                            : BorderRadius.all(Radius.circular(12)).subtract(
                                BorderRadius.only(
                                    bottomLeft: Radius.circular(12))),
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: NetworkImage(widget.message!.content!)),
                      ),
                    )
                  : SpinKitWave(
                      color: HexColor("#235390"),
                      size: 25,
                      controller: animationcontroller,
                    ),
            ],
          ),
        ),
      );
}

class DetailImage extends StatelessWidget {
  const DetailImage({Key? key, this.image}) : super(key: key);
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#235390"),
        centerTitle: true,
        title: Text("Image"),
        leading: BackButton(),
      ),
      body: Center(
        child: Hero(
          tag: "imageHero",
          child: Image.network(image!),
        ),
      ),
    );
  }
}
