class Endpoints {
  Endpoints._();

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  static String nftBalance(String walletAddress) {
    return '/nftBalance';
  }
}
