class LesionDetails {
  final String result;

  LesionDetails({
    required this.result,
  });

  String getName() {
    return lesionNames[result] ?? "Invalid Code";
  }

  String getDescription() {
    return lesionDescriptions[result] ?? "Invalid Code";
  }

  static const Map<String, String> lesionDescriptions = {
    'scars':
        'Scars, which are visible marks on the skin, develop as a result of the bodys natural response to tissue damage caused by injuries or trauma. These blemishes vary in appearance, texture, and size, contingent upon factors such as the severity of the initial injury, an individuals skin type, and the quality of wound care during the healing process. Scars can manifest in several forms, including normal scars, which are flat and paler than the surrounding skin, and hypertrophic or keloid scars, which may be raised and more conspicuous. While scars cannot be entirely eradicated, there exist diverse treatment options and strategies to enhance their appearance, such as topical creams, laser therapy, and surgical procedures. Moreover, it is essential to emphasize the importance of proper wound care to minimize scarring during the initial stages of healing, as well as the psychological impact scars may have on an individuals self-esteem and body image.',
    'bullaVesicles':
        'Bullae and vesicles are both types of skin lesions characterized by the presence of fluid-filled sacs within or just beneath the skin. Vesicles are small, typically measuring less than 5 millimeters in diameter, and contain clear fluid. They can result from various causes, including insect bites, allergic reactions, or viral infections like herpes. On the other hand, bullae are larger fluid-filled sacs, typically exceeding 5 millimeters in size, and they often contain clear or sometimes bloody fluid. Bullae can be caused by conditions such as burns, autoimmune disorders like pemphigus, or certain blistering skin diseases. Both vesicles and bullae can be uncomfortable and may rupture, leading to the release of fluid and potential infection. Proper diagnosis and management of these skin lesions are crucial for appropriate treatment and care.',
  };

  static const Map<String, String> lesionNames = {
    'scars': 'Scars',
    'bullaVesicles': 'Bullae and Vesicles',
  };
}
