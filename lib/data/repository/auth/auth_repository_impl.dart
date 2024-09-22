import 'package:dartz/dartz.dart';
import 'package:spotify_application_clone/data/models/auth/create_user_req.dart';
import 'package:spotify_application_clone/data/models/auth/signin_user_req.dart';
import 'package:spotify_application_clone/data/source/auth/auth_firebase_service.dart';
import 'package:spotify_application_clone/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class AuthRepositoryImpl extends AuthRepository{


  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
   return await s1<AuthFirebaseService>().signup(createUserReq);
   
  }

  @override
  Future<Either> signin(SigninUserReq signinUserReq) async{
   return await s1<AuthFirebaseService>().signin(signinUserReq);
   
  }

}