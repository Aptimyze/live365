import 'package:LIVE365/models/User.dart';
import 'package:LIVE365/models/post.dart';
import 'package:LIVE365/utils/firebase.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'indicators.dart';

class ViewImage extends StatefulWidget {
  final PostModel post;

  ViewImage({this.post});

  @override
  _ViewImageState createState() => _ViewImageState();
}

final DateTime timestamp = DateTime.now();

currentUserId() {
  return firebaseAuth.currentUser.uid;
}

UserModel user;

class _ViewImageState extends State<ViewImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildImage(context),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: Colors.transparent,
        child: ListTile(
          title: Text(
            widget.post.username,
            style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
          ),
          subtitle: Row(
            children: [
              Icon(Feather.clock, color: Colors.white, size: 13.0),
              SizedBox(width: 3.0),
              Text(timeago.format(widget.post.timestamp.toDate()),
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.white)),
            ],
          ),
          trailing: buildLikeButton(),
        ),
      ),
    );
  }

  buildImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: CachedNetworkImage(
          imageUrl: widget.post.mediaUrl,
          placeholder: (context, url) {
            return circularProgress(context);
          },
          errorWidget: (context, url, error) {
            return Icon(Icons.error, color: Colors.white);
          },
          height: 400.0,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }

  addLikesToNotification() async {
    bool isNotMe = currentUserId() != widget.post.ownerId;

    if (isNotMe) {
      DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
      user = UserModel.fromJson(doc.data());
      notificationRef
          .doc(widget.post.ownerId)
          .collection('notifications')
          .doc(widget.post.postId)
          .set({
        "type": "like",
        "username": user.username,
        "userId": currentUserId(),
        "userDp": user.photoUrl,
        "postId": widget.post.postId,
        "mediaUrl": widget.post.mediaUrl,
        "timestamp": timestamp,
      });
    }
  }

  removeLikeFromNotification() async {
    bool isNotMe = currentUserId() != widget.post.ownerId;

    if (isNotMe) {
      DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
      user = UserModel.fromJson(doc.data());
      notificationRef
          .doc(widget.post.ownerId)
          .collection('notifications')
          .doc(widget.post.postId)
          .get()
          .then((doc) => {
                if (doc.exists) {doc.reference.delete()}
              });
    }
  }

  buildLikeButton() {
    return StreamBuilder(
      stream: likesRef
          .where('postId', isEqualTo: widget.post.postId)
          .where('userId', isEqualTo: currentUserId())
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          List<QueryDocumentSnapshot> docs = snapshot?.data?.docs ?? [];
          return IconButton(
            onPressed: () {
              if (docs.isEmpty) {
                likesRef.add({
                  'userId': currentUserId(),
                  'postId': widget.post.postId,
                  'dateCreated': Timestamp.now(),
                });
                addLikesToNotification();
              } else {
                likesRef.doc(docs[0].id).delete();
                removeLikeFromNotification();
              }
            },
            icon: docs.isEmpty
                ? Icon(CupertinoIcons.heart, color: Colors.white)
                : Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.red,
                  ),
          );
        }
        return Container();
      },
    );
  }
}
