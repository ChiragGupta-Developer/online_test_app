class PhotoGallary {
  String title;
  String nid_dont_use;
  String field_photo_image_section;
  String path;
  String nid;
  String photo_image_nids;

  PhotoGallary({this.title, this.nid_dont_use, this.field_photo_image_section,
      this.path, this.nid, this.photo_image_nids});

  factory PhotoGallary.fromJson(Map<String, dynamic> json) {
    return PhotoGallary(
        title: json['title'],
        nid_dont_use: json['nid_dont_use'],
        field_photo_image_section: json['field_photo_image_section'],
        path: json['path'],
        nid: json['nid'],
        photo_image_nids: json['photo_image_nids']
    );
  }


}