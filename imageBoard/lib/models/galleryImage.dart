class GalleryImage {
    GalleryImage({
        this.width,
        this.height,
        this.url,
        this.downloadUrl,
    });

    int width;
    int height;
    String url;
    String downloadUrl;

    factory GalleryImage.fromJson(Map<String, dynamic> json) => GalleryImage(
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
    );
}