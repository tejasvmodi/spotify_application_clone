import 'package:dartz/dartz.dart';
import 'package:spotify_application_clone/core/usecase/usecase.dart';
import 'package:spotify_application_clone/data/models/auth/create_user_req.dart';
import 'package:spotify_application_clone/domain/repository/auth/auth.dart';
import 'package:spotify_application_clone/service_locator.dart';

class  SignUpUsecaase implements UseCase<Either,CreateUserReq>{

  @override
  Future<Either> call({CreateUserReq ? parmas}) async {
    
    return s1<AuthRepository>().signUp(parmas!);
      }
   
}