part of 'dashboard_screen_bloc.dart';

sealed class DashboardScreenState extends Equatable {
  const DashboardScreenState();
  
  @override
  List<Object> get props => [];
}

final class DashboardScreenInitial extends DashboardScreenState {}
