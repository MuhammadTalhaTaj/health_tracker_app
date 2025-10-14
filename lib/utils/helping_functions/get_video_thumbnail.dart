String getVideoThumbnail(String? url) {
  if(url==null) return '';
  String id;
  final uri = Uri.parse(url);
  try{
    if (uri.host == "youtu.be") {
      id = uri.pathSegments.first;
    } else {
      id = uri.queryParameters["v"]!;
    }
  }
  catch(e){
    return '';
  }
  return "https://img.youtube.com/vi/$id/maxresdefault.jpg";
}