import 'package:cucp_yes_no_app/domain/entities/message.dart';

class YesNoModel{
  String answer;
    bool forced;
    String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModel.fromJson(Map<String, dynamic> json) {
      return YesNoModel(
        answer: json["answer"] == 'yes' ? 'Si' : 'No',
        forced: json["forced"],
        image: json["image"],
    );
    }

    Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };

    Message toMessageEntity() => Message(
      text: answer,
      fromWho: FromWho.her,
      imageUrl: image);
}