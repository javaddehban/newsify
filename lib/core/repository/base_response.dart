class BaseResponse<B> {
  final dynamic status;
  final dynamic totalResults;
  final dynamic pagination;
  final B? data;

  BaseResponse(this.status, this.totalResults, this.data, this.pagination);

  BaseResponse.fromJsonObject(Map<String, dynamic> json,
      {B Function(Map<String, dynamic> bodyJson)? bodyBuilder})
      : status = json["status"],
        totalResults = json["totalResults"],
        pagination = json["pagination"],
        data = json["articles"] != null ? bodyBuilder?.call(json["articles"]) : null;

  BaseResponse.fromJsonArray(Map<String, dynamic> json,
      {B Function(List<dynamic>)? bodyBuilder})
      : status = json["status"],
        totalResults = json["totalResults"],
        pagination = json["pagination"],
        data = json["articles"] != null ? bodyBuilder?.call(json["articles"]) : null;


  BaseResponse.fromJsonPostObject(Map<String, dynamic> json,
      {B Function(dynamic bodyJson)? bodyBuilder})
      : status = json["status"],
        totalResults = json["totalResults"],
        pagination = json["pagination"],
        data = json["articles"] != null ? bodyBuilder?.call(json["articles"]) : null;

}
