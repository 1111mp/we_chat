import 'package:we_chat/common/config/config_dev.dart';
import 'package:we_chat/common/config/config_prod.dart';

enum Env {
  PROD,
  DEV,
}

class Config {
  static Config _instance;
  static Env env;

  static Config getInstance() {
    if (_instance == null) {
      _instance = new Config();
    }
    return _instance;
  }

  Map<String, String> config;

  Config() {
    init();
  }

  void init() {
    /// 初始化
    switch (env) {
      case Env.DEV:
        config = DevConfig;
        return;
      case Env.PROD:
        config = ProdConfig;
        return;
      default:
        return;
    }
  }

  void setEasyLoadingCnf() {
    if (env == Env.DEV) {
      devConfigLoading();
    } else if (env == Env.PROD) {
      prodConfigLoading();
    }
  }
}

Map getConfig() {
  return Config.getInstance().config;
}

Config getCnfInstance() {
  return Config.getInstance();
}
