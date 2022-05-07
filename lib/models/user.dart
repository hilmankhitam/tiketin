part of 'models.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? profilePicture;
  final List<String> selectedGenres;
  final String selectedLanguage;
  final int balance;

  UserModel(this.id, this.email,
      {required this.name,
      this.profilePicture,
      required this.balance,
      required this.selectedGenres,
      required this.selectedLanguage});

  UserModel copyWith({String? name, String? profilePicture, int? balance}) =>
      UserModel(this.id, this.email,
          name: name ?? this.name,
          profilePicture: profilePicture ?? this.profilePicture,
          balance: balance ?? this.balance,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

  @override
  String toString() {
    return "[$id] - $name, $email";
  }

  @override
  List<Object> get props => [
        id,
        email,
        name,
        profilePicture!,
        selectedGenres,
        selectedLanguage,
        balance
      ];
}
