Map<String, String> splitFullName(String? fullName) {
  if (fullName == null || fullName.trim().isEmpty) {
    return {'firstName': '', 'lastName': ''};
  }

  final nameParts = fullName.trim().split(RegExp(r'\s+'));
  final firstName = nameParts.first;
  final lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

  return {'firstName': firstName, 'lastName': lastName};
}