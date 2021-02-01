import 'package:LIVE365/models/DataModel.dart';

class FakeRepository {
  static List<DataModel> data = [
    DataModel(
        name: "@BenhanLie",
        description:
            "I know what you're thinking!! wait for it there is something",
        forwardCount: "13.12k",
        likesCount: "24.4k",
        messagesCount: "110.3k",
        musicName: "Music name is here",
        tags: "#mindreader, #magician #magictrick",
        profileUrl: "assets/profile1.jpg"),
    DataModel(
      name: "@Nayan_551",
      description:
          "I know what you're thinking!! wait for it there is something",
      forwardCount: "3.12k",
      likesCount: "44.4k",
      messagesCount: "10.3k",
      musicName: "Flutter fun - original sounds - ",
      tags: "#fun #flutter #ui #openSource,",
      profileUrl: "assets/profile2.jpeg",
    ),
    DataModel(
        name: "@BenhanLie",
        description:
            "I know what you're thinking!! wait for it there is something",
        forwardCount: "13.12k",
        likesCount: "24.4k",
        messagesCount: "110.3k",
        musicName: "Music name is here riyaz-xyz music name",
        tags: "#greenscreen, #magician #magictrick",
        profileUrl: "assets/profile3.jpeg"),
  ];
  static List<String> dataList = ["60s", "15s"];
  static List<String> imageData = [
    "https://static.vecteezy.com/system/resources/previews/000/523/046/non_2x/vector-mobile-app-development-concept.jpg",
    "https://www.yourteaminindia.com/blog/wp-content/uploads/2020/06/Online-Exclusive-3.jpg",
  ];
  static List<String> assetData = [
    "assets/images/image.jpg",
    "assets/images/image.jpg",
    "assets/images/image.jpg",
    "assets/images/image.jpg",
    "assets/images/image.jpg",
    "assets/images/image.jpg",
  ];
  static List<String> imageData2 = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  static List videoList = [
    {
      "videos": {
        "video0": {
          "comments": "21",
          "likes": "3.2k",
          "song_name": "Song Title 1 - Artist 1",
          "url":
              "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/4.mp4?alt=media&token=517ad60c-ca28-400e-ab46-49fb8c122d75",
          "user": "user0",
          "user_pic":
              "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile1.jpg?alt=media&token=567ea332-04e8-4c64-afb0-8152c6f12fec",
          "video_title": "Video 1"
        },
        "video1": {
          "comments": "21",
          "likes": "3.2k",
          "song_name": "Song Title 1 - Artist 1",
          "url":
              "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/4.mp4?alt=media&token=517ad60c-ca28-400e-ab46-49fb8c122d75",
          "user": "user1",
          "user_pic":
              "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile1.jpg?alt=media&token=567ea332-04e8-4c64-afb0-8152c6f12fec",
          "video_title": "Video 1"
        },
        "video2": {
          "comments": "11",
          "likes": "35k",
          "song_name": "Song Title 2 - Artist 2",
          "url":
              "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/1.mp4?alt=media&token=36032747-7815-473d-beef-061098f08c18",
          "user": "user2",
          "user_pic":
              "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile2.jpeg?alt=media&token=b1fdd00d-5d6e-4705-980d-4ef3e70ff6c5",
          "video_title": "Video 2"
        },
        "video3": {
          "comments": "434",
          "likes": "21.4k",
          "song_name": "Song Title 3 - Artist 3",
          "url":
              "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/3.mp4?alt=media&token=a7ccda22-7264-4c64-9328-86a4c2ec31cd",
          "user": "user3",
          "user_pic":
              "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile3.jpg?alt=media&token=d65b2ed7-4164-4149-a5c7-8620201e8411",
          "video_title": "Video 3"
        },
        "video4": {
          "comments": "66",
          "likes": "3m",
          "song_name": "Song Title 4 - Artist 4",
          "url":
              "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/2.mp4?alt=media&token=b6218221-6699-402b-8b89-7e3354ac32dc",
          "user": "user4",
          "user_pic":
              "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile4.jpg?alt=media&token=399ca1f4-2017-4f48-af21-0aa6a7b17550",
          "video_title": "Video 4"
        },
        "video5": {
          "comments": "54",
          "likes": "1.1k",
          "song_name": "Song Title 6 - Artist 6",
          "url":
              "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/5.mp4?alt=media&token=965a0494-7aaf-4248-85c5-fefac581ee7f",
          "user": "user5",
          "user_pic":
              "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile5.jpeg?alt=media&token=7fbe5118-c2e9-4550-a468-3eb8a4d34d6a",
          "video_title": "Video 5"
        },
        "video6": {
          "comments": "43",
          "likes": "5.2k",
          "song_name": "Song Title 6 - Artist 6",
          "url":
              "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/7.mp4?alt=media&token=2f6a3c9b-bfc4-483e-ad5b-bb7d539ee765",
          "user": "user6",
          "user_pic":
              "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile6.jpeg?alt=media&token=e747af9e-4775-484e-9a27-94b2426f319c",
          "video_title": "Video 6"
        },
        "video7": {
          "comments": "43",
          "likes": "5.2k",
          "song_name": "Song Title 6 - Artist 6",
          "url":
              "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/8.mp4?alt=media&token=87e20ffd-2b5c-422a-ad85-33b90b4e2169",
          "user": "user6",
          "user_pic":
              "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile6.jpeg?alt=media&token=e747af9e-4775-484e-9a27-94b2426f319c",
          "video_title": "Video 7"
        },
        "video8": {
          "comments": "43",
          "likes": "5.2k",
          "song_name": "Song Title 6 - Artist 6",
          "url":
              "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/9.mp4?alt=media&token=83911bd2-6083-43d1-824e-2049f1fb11e7",
          "user": "user6",
          "user_pic":
              "https://firebasestorage.googleapis.com/v0/b/testvideo-91d3a.appspot.com/o/profile_pics%2Fprofile6.jpeg?alt=media&token=e747af9e-4775-484e-9a27-94b2426f319c",
          "video_title": "Video 8"
        }
      }
    },
  ];
}