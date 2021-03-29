/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final bool isLogout;

  const AuthState({
    this.isLogout,
  });

  factory AuthState.initial() {
    return AuthState(
      isLogout: false,
    );
  }

  AuthState copyWith({
    bool isLogout,
  }) {
    return AuthState(
      isLogout: isLogout ?? this.isLogout,
    );
  }

  @override
  List<Object> get props => <Object>[
        this.isLogout,
      ];
}
