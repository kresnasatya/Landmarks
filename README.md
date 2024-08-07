#  Landmarks

Landmarks App with SwiftUI (follow the SwiftUI Tutorials)

## Notes

> I cannot believe that I can develop iOS, watchOS, and macOS in one project with Swift and SwiftUI. I can't believe even more that I'm using Xcode in MacBook Air M1 256GB 8GB! 🤯

Make sure when you create a project don't **Include Tests** (as a beginner) because:

- You will get error message related with Preflight,
- then you try many things like clean build and rebuild, close the Xcode but doesn't work,
- in the end will lead you to lost track in section **Updating the row view, Creating a macOS app**.

**Creating a watchOS App issues - Create a custom notification**

I was in section Create a custom notification. In step 10, I create a PushNotificationPayload.apns file with the
configuration below.

```json
{
    "aps": {
        "alert": {
            "title": "Silver Salmon Creek",
            "body": "You are within 5 miles of Silver Salmon Creek."
        },
        "category": "LandmarkNear",
        "thread-id": "5280",
        "sound": "default"
    },


    "landmarkIndex": 1,


    "Simulator Target Bundle": "me.kresna.Landmarks.watchkitapp"
}
```

Next, I build and run WatchLandmarks Watch App scheme on a Simulator. The first time you run the app, the system asks for
permission to send notifications. Select Allow.

> If you accidentally press “Dont’ Allow”, uninstall the app from Simulator and repeat again.

After grant permission, I use Xcode to stop the app then drag the `PushNotificationPayload` file to watchOS simulator.
Does it work? No, it doesn’t! 😅

I have been confuse couple days without Google search and ask the AI. Today, I found the problem. The problem is on
`Simuator Target Bundle`. I set it to `me.kresna.Landmarks.watchkitapp`. But, if I check the **Bundle Identifier** on
Identity section in Targets, the value of **Bundle Identifier** is `.watchkitapp` not `me.kresna.Landmarks.watchkitapp`.

![Bundle identifer setting for watchOS](/bundle-identifier-watchos.png)

Solutions:

There are two solutions: 

1. I change the value of `Simulator Target Bundle` from `me.kresna.Landmarks.watchkitapp` to `.watchkitapp` in `PushNotificationPayload.apns` file then drag the `PushNotificationPayload` file to watchOS simulator and It works!
2. I change the value of Bundle Identifier `.watchkitapp` to `me.kresna.Landmarks.watchkitapp`. 
    1. Next, uninstall the app from the watchOS simulator.
    2. Run and build again, accept the notification
    3. Stop the app via Xcode then drag the `PushNotificationPayload.apns` file to watchOS simulator.

> Bonus

You can use command line to send push notification to watchOS simulator. Here are the commands.


```bash
# Get active device (Booted)
# In this case is device for watchOS
xcrun simctl list devices | grep "Watch" | grep "Booted"

# The output message after run the above command.
# Apple Watch Series 9 (41mm) (15D90DDB-9B25-49B3-87DE-21DAF599A998) (Booted)
# The 15D90DDB-9B25-49B3-87DE-21DAF599A998 is a device-id. It will be used in the next command

# Go to your watchOS project app
cd Xcode\ Project/Landmarks/WatchLandmarks\ Watch\ App/

# Run xcrun simctl push <device-id> <bundle-identifier> <json-file>
xcrun simctl push 15D90DDB-9B25-49B3-87DE-21DAF599A998 .watchkitapp PushNotificationPayload.apns
# OR
xcrun simctl push 15D90DDB-9B25-49B3-87DE-21DAF599A998 me.kresna.Landmarks.watchkitapp PushNotificationPayload.apns
```

