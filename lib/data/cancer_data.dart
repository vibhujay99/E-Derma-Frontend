class CancerDetails{
  final String code;

  CancerDetails({
    required this.code,
});

  String getName(){
    return cancerNames[code]?? "Invalid code";
  }

  String getDescription(){
    return cancerDescriptions[code]?? "Invalid code";
  }

  static const Map<String,String> cancerDescriptions= {
  'akiec': 'Actinic keratoses (AK) and intraepithelial carcinoma, or Bowen\'s disease, are non-melanoma skin cancers caused by prolonged sun exposure. AK presents as rough, scaly patches or small, crusty bumps on sun-exposed skin, while Bowen\'s disease appears as well-defined, scaly, reddish or brownish patches. Symptoms include persistent non-healing wounds and slow enlargement of lesions. Both conditions commonly affect fair-skinned individuals and are more prevalent in older people with a history of sun exposure. If left untreated, a small percentage of AK lesions may progress to invasive squamous cell carcinoma. Treatment involves removing or destroying the affected skin lesions using cryotherapy, topical treatments, curettage, electrodessication, and laser therapy. Potential side effects of treatment may include skin irritation, redness, and temporary discomfort. Regular skin examinations and sun protection are essential preventive measures.',
  'bcc': 'Basal cell carcinoma (BCC) is a common and less aggressive skin cancer originating from basal cells in the epidermis. It appears as a pearly or waxy bump, often flesh-colored or pink, and grows slowly over months or years. Symptoms include ulceration, bleeding, and crusting. Risk factors include sun exposure, fair skin, and weakened immune system. Treatment involves surgical removal or other methods, with an excellent prognosis if detected early. Possible complications include local tissue damage and disfigurement, but BCC rarely spreads to other body parts. Regular skin checks and sun protection are essential for prevention.',
  'bkl': 'Benign keratosis-like lesions (BKL) encompass a group of non-cancerous skin growths, including solar lentigines (sunspots/age spots) and seborrheic keratoses (raised, waxy, pigmented spots). These lesions result from sun exposure and typically occur in middle-aged and older individuals. They are harmless and do not require treatment unless for cosmetic reasons. Lichen-planus-like keratoses are also benign growths, appearing as small, raised reddish-brown or purple papules. They resemble lichen planus but are generally harmless. BKLs may cause itching or irritation, but they are not precancerous or cancerous. If any skin lesion changes or causes concern, consulting a dermatologist is essential for evaluation and appropriate management.',
  'df': 'Dermatofibroma (DF) is a common benign skin growth that appears as a small, firm, reddish-brown or tan bump on the skin, commonly found on the legs. It may measure a few millimeters to one centimeter and has a characteristic "dimple sign" when pinched. Dermatofibromas are typically painless and do not pose health risks. They result from the skin\'s reaction to factors like insect bites or minor injuries, leading to the proliferation of certain cells. Diagnosis is usually made through a physical examination, and treatment is not necessary unless for cosmetic or discomfort reasons. Surgical excision is an option for removal, but scarring may occur. Consult a dermatologist for accurate diagnosis and appropriate management of skin growths. Avoid attempting at-home removal to prevent potential complications.',
  'mel': 'Melanoma is a dangerous form of skin cancer originating from pigment-producing cells (melanocytes). It appears as irregularly shaped, multicolored skin growths that may change in size, shape, or color over time. Melanoma is primarily caused by sun exposure and has risk factors such as fair skin, numerous moles, family history, and weakened immunity. Diagnosis involves a biopsy, and treatment includes surgical removal, immunotherapy, targeted therapy, radiation, or chemotherapy, depending on cancer\'s stage. Early detection and prompt treatment are crucial for better outcomes. Preventive measures include sun safety and regular skin checks. If any suspicious skin changes occur, consulting a dermatologist is vital for evaluation and management.',
  'nv': 'Melanocytic nevi, commonly known as moles, are benign skin growths originating from pigment-producing cells. They appear as round or oval spots in various colors and sizes, typically developing during childhood or adolescence. Most moles are harmless and painless, but changes in size, shape, color, or symptoms like itching or bleeding should be monitored. Certain types, such as atypical nevi, have a slightly increased risk of developing into melanoma. Regular skin self-examination and professional checks are essential for early detection. Practicing sun safety can reduce the risk of skin cancers. If any mole exhibits suspicious features, it should be evaluated by a dermatologist, who may perform a biopsy if necessary. Prompt evaluation and management are crucial to prevent potential complications and ensure timely treatment if needed.',
  'vasc': 'Vascular lesions encompass various skin abnormalities involving blood vessels. Examples include angiomas (cherry, spider, venous lakes), angiokeratomas, pyogenic granulomas, and hemorrhages. Angiomas are benign tumors, cherry angiomas are red dome-shaped lesions, spider angiomas have a spider-like appearance, and venous lakes are bluish-purple. Angiokeratomas are dark red to purple bumps with overgrown skin cells. Pyogenic granulomas are rapidly growing reddish lesions, and hemorrhages are red or purple spots caused by blood vessel leakage. Most lesions are harmless, but some may bleed or cause discomfort. Treatment options for removal include laser therapy, electrosurgery, cryotherapy, or surgical excision. If any skin growths appear new or changing, consult a dermatologist for proper diagnosis and management to rule out potential concerns and receive appropriate care.',
  };

  static const Map<String,String> cancerNames= {
    'akiec': 'Actinic keratoses and intraepithelial carcinoma',
    'bcc': 'Basal cell carcinoma',
    'bkl': 'Benign keratosis-like lesions',
    'df': 'Dermatofibroma',
    'mel': 'Melanoma',
    'nv': 'Melanocytic nevi ',
    'vasc': 'Vascular lesions',
  };
}