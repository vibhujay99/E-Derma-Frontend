
class DiseaseModel{
  //name of the disease
  String name;
  // description of the disease
  String description;
  // description of the disease
  String remedy;
  //index of the disease given in labels.txt file
  int index;
  //source of the disease information
  String source;

  //constructor
  DiseaseModel({
    required this.name,
    required this.description,
    required this.remedy,
    required this.source,
    required this.index});
}