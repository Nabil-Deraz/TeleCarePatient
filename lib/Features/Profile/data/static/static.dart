import 'package:tecpatient/Features/Profile/data/models/data_models.dart';
import 'package:tecpatient/core/utils/app_router.dart';
import 'package:tecpatient/core/utils/assets.dart';

List<ProfileDataModel> columnList = [
  ProfileDataModel(
      title: 'Profile info',
      description: 'Edit account info',
      imageUrl: AssetsData.profileInfo,
      route: AppRouter.kProfileInfoView),
  ProfileDataModel(
    title: 'Privacy',
    description: 'Disappearing messages, password managment',
    imageUrl: AssetsData.privacy,
  ),
  ProfileDataModel(
    title: 'Notifications',
    description: 'Messages, push notifications ',
    imageUrl: AssetsData.notifications,
  ),
  ProfileDataModel(
    title: 'Storage and data',
    description: 'Network usage, auto-download',
    imageUrl: AssetsData.storage,
  ),
  ProfileDataModel(
    title: 'App language',
    description: 'English (device\'s language)',
    imageUrl: AssetsData.language,
  ),
  ProfileDataModel(
    title: 'Help',
    description: 'Help center, contact us, privacy policy',
    imageUrl: AssetsData.help,
  ),
];
