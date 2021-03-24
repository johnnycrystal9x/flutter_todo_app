/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final bool updating;
  final String error;
  final DateTime lastUpdated;
  final int statusCode;

  const HomeState({
    this.isLoading,
    this.updating,
    this.error,
    this.lastUpdated,
    this.statusCode,
  });

  factory HomeState.initial() {
    return HomeState(
      isLoading: false,
      updating: false,
      error: "",
      lastUpdated: null,
      statusCode: null,
    );
  }

  HomeState copyWith({
    bool isLoading,
    bool updating,
    String error,
    DateTime lastUpdated,
    int statusCode,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      updating: updating ?? this.updating,
      error: error ?? this.error,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      statusCode: statusCode ?? this.statusCode,
    );
  }

  @override
  List<Object> get props => <Object>[
        this.isLoading,
        this.updating,
        this.error,
        this.lastUpdated,
        this.statusCode,
      ];
}
