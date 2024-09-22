import 'package:dartz/dartz.dart';
import 'package:spotify_application_clone/core/usecase/usecase.dart';
import 'package:spotify_application_clone/data/models/auth/signin_user_req.dart';
import 'package:spotify_application_clone/domain/repository/auth/auth.dart';
import 'package:spotify_application_clone/service_locator.dart';

class  SigninUsecaase implements UseCase<Either,SigninUserReq>{
  
  @override
  Future<Either> call({SigninUserReq ? parmas}) async {
    
    return s1<AuthRepository>().signin(parmas!);
      }
   
}