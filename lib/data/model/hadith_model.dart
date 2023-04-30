class HadithModel{
  int? number;
  String? arab;

  HadithModel({this.number,this.arab});

  factory HadithModel.fromJson(Map<String, dynamic> data)
  {
    return HadithModel(
      number: data["number"],
      arab : data["arab"],
    );
  }

}