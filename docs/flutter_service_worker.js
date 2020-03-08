'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/index.html": "79c5fbff790e5896a8b2195b8be32d75",
"/main.dart.js": "1b6c82fdfe1fa792398cf251c43b2e85",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/manifest.json": "118fc749ca5a8c2daa2127ae13d5bb80",
"/assets/LICENSE": "33f6575422d4bc6b69495a612f1a9aa1",
"/assets/AssetManifest.json": "1f2ec0a7064aa78434fada6d1f6d1ff3",
"/assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/assets/bug_meme.jpeg": "2868db0b3415d53668b2dc1d3d46578e",
"/assets/assets/jerry_and_bird.gif": "190fcf4bcc8849a3e2c0437f71041ee5",
"/assets/assets/ic_github.png": "ef7a02b69836dc8b6a732a54c4200dcb"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request, {
          credentials: 'include'
        });
      })
  );
});
