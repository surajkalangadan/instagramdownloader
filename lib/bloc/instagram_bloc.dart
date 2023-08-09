
import 'package:bloc/bloc.dart';
import 'package:instagram/repositry/modelclass/Instagrammodel.dart';
import 'package:meta/meta.dart';

import '../repositry/api/Instagram_api.dart';

part 'instagram_event.dart';
part 'instagram_state.dart';

class InstagramBloc extends Bloc<InstagramEvent, InstagramState> {
  late Instagrammodel instagrammodel;
  Instaapi instaapi=Instaapi();
  InstagramBloc() : super(InstagramInitial()) {

    on<Fetchinsta>((event, emit)async {
      emit(InstagramLoading());
      try{

        instagrammodel = await instaapi.getinstagrammodel(event.message);
        emit(InstagramLoaded());
      } catch(e){
        print(e);
        emit(InstagramError());}
    });

  }
}
