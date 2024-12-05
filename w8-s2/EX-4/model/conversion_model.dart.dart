enum Device { EURO, RIEL, DONG }

class ConversionModel {
  static const Map<Device, double> conversionRates = {
    Device.EURO: 0.9,
    Device.RIEL: 4100,
    Device.DONG: 24000,
  };

  static double convert(Device device, double dollarAmount) {
    return dollarAmount * (conversionRates[device] ?? 1.0);
  }

  static String deviceToString(Device device) {
    switch (device) {
      case Device.EURO:
        return 'EURO';
      case Device.RIEL:
        return 'RIEL';
      case Device.DONG:
        return 'DONG';
    }
  }
}
