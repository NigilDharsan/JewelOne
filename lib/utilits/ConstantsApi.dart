enum Environment { DEV, STAGING, PROD }

class ConstantApi {
  static Map<String, dynamic> _config = _Config.debugConstants;
  //JOB CONSTANT API
  static String loginUrl = SERVER_ONE + "login";

  static String dashboardUrl = SERVER_ONE + "dashboard";
  static String usersLogdUrl = SERVER_ONE + "users/log";

  static String servicesList = SERVER_ONE + "services/list";
  static String servicesCreate = SERVER_ONE + "services/create";
  static String servicesStore = SERVER_ONE + "services";
  static String servicesHistory = SERVER_ONE + "services/history/";

  static String marketingList = SERVER_ONE + "marketings/list";
  static String marketingCreate = SERVER_ONE + "marketings/create";
  static String marketingStore = SERVER_ONE + "marketings";
  static String marketingHistory = SERVER_ONE + "marketings/history/";

  static String SOMETHING_WRONG = "Some thing wrong";
  static String NO_INTERNET = "No internet Connection";
  static String BAD_RESPONSE = "Bad Response";
  static String UNAUTHORIZED = "Un Athurized";

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        _config = _Config.debugConstants;
        break;
      case Environment.STAGING:
        _config = _Config.stagingConstants;
        break;
      case Environment.PROD:
        _config = _Config.prodConstants;
        break;
    }
  }

  static get SERVER_ONE {
    return _config[_Config.SERVER_ONE];
  }

  static get BUILD_VARIANTS {
    return _config[_Config.BUILD_VARIANTS];
  }
}

class _Config {
  static const SERVER_ONE = "";
  static const BUILD_VARIANTS = "Taskers-dev";

  static Map<String, dynamic> debugConstants = {
    SERVER_ONE: "https://www.fortunepowerfastening.com/erp/api/",
    BUILD_VARIANTS: "Taskers-dev",
  };

  static Map<String, dynamic> stagingConstants = {
    SERVER_ONE: "https://www.fortunepowerfastening.com/erp/api/",
    BUILD_VARIANTS: "Taskers-dev",
  };

  static Map<String, dynamic> prodConstants = {
    SERVER_ONE: "https://www.fortunepowerfastening.com/erp/api/",
    BUILD_VARIANTS: "Taskers-dev",
  };
}
