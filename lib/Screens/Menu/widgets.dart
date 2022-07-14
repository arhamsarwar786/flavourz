
  import 'dart:convert';

decodedImage(image) {
    var imageFile = base64Decode(image);
    return imageFile;
  }