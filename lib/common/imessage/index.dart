import 'dart:async';
import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:uuid/uuid.dart';

// https://pub.flutter-io.cn/packages/socket_io_client
class IMessage {
  static IMessage getInstance() {
    if (_instance == null) {
      _instance = new IMessage();
    }
    return _instance;
  }

  static IMessage _instance;
  IO.Socket socket;

  IMessage() {
    this.socket = IO.io(
      'http://192.168.80.208:3000',
      <String, dynamic>{
        'transports': ['websocket'],
        'query': 'token=da90bfa6-443f-403c-ae5c-d4704b53d58'
      },
    );

    this.socket.on('connect', (data) {
      print('connect successed');
      this.init();
    });

    this.socket.on('disconnect', (data) {
      print('disconnect');
      print(data);
    });

    this.socket.on('error', (error) {
      if (error == 'Authentication error') {
        print('token验证失败');
      }
    });

    this.socket.on('connect_error', this.connectError);

    this.socket.on('offlineMsgs', this.offlineMsgs)
  }

  // 初始化
  void init() {
    this.login().then((value) {
      print(value);
    });
  }

  // 登录
  Future login() {
    // this.socket.emitWithAck('event', data)
    return this.invoke('login', {'socketId': this.socket.id, 'userId': 10000});
  }

  Future invoke(String type, Map args) {
    final completer = Completer();
    final future = completer.future;

    this.socket.emitWithAck(
      'invoke',
      json.encode({
        'type': type,
        'token': Uuid().v4(),
        'args': args,
      }),
      ack: (dynamic res) {
        completer.complete(res);
      },
    );

    return future;
  }

  // 在线接收消息
  void receiveMsg(Map msg, Function callback) {
    try {
      print(msg);
      callback({'code': 200});
    } catch (e) {
      print(e);
    }
  }

  // 接收离线消息
  void offlineMsgs(List msgs, Function callback) {
    try {
      print(msgs);
      callback({'code': 200});
    } catch (e) {
      print(e);
    }
  }

  void connectError(err) {
    print(err);
  }
}
