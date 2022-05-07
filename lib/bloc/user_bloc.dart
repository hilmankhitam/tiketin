import 'package:bloc/bloc.dart';
import 'package:bwa_flutix/models/models.dart';
import 'package:bwa_flutix/services/services.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadUser>((event, emit) async {
      UserModel user = await UserServices.getUser(event.id);
      emit(UserLoaded(user));
    });

    on<SignOut>((event, emit) async {
      emit(UserInitial());
    });

    on<UpdateData>((event, emit) async {
      UserModel updatedUser = (state as UserLoaded)
          .user
          .copyWith(name: event.name, profilePicture: event.profileImage);

      await UserServices.updateUser(updatedUser);

      emit(UserLoaded(updatedUser));
    });

    on<TopUp>((event, emit) async {
      if (state is UserLoaded) {
        try {
          UserModel updatedUser = (state as UserLoaded).user.copyWith(
              balance: (state as UserLoaded).user.balance + event.amount);
          await UserServices.updateUser(updatedUser);

          emit(UserLoaded(updatedUser));
        } catch (e) {
          print(e);
        }
      }
    });

    on<Purchase>((event, emit) async {
      if (state is UserLoaded) {
        try {
          UserModel updatedUser = (state as UserLoaded).user.copyWith(
              balance: (state as UserLoaded).user.balance - event.amount);

          await UserServices.updateUser(updatedUser);

          emit(UserLoaded(updatedUser));
        } catch (e) {
          print(e);
        }
      }
    });
  }

  // @override
  // Stream<UserState> mapEventToState(
  //   UserEvent event,
  // ) async* {
  //   if (event is LoadUser) {
  //     UserModel user = await UserServices.getUser(event.id);

  //     yield UserLoaded(user);
  //   } else if (event is SignOut) {
  //     yield UserInitial();
  //   } else if (event is UpdateData) {
  //     UserModel updatedUser = (state as UserLoaded)
  //         .user
  //         .copyWith(name: event.name, profilePicture: event.profileImage);

  //     await UserServices.updateUser(updatedUser);

  //     yield UserLoaded(updatedUser);
  //   } else if (event is TopUp) {
  //     if (state is UserLoaded) {
  //       try {
  //         UserModel updatedUser = (state as UserLoaded).user.copyWith(
  //             balance: (state as UserLoaded).user.balance + event.amount);

  //         await UserServices.updateUser(updatedUser);

  //         yield UserLoaded(updatedUser);
  //       } catch (e) {
  //         print(e);
  //       }
  //     }
  //   } else if (event is Purchase) {
  //     if (state is UserLoaded) {
  //       try {
  //         UserModel updatedUser = (state as UserLoaded).user.copyWith(
  //             balance: (state as UserLoaded).user.balance - event.amount);

  //         await UserServices.updateUser(updatedUser);

  //         yield UserLoaded(updatedUser);
  //       } catch (e) {
  //         print(e);
  //       }
  //     }
  //   }
  // }
}
