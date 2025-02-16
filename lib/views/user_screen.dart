import 'package:automatedcountingapp/api/river_pod/user_river_pod.dart';
import 'package:automatedcountingapp/common/app_style.dart';
import 'package:automatedcountingapp/common/reuseable_text.dart';
import 'package:automatedcountingapp/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({super.key});

  @override
  ConsumerState<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
  String searchQuery = "";
  List<String> images = [
    "https://res.cloudinary.com/ddxaoh6po/image/upload/v1694131234/samples/woman-on-a-football-field.jpg",
    "https://res.cloudinary.com/ddxaoh6po/image/upload/v1694131233/samples/man-portrait.jpg",
    "https://res.cloudinary.com/ddxaoh6po/image/upload/v1694131232/samples/man-on-a-street.jpg",
    "https://res.cloudinary.com/ddxaoh6po/image/upload/v1694131207/samples/landscapes/girl-urban-view.jpg",
    "https://res.cloudinary.com/ddxaoh6po/image/upload/v1694131231/samples/outdoor-woman.jpg",
    "https://res.cloudinary.com/ddxaoh6po/image/upload/v1694131230/samples/look-up.jpg",
    "https://res.cloudinary.com/ddxaoh6po/image/upload/v1694131229/samples/smile.jpg",
    "https://res.cloudinary.com/ddxaoh6po/image/upload/v1694131228/samples/two-ladies.jpg",
    "https://res.cloudinary.com/ddxaoh6po/image/upload/v1694131209/samples/bike.jpg",
    "https://res.cloudinary.com/ddxaoh6po/image/upload/v1694131230/samples/breakfast.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final usersState = ref.watch(getUsersProvider);
    return Scaffold(
      backgroundColor: offWhite,
      body: RefreshIndicator(
        onRefresh: () async => ref.refresh(getUsersProvider),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              right: 15.w,
              bottom: 10.h,
              top: 10.h,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Search Users",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (query) {
                      setState(() => searchQuery = query.toLowerCase());
                    },
                  ),
                ),
                usersState.when(
                    // skipLoadingOnReload: true,
                    // skipLoadingOnRefresh: false,
                    loading: () => Expanded(
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                baseColor: appBlue,
                                highlightColor: offWhite,
                                child: ListTile(
                                  leading: Container(
                                    height: 40.h,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                      color: appBlack.withOpacity(.7),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Center(
                                      child: ReuseableText(
                                        text: "${index + 1}",
                                        style: appStyle(
                                            15, white, FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  title: const Text('....'),
                                  subtitle: const Text("......"),
                                ),
                              );
                            },
                          ),
                        ),
                    error: (error, stack) => Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.error, color: appRed, size: 20.sp),
                              SizedBox(height: 10.h),
                              Text(
                                error.toString(),
                                textAlign: TextAlign.center,
                                style: appStyle(16, appRed, FontWeight.w500),
                              ),
                              SizedBox(height: 10.h),
                              ElevatedButton(
                                onPressed: () => ref.refresh(getUsersProvider),
                                child: ReuseableText(
                                  text: 'Retry',
                                  style:
                                      appStyle(16, appBlack, FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                    data: (users) {
                      if (users == null || users.isEmpty) {
                        return Center(
                          child: ReuseableText(
                            text: 'No users found',
                            style: appStyle(16, appBlack, FontWeight.w500),
                          ),
                        );
                      }
                      final filteredUsers = users
                          .where((user) =>
                              user.name.toLowerCase().contains(searchQuery))
                          .toList();
                      return Expanded(
                        child: ListView.builder(
                          itemCount: filteredUsers.length,
                          itemBuilder: (context, index) {
                            final user = filteredUsers[index];

                            return ListTile(
                              leading: CircleAvatar(
                                radius: 23.r,
                                backgroundImage: NetworkImage(
                                  images[index % images.length],
                                ),
                              ),
                              title: ReuseableText(
                                text: user.name,
                                style: appStyle(15, appBlack, FontWeight.w500),
                              ),
                              subtitle: ReuseableText(
                                text: user.email,
                                style: appStyle(12, appBlack, FontWeight.w300),
                              ),
                            );
                          },
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
