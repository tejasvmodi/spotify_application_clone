import 'package:dartz/dartz.dart';
import 'package:spotify_application_clone/data/models/auth/create_user_req.dart';
import 'package:spotify_application_clone/data/models/auth/signin_user_req.dart';

abstract class AuthRepository{

  Future<Either> signUp(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserReq signinUserReq);
}