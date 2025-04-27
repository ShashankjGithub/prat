String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return "Enter your email";
  }

  final emailRegex = RegExp(r"^[\w\.\+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z]{2,}$");

  if (!emailRegex.hasMatch(email)) {
    return "Enter a valid email";
  }

  return null;
}


String? validateEmpty(String? text, String title) {
  if (text == null || text.trim().isEmpty) {
    return 'Enter your $title';
  }
  return null;
}