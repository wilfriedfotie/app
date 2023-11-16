import 'package:LASYLAB/models/message.dart';
import 'package:LASYLAB/models/quiz.dart';
import 'package:LASYLAB/models/user.dart';
import 'package:LASYLAB/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

class DBService {
  final CollectionReference usercollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference messagecollection =
      FirebaseFirestore.instance.collection("messages");
  final CollectionReference quizcollection =
      FirebaseFirestore.instance.collection("quiz");
  final box = GetStorage();
  Future saveUser(Usermodel user) async {
    try {
      box.write("user", user.toJson());
      await usercollection.doc(user.id).set(user.toJson());
      return true;
    } catch (e) {
      Logger().d(e);
      return false;
    }
  }

  Future<Usermodel?> getUser(String id) async {
    try {
      final data = await usercollection.doc(id).get();
      final user = Usermodel.fromJson(data.data() as Map<String, dynamic>);
      return user;
    } catch (e) {
      return null;
    }
  }

  Usermodel? getLocalUser() {
    final box = GetStorage();
    try {
      return Usermodel.fromJson(box.read("user"));
    } catch (e) {
      return box.read("user");
    }
  }

  Future<bool> verifyIfPhoneExist(String phone) async {
    bool exist = false;
    try {
      /* await usercollection.get().then((value) {
        value.docs.forEach((element) {
          Logger().d(element.get("telephone"));
          if (element.get("telephone") == phone) {
            exist = true;
            //return;
          }
        });
      });*/

      //deuxieme méthode
      final result = await usercollection.get();
      for (var i = 0; i < result.docs.length; i++) {
        Logger().d(result.docs[i].get("telephone") + "--" + phone);
        if (result.docs[i].get("telephone") == phone) {
          exist = true;
          break;
        }
      }
      Logger().d("Existe " + exist.toString());
      return exist;
    } catch (e) {
      return exist;
    }
  }

  Future<Usermodel?> loginWithFirestore(String phone, String password) async {
    Usermodel? user;
    try {
      if (await verifyIfPhoneExist(phone)) {
        await usercollection.get().then((value) {
          value.docs.forEach((element) {
            if (element.get("telephone") == phone &&
                element.get("password") == password) {
              user = Usermodel.fromJson(element.data() as Map<String, dynamic>);
              Logger().d(user);
              if (user != null) {
                saveUser(user!);
              }
              return;
            }
          });
        });
        Logger().d(user!.toJson());
        return user;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Stream<List<Usermodel>> getDiscussionUser({String type = "teacher"}) {
    Usermodel? user = getLocalUser();

    return usercollection
        .where('id',
            isNotEqualTo:
                AuthService().user != null ? AuthService().user!.uid : user!.id)
        .where("type", isEqualTo: type)
        .snapshots()
        .map((event) => event.docs
            .map((e) => Usermodel.fromJson(e.data() as Map<String, dynamic>))
            .toList());
  }

  Stream<List<Message>> getMessage(String receiverUID,
      [bool myMessage = true]) {
    Usermodel? user = getLocalUser();
    return messagecollection
        .where("senderUID",
            isEqualTo: myMessage
                ? (AuthService().user != null
                    ? AuthService().user!.uid
                    : user!.id)
                : receiverUID)
        .where("receiverUID",
            isEqualTo: myMessage
                ? receiverUID
                : (AuthService().user != null
                    ? AuthService().user!.uid
                    : user!.id))
        .snapshots()
        .map((event) => event.docs
            .map(
                (e) => Message.fromJson(e.data() as Map<String, dynamic>, e.id))
            .toList());
  }

  /*.where("receiverUID",
            isEqualTo: myMessage
                ? receiverUID
                : (AuthService().user != null
                    ? AuthService().user!.uid
                    : user!.id))*/
  Stream<List<Message>> getMySentFiles() {
    Usermodel? user = getLocalUser();
    return messagecollection
        .where("senderUID",
            isEqualTo: (AuthService().user != null
                ? AuthService().user!.uid
                : user!.id))
        .snapshots()
        .map((event) => event.docs
            .map(
                (e) => Message.fromJson(e.data() as Map<String, dynamic>, e.id))
            .toList());
  }

  Stream<List<Message>> getMyReceivedFiles() {
    Usermodel? user = getLocalUser();
    return messagecollection
        .where("receiverUID",
            isEqualTo: (AuthService().user != null
                ? AuthService().user!.uid
                : user!.id))
        .snapshots()
        .map((event) => event.docs
            .map(
                (e) => Message.fromJson(e.data() as Map<String, dynamic>, e.id))
            .toList());
  }

  Future<bool> sendMessage(Message message) async {
    try {
      await messagecollection.doc().set(message.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Stream<Message> getLastMessage() {
    Usermodel? user = getLocalUser();
    return messagecollection
        .orderBy("createdAt", descending: true)
        .snapshots()
        .map((event) => event.docs
            .map(
                (e) => Message.fromJson(e.data() as Map<String, dynamic>, e.id))
            .first);
  }

  Stream<List<Message>> getLastSentMessage() {
    Usermodel? user = getLocalUser();
    return messagecollection
        .where("senderUID",
            isEqualTo: (AuthService().user != null
                ? AuthService().user!.uid
                : user!.id))
        .snapshots()
        .map((event) => event.docs
            .map(
                (e) => Message.fromJson(e.data() as Map<String, dynamic>, e.id))
            .toList());
  }

  Stream<List<Message>> getLastReceivedMessage() {
    Usermodel? user = getLocalUser();
    return messagecollection
        .where("receiverUID",
            isEqualTo: (AuthService().user != null
                ? AuthService().user!.uid
                : user!.id))
        .snapshots()
        .map((event) => event.docs
            .map(
                (e) => Message.fromJson(e.data() as Map<String, dynamic>, e.id))
            .toList());
  }

  String idlecon = "12323";
  Future<Quiz?> getQuiz() async {
    try {
      Logger().d("after");
      var collection =
          quizcollection.where("id_lecon", isEqualTo: idlecon).snapshots();
      Logger().d("afte2r");
      var first = (await collection.first);

      var e = first.docs[0];

      List questionsBrutes = ((e.data() as Map<String, dynamic>)["questions"]);
      var questions = [];
      for (int i = 0; i < questionsBrutes.length; i++) {
        var qq = await questionsBrutes[i].get();
        var question = qq.data() as Map<String, dynamic>;
        question['id'] = qq.id;
        List reponses = [];
        var reponsesBruts = question['reponses'];

        for (int j = 0; j < reponsesBruts.length; j++) {
          var rr = await reponsesBruts[j].get();
          var response = rr.data() as Map<String, dynamic>;
          response['id'] = rr.id;
          reponses.add(response);
        }
        question['reponses'] = reponses;

        var cc = await question['correct'].get();
        var correct = cc.data() as Map<String, dynamic>;
        correct['id'] = cc.id;
        //question['correct'] = await question['correct'].get();
        question['correct'] = correct;
        questions.add(question);
      }
      //Logger().d(questions);
      Map<String, dynamic> quiz = e.data() as Map<String, dynamic>;
      quiz['id'] = e.id;
      quiz['questions'] = questions;
      Logger().d(quiz);
      return Quiz.fromJson(quiz);
    } catch (e) {
      Logger().d(e);
      return null;
    }
  }
}
