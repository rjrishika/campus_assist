import 'package:untitled1/reusable_widget/club_model.dart';
abstract class BaseDatabaseRepository{
 Stream<Club> getClub();
 Future<void> updateUserPictures(String imageName);
}