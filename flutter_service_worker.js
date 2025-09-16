'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"main.dart.js": "d9a37198ec4dea59ac4b689a844d68c7",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"assets/assets/nandanamiss.PNG": "4a0ff940acb12414ddb37e4e5c2d8f56",
"assets/assets/manojsir.JPG": "26c1539be80b738926b54d8782596a47",
"assets/assets/vision.jpg": "3149c64380a1e43972c1bb236eaccae2",
"assets/assets/anupa.jpg": "908aca6b77af032612db625107af8afd",
"assets/assets/Aby.jpg": "53ac651472d93a316078bb6eb731d3c8",
"assets/assets/Advaith.JPG": "2c59c12001bc26a905d601214bd88f90",
"assets/assets/sruthy.JPG": "05abd129666fd19104fc4f53f857af5b",
"assets/assets/eventposters/WhatsApp%2520Image%25202025-09-12%2520at%25209.25.53%2520PM%2520(1).jpeg": "6661b1a0f4ece775dc406669416843fe",
"assets/assets/eventposters/WhatsApp%2520Image%25202025-09-12%2520at%25209.25.52%2520PM.jpeg": "d5230adde231cb6b300f3c9f6373da2d",
"assets/assets/eventposters/WhatsApp%2520Image%25202025-09-12%2520at%25209.25.53%2520PM%2520(2).jpeg": "4e624869bc99d177a72f054775af1595",
"assets/assets/eventposters/EKAH_2025poster.png": "1009054e13d1a3861e6f44c03fc6a5cd",
"assets/assets/eventposters/WhatsApp%2520Image%25202025-09-12%2520at%25209.25.53%2520PM.jpeg": "b2a33ae4feef8fc66c8627c4b09f8a1a",
"assets/assets/sooraj.JPG": "e9c98d0e1c14b2c126af0497aa068238",
"assets/assets/Vaishnavi.JPG": "3036e924cbdee64375bf7e083934f9c1",
"assets/assets/IMG_8412.jpg": "63624b3f9dda827cb8e74dd24aab40be",
"assets/assets/sitharamiss.JPG": "b606c59e664c8964e80261217c3d8eaa",
"assets/assets/princymiss.PNG": "7e0c295d08fea4121390785ddaae7c8c",
"assets/assets/Anna.JPG": "9977bfb3c6dbac6bd0787b6e2315c44d",
"assets/assets/IEDC%2520%2520LOGO.png": "1e4487f89363fdec30e9f513e9db4d98",
"assets/assets/anakhamiss.JPG": "4784e40a89de267b2d12c1dfe1c109c5",
"assets/assets/videos/IMG_8262.MP4": "1aa1d6527f6d203baf71cba74a97b2fa",
"assets/assets/videos/collaboration_bg.mp4": "a4a036f1801308c2a6bc1543c49c01c1",
"assets/assets/videos/IMG_8344%2520(1).mp4": "799a7e56f4ef9db619366325841fa33a",
"assets/assets/videos/IMG_8271%2520(1).mp4": "b6c34d48d188ca6c219f69b201d356af",
"assets/assets/videos/herobw.mp4": "b4d039e68bde946c4015e2f85656aa59",
"assets/assets/Akhin.JPG": "dd1ec7176cf1df69fc29b75426e2283e",
"assets/assets/amal.JPG": "d6f00a694f8cc28be32a3950c04b9eb2",
"assets/assets/sreekumarsir.PNG": "106cf5771d875ef1c97560b330f6f097",
"assets/assets/Jiorijin.JPG": "5861b9a22f432d5e3ba8d854346de1ae",
"assets/assets/Bibitha.JPG": "81814206c9ece8679955a902004889fa",
"assets/assets/joshua.JPG": "817180e4f88bc03b35d6affc238eb8b5",
"assets/assets/iv.jpg": "18c7a9e52ec21e3a16d02fdc0def9f2a",
"assets/assets/Meenakshi.JPG": "46d90237e8e57f8365891d41114aa488",
"assets/assets/ivin.png": "a0f42bafbc50cdc8f57af76069cb47cb",
"assets/assets/Niranjana.JPG": "3262ccb25bf0cc0dd602bfa25ea7c061",
"assets/assets/rakhimiss.JPG": "3fe385eadb29a70fec471cc7efeed949",
"assets/assets/fonts/FugazOne-Regular.ttf": "85d7f13eca6e725d74f84ef0ce5f5789",
"assets/assets/fonts/CaveatBrush-Regular.ttf": "91a4b7550bea09847dec3314935df7fa",
"assets/assets/fonts/ShadowsIntoLight-Regular.ttf": "e8f47a72dddf523096a21b4a93f56f89",
"assets/assets/fonts/RobotoCondensed-Italic-VariableFont_wght.ttf": "e48df2bca2ee4b632ce92bbdfcdca4da",
"assets/assets/fonts/Anton-Regular.ttf": "4cab96279ec05c67f65c13f193650412",
"assets/assets/fonts/LeagueSpartan-VariableFont_wght.ttf": "45dad59cf4298d2ab6984c5261c67d62",
"assets/assets/fonts/RobotoCondensed-VariableFont_wght.ttf": "53ef0e497dfefba8543ad65120e1bbb9",
"assets/assets/jeswin.png": "a82c36758c81147fa1503a16721f33d0",
"assets/assets/alfiyamiss.JPG": "b20967d9cd8fef77fdf6e5d66b1f53d9",
"assets/assets/nijin.JPG": "33eb1018e98f64274e1210270a79c724",
"assets/assets/Gouri.JPG": "bf7a432926e55bab058577e5fd5a244d",
"assets/assets/shymamiss.PNG": "4b5ed31624f89c12fdc84856ebfd1612",
"assets/assets/IEDC%2520COVER.jpg": "974396f264bf8e2d40e891c9b3d8f95b",
"assets/assets/Aaron.JPG": "1d968e2b2810fb8635f499f00933285f",
"assets/assets/abiel.jpeg": "d5bf13af1bbc056d2a649701da45fe6f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "71e3da643f13159bd25b235b98cc659a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "269f971cec0d5dc864fe9ae080b19e23",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "262525e2081311609d1fdab966c82bfc",
"assets/AssetManifest.json": "27757366180f1c15a51371c63c4998d9",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "2ac96fcaeb91dfc943739982cea2992d",
"assets/fonts/MaterialIcons-Regular.otf": "ea0ce394b4ae07bf16789bb2e3a2236c",
"assets/FontManifest.json": "20d0a0a66fd1a2e26612d9bc1ff42dbf",
"assets/AssetManifest.bin": "fdcb63666ba08af7cb9bbc92c56b8212",
"assets/NOTICES": "4017f427653b460a658b17585cd89de7",
"manifest.json": "e70e1b7f665b0e298a5525946cf08274",
"flutter_bootstrap.js": "ac59441f8ce017a4c7b58baf775678a2",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "6e2ddc8cb1df6855d7ff4e894e2c341a",
"index.html": "b1e4289c088aeebf1d839ae17c927ecc",
"/": "b1e4289c088aeebf1d839ae17c927ecc"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
