part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.authenticated = false,
    this.user,
    this.toggler = false,
  });

  final bool authenticated;
  final User? user;
  final bool toggler;

  AuthenticationState copyWith({
    bool? authenticated,
    User? user,
    bool? toggler,
  }) {
    return AuthenticationState(
        authenticated: authenticated ?? this.authenticated,
        user: user ?? this.user,
        toggler: toggler ?? this.toggler);
  }

  @override
  List<Object?> get props => [user, authenticated];

  Map<String, dynamic> toMap() {
    return {
      'authenticated': authenticated,
      'user': user?.toMap(),
    };
  }

  factory AuthenticationState.fromMap(Map<String, dynamic> map) {
    return AuthenticationState(
      authenticated: map['authenticated'] ?? false,
      user: map['user'] != null ? User.fromMap(map['user']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenticationState.fromJson(String source) =>
      AuthenticationState.fromMap(json.decode(source));
}
