import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> sendEmail(String title, String name, String message) async {
  const serviceId = 'service_5etexn4';
  const templateId = 'template_qadgwi9';
  const userId = 'BnvSZsMc9YuKuSeSw';

  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

  final response = await http.post(
    url,
    headers: {'origin': 'http://localhost', 'Content-Type': 'application/json'},
    body: jsonEncode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params': {
        'title': title,
        'user_name': name,
        'message': message,
      },
    }),
  );

  if (response.statusCode == 200) {
    print('Email sent successfully!');
  } else {
    print('Failed to send email: ${response.body}');
  }
}
