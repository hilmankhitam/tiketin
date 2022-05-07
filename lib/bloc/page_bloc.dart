import 'package:bloc/bloc.dart';
import 'package:bwa_flutix/models/models.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnInitialPage()) {
    on<GoToSplashPage>((event, emit) => emit(OnSplashPage()));

    on<GoToLoginPage>((event, emit) => emit(OnLoginPage()));

    on<GoToMainPage>((event, emit) => emit(OnMainPage(
        bottomNavBarIndex: event.bottomNavBarIndex,
        isExpired: event.isExpired)));

    on<GoToRegistrationPage>(
        (event, emit) => emit(OnRegistrationPage(event.registrationData)));

    on<GoToPreferencePage>(
        (event, emit) => emit(OnPreferencePage(event.registrationData)));

    on<GoToAccountConfirmationPage>((event, emit) =>
        emit(OnAccountConfirmationPage(event.registrationData)));

    on<GoToMovieDetailPage>(
        (event, emit) => emit(OnMovieDetailPage(event.movie)));

    on<GoToSelectSchedulePage>(
        (event, emit) => emit(OnSelectSchedulePage(event.movieDetail)));

    on<GoToSelectSeatPage>(
        (event, emit) => emit(OnSelectSeatPage(event.ticket)));

    on<GoToCheckoutPage>((event, emit) => emit(OnCheckoutPage(event.ticket)));

    on<GoToSuccessPage>(
        (event, emit) => emit(OnSuccessPage(event.ticket, event.transaction)));

    on<GoToTicketDetailPage>(
        (event, emit) => emit(OnTicketDetailPage(event.ticket)));

    on<GoToProfilePage>((event, emit) => emit(OnProfilePage()));

    on<GoToTopUpPage>((event, emit) => emit(OnTopUpPage(event.pageEvent)));

    on<GoToWalletPage>((event, emit) => emit(OnWalletPage(event.pageEvent)));

    on<GoToEditProfilePage>(
        (event, emit) => emit(OnEditProfilePage(event.user)));
  }

  // @override
  // Stream<PageState> mapEventToState(
  //   PageEvent event,
  // ) async* {
  //   if (event is GoToSplashPage) {
  //     yield OnSplashPage();
  //   } else if (event is GoToLoginPage) {
  //     yield OnLoginPage();
  //   } else if (event is GoToMainPage) {
  //     yield OnMainPage(
  //         bottomNavBarIndex: event.bottomNavBarIndex,
  //         isExpired: event.isExpired);
  //   } else if (event is GoToRegistrationPage) {
  //     yield OnRegistrationPage(event.registrationData);
  //   } else if (event is GoToPreferencePage) {
  //     yield OnPreferencePage(event.registrationData);
  //   } else if (event is GoToAccountConfirmationPage) {
  //     yield OnAccountConfirmationPage(event.registrationData);
  //   } else if (event is GoToMovieDetailPage) {
  //     yield OnMovieDetailPage(event.movie);
  //   } else if (event is GoToSelectSchedulePage) {
  //     yield OnSelectSchedulePage(event.movieDetail);
  //   } else if (event is GoToSelectSeatPage) {
  //     yield OnSelectSeatPage(event.ticket);
  //   } else if (event is GoToCheckoutPage) {
  //     yield OnCheckoutPage(event.ticket);
  //   } else if (event is GoToSuccessPage) {
  //     yield OnSuccessPage(event.ticket!, event.transaction);
  //   } else if (event is GoToTicketDetailPage) {
  //     yield OnTicketDetailPage(event.ticket);
  //   } else if (event is GoToProfilePage) {
  //     yield OnProfilePage();
  //   } else if (event is GoToTopUpPage) {
  //     yield OnTopUpPage(event.pageEvent);
  //   } else if (event is GoToWalletPage) {
  //     yield OnWalletPage(event.pageEvent);
  //   } else if (event is GoToEditProfilePage) {
  //     yield OnEditProfilePage(event.user);
  //   }
  // }
}
