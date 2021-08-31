class StoryData {
  int id;
  String userName;
  String avatarUrl;
  String storyUrl;

  StoryData(this.id, this.userName, this.avatarUrl, this.storyUrl);
}

List<StoryData> stories = [
  StoryData(0, "Jones", "https://randomuser.me/api/portraits/med/men/75.jpg",
      "https://images.unsplash.com/photo-1626549879159-280fff8c5cd6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=934&q=80"),
  StoryData(1, "Sunil", "https://wallpapercave.com/wp/AYWg3iu.jpg",
      "https://images.unsplash.com/photo-1626549879159-280fff8c5cd6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=934&q=80"),
  StoryData(2, "Jones", "https://randomuser.me/api/portraits/med/men/75.jpg",
      "https://images.unsplash.com/photo-1626549879159-280fff8c5cd6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=934&q=80"),
  StoryData(3, "Sunil", "https://randomuser.me/api/portraits/med/men/75.jpg",
      "https://images.unsplash.com/photo-1626549879159-280fff8c5cd6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=934&q=80"),
];

enum MediaType {
  image,
}

class Story {
  final String url;
  final MediaType media;
  final Duration duration;
  final User user;

  const Story({
    required this.url,
    required this.media,
    required this.duration,
    required this.user,
  });
}

class User {
  final String name;
  final String profileImageUrl;

  const User({
    required this.name,
    required this.profileImageUrl,
  });
}

final User user = User(
  name: 'John Doe',
  profileImageUrl: 'https://wallpapercave.com/wp/AYWg3iu.jpg',
);
final List<Story> stories1 = [
  Story(
    url:
        'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    media: MediaType.image,
    duration: const Duration(seconds: 10),
    user: user,
  ),
  Story(
    url: 'https://media.giphy.com/media/moyzrwjUIkdNe/giphy.gif',
    media: MediaType.image,
    user: User(
      name: 'John Doe',
      profileImageUrl: 'https://wallpapercave.com/wp/AYWg3iu.jpg',
    ),
    duration: const Duration(seconds: 7),
  ),
  Story(
    url:
        'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
    media: MediaType.image,
    duration: const Duration(seconds: 5),
    user: user,
  ),
  Story(
    url: 'https://media2.giphy.com/media/M8PxVICV5KlezP1pGE/giphy.gif',
    media: MediaType.image,
    duration: const Duration(seconds: 8),
    user: user,
  ),
];
