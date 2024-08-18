import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/data/models/base_model.dart';
import 'package:doctor_app/core/data/models/patient_model.dart';
import 'package:doctor_app/core/domain/error_handler/network_exceptions.dart';
import '../../domain/PatientsRepo.dart';
import '../remote/remote_patients.dart';


class PatientsRepoImpl extends PatientsRepo{

  remotePatients remoteService;

  PatientsRepoImpl(this.remoteService);

  @override
  Future<Either<NetworkExceptions, List<PatientModel>>> getMyPatient()async {
    List<PatientModel>list=[];
   try{
     BaseModel baseModel= await remoteService.getMyPatient();
    
     
     for(int i=0;i<baseModel.data.length;i++){
       list.add(PatientModel.fromJson(baseModel.data[i]));
     }
  
     return right(list);
   }
       catch(error){
         return left(NetworkExceptions.getException(error));
       }
  }


}