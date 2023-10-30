import {onRequest} from "firebase-functions/v2/https";
import * as logger from "firebase-functions/logger";

import {initializeApp} from "firebase-admin/app";
import {getFirestore} from "firebase-admin/firestore";
import {getMessaging} from "firebase-admin/messaging";

import {setGlobalOptions} from "firebase-functions/v2";

// Set the maximum instances to 10 for all functions
setGlobalOptions({maxInstances: 10});


initializeApp();

exports.sendNotification = onRequest(async (request, response) => {
  const body = request.body;
  const webhookId = body.webhook_id;

  const from = body.data._from;
  const to = body.data._to;

  const shortString = (str: string): string => {
    return str.slice(0, 6) + "..." + str.slice(-4);
  };

  const users = await getFirestore().collection("Users");
  const user = users.where("webhooks.webHookId", "==", webhookId);
  const usr = await user.get();

  if (usr.empty) {
    logger.info("no user found", {structuredData: true});
    response.status(404).json({data: "No User Found"});
  }

  const userDoc = usr.docs[0];
  logger.info("userId: ", userDoc, {structuredData: true});
  try {
    const fcmTokens = userDoc.ref.collection("fcm_tokens");
    const fcmToken = fcmTokens.limit(1);
    const fcmTok = await fcmToken.get();

    if (fcmTok.empty) {
      response.status(404).json({data: "No FCM token found for the user."});
    }

    const fcm = fcmTok.docs[0].data().fcm_token;
    logger.info("fcmToken: ", fcm, {structuredData: true});

    const message = {
      notification: {
        title: "A transaction has been made!",
        body: "From: " + shortString(from) + "To: " + shortString(to),
      },
      android: {
        notification: {
          imageUrl:
            "https://ik.imagekit.io/p3buruum5/readme/pxlogo.png?updatedAt=1698682369221",
        },
      },
      token: "fcm",
    };

    const messaging = getMessaging();

    const res = await messaging.send(message);
    logger.info("Successfully sent message:", res, {structuredData: true});
    response.send("Notification Sent!");
  } catch (error) {
    logger.error("Error sending message:", error, {structuredData: true});
  }
});
