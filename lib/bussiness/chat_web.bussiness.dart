import 'dart:async';
import 'dart:convert';

//import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_client/web_socket_client.dart';

class ChatWebService {
  static final _instance =
      ChatWebService._internal(); //(one object of this class is exists )
  WebSocket? _socket;

  factory ChatWebService() =>
      _instance; //whenever class is instantiated the same instance is returned(get back the same WebSocket service instance, not a new one.)

  ChatWebService._internal(); //privatized the constractor (prevents instantiate externally)
  final _searchResultController = StreamController<Map<String, dynamic>>();
  final _contentController = StreamController<Map<String, dynamic>>();

  Stream<Map<String, dynamic>> get searchResultStream =>
      _searchResultController.stream;

  Stream<Map<String, dynamic>> get contentStream => _contentController.stream;

  void connect() {
    _socket = WebSocket(Uri.parse("ws://127.0.0.1:8000/ws/chat"));

    _socket!.connection.listen(
      (state) => print('WebSocket connection state: $state'),
    );

    _socket!.messages.listen(
      (message) {
        final data = json.decode(message);
        print('Message type: ${data['type']}');
        if (data['type'] == 'search_result') {
          _searchResultController.add(data);
        } else if (data['type'] == 'content') {
          _contentController.add(data);
        }
      },
      onError: (error) => print('WebSocket error: $error'),
      onDone: () => print('WebSocket connection closed'),
    );
  }

  void chat(String query) {
    _socket!.send(json.encode({'query': query}));
  }
}
