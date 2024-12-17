class ResponseModel {
 final bool success;
 final String message;
 final dynamic data;
 final String? error;
 ResponseModel({
   required this.success,
   required this.message,
   this.data,
   this.error,
 });

 factory ResponseModel.fromJson(Map<String, dynamic> json) {
   return ResponseModel(
     success: json['success'] ?? false,
     message: json['message'] ?? '',
     data: json['data'],
     error: json['error'],
   );
 }

 Map<String, dynamic> toJson() {
   return {
     'success': success,
     'message': message,
     'data': data,
     'error': error,
   };
 }
}
