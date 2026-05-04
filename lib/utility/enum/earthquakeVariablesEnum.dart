
enum earthquakeVariablesEnum{
  id,
  earthquakeId,
  provider,
  title,
  date,
  mag,
  depth;

  String get name => toString().split('.').last;


}