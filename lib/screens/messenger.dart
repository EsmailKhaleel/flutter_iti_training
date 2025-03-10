import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  final List<Map<String, dynamic>> stories = [
    {
      "name": "Dwayne Johnson",
      "image":
          "https://hips.hearstapps.com/hmg-prod/images/dwayne-the-rock-johnson-gettyimages-1061959920.jpg?crop=0.5625xw:1xh;center,top&resize=1200:*",
      "online": true
    },
    {
      "name": "Emma Watson",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXhr4_waRLP7JXyDaknRotH_LIH9nBpIZ-HA&s",
      "online": false
    },
    {
      "name": "John Wick",
      "image":
          "https://bsmedia.business-standard.com/_media/bs/img/article/2024-10/23/full/1729665406-8064.jpg?im=FitAndFill=(826,465)",
      "online": true
    },
    {
      "name": "Esmail Khaleel",
      "image":
          "https://lh3.googleusercontent.com/a/ACg8ocKU-0WXQMyGuthzZjujyZK_W7341PUcCPin7uOtHRx72YBTWA-8=s360-c-no",
      "online": true
    },
    {
      "name": "Marilyn Monroe",
      "image":
          "https://assets.vogue.com/photos/6165bbf5816ea2de6ec8597c/16:9/w_1280,c_limit/GettyImages-607396320.jpg",
      "online": false
    },
  ];

  final List<Map<String, dynamic>> chats = [
    {
      "name": "Dwayne Johnson",
      "image":
          "https://hips.hearstapps.com/hmg-prod/images/dwayne-the-rock-johnson-gettyimages-1061959920.jpg?crop=0.5625xw:1xh;center,top&resize=1200:*",
      "message": "Hey, how are you?",
      "time": "10:30 am",
      "unread": 2
    },
    {
      "name": "Emma Watson",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXhr4_waRLP7JXyDaknRotH_LIH9nBpIZ-HA&s",
      "message": "Let's catch up later!",
      "time": "9:15 am",
      "unread": 0
    },
    {
      "name": "John Wick",
      "image":
          "https://bsmedia.business-standard.com/_media/bs/img/article/2024-10/23/full/1729665406-8064.jpg?im=FitAndFill=(826,465)",
      "message": "Meeting at 3 pm",
      "time": "Yesterday",
      "unread": 1
    },
    {
      "name": "Esmail Khaleel",
      "image":
          "https://lh3.googleusercontent.com/a/ACg8ocKU-0WXQMyGuthzZjujyZK_W7341PUcCPin7uOtHRx72YBTWA-8=s360-c-no",
      "message": "Sent a photo",
      "time": "Yesterday",
      "unread": 4
    },
    {
      "name": "Marilyn Monroe",
      "image":
          "https://assets.vogue.com/photos/6165bbf5816ea2de6ec8597c/16:9/w_1280,c_limit/GettyImages-607396320.jpg",
      "message": "See you soon!",
      "time": "2 days ago",
      "unread": 0
    },
    {
      "name": "Dwayne Johnson",
      "image":
          "https://hips.hearstapps.com/hmg-prod/images/dwayne-the-rock-johnson-gettyimages-1061959920.jpg?crop=0.5625xw:1xh;center,top&resize=1200:*",
      "message": "Hey, how are you?",
      "time": "10:30 am",
      "unread": 2
    },
    {
      "name": "Emma Watson",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXhr4_waRLP7JXyDaknRotH_LIH9nBpIZ-HA&s",
      "message": "Let's catch up later!",
      "time": "9:15 am",
      "unread": 0
    },
    {
      "name": "John Wick",
      "image":
          "https://bsmedia.business-standard.com/_media/bs/img/article/2024-10/23/full/1729665406-8064.jpg?im=FitAndFill=(826,465)",
      "message": "Meeting at 3 PM",
      "time": "Yesterday",
      "unread": 1
    },
    {
      "name": "Esmail Khaleel",
      "image":
          "https://lh3.googleusercontent.com/a/ACg8ocKU-0WXQMyGuthzZjujyZK_W7341PUcCPin7uOtHRx72YBTWA-8=s360-c-no",
      "message": "Sent a photo",
      "time": "Yesterday",
      "unread": 4
    },
    {
      "name": "Marilyn Monroe",
      "image":
          "https://assets.vogue.com/photos/6165bbf5816ea2de6ec8597c/16:9/w_1280,c_limit/GettyImages-607396320.jpg",
      "message": "See you soon!",
      "time": "2 days ago",
      "unread": 0
    },
  ];

  MessengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("messenger",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 1, 71, 192))),
        actions: [
          IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
          IconButton(icon: const Icon(Icons.facebook), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 20),
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20)),
                child: const Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(Icons.search),
                    SizedBox(width: 10),
                    Text(
                      "Ask Meta AI or Search",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: SizedBox(
                      width: 70,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    NetworkImage(stories[index]["image"]),
                              ),
                              if (stories[index]["online"])
                                Positioned(
                                  right: 2,
                                  bottom: 2,
                                  child: Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 2),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            stories[index]["name"],
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(chats[index]["image"]),
                      ),
                      if (chats[index]["unread"] > 0)
                        Positioned(
                          right: 2,
                          top: 2,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              chats[index]["unread"].toString(),
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                    ],
                  ),
                  title: Text(chats[index]["name"],
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Row(
                    children: [
                      Text(
                        chats[index]["message"],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: chats[index]["unread"] > 0
                                ? Colors.black
                                : Colors.grey.shade700,
                            fontWeight: chats[index]["unread"] > 0
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                      const SizedBox(width: 6.0),
                      Text(".${chats[index]["time"]}")
                    ],
                  ),
                  trailing: Text(chats[index]["time"]),
                  onTap: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
