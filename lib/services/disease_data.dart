import 'package:e_derma/models/disease_model.dart';

class DiseaseData{

  static late List<DiseaseModel> diseases = [] ;
  static const des = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";


  init(){
    //initializing the list
    for(int c = 0; c<38; c++){
      diseases.add(DiseaseModel(
          name: 'init',
          description: 'init',
          source: "init",
          index: 0,
          remedy: 'init'));
    }

    //creating disease instances for all diseases
    diseases[0] = DiseaseModel(
        name: 'Apple Scab',
        description: appleScab,
        remedy: "To prevent the fungus from spreading, remove and burn the fallen dead leaves. Make sure the canopy has enough ventilation and that the plants are not overcrowded. Begin fertilizing at two-week intervals once fresh growth has emerged.",
        source: 'wikipedia.org',
        index: 0);

    diseases[1] = DiseaseModel(
        name: 'Apple Black rot',
        remedy: "Remove any branches that are dead or unhealthy and destroy all the infected parts. Pick all of the remaining dry and deformed fruits off the trees. If you take down any apple trees, make sure to remove the stumps as spores can be found in dead stumps.",
        description: appleBlackRot,
        source: "gardeningknowhow.com",
        index: 1);

    diseases[2] = DiseaseModel(
        name: 'Apple Cedar Rust',
        description: appleCederRust,
        remedy: "Remove fallen leaves and other debris from under trees with a rake. Infected junipers should have their galls removed. Use disease-fighting fungicides as a preventative measure.",
        source: "fs.fed.us",
        index: 2);

    diseases[5] = DiseaseModel(
        name: 'Cherry Powdery mildew',
        description: cherryPowderyMildew,
        remedy: "Apply fungicides as the disease grows. Pruning the infected trees and eliminating hedgerows near the trees aid in the drying of leaves and fruit, which helps manage this disease.",
        source: "treefruit.wsu.edu",
        index: 5);

    diseases[7] = DiseaseModel(
        name: 'Corn Grey leaf spot',
        description: cornGreyLeafSpot,
        remedy: "Prune and remove heavily affected leaves. Apply neem oil or similar fungicide to the foliage on a regular basis. As it recovers, avoid getting water on the leaves. Temporarily keep the plant away from other plants and monitor on a daily basis to see if the virus has stopped spreading.",
        source: "extension.umn.edu",
        index: 7);

    diseases[8] = DiseaseModel(
        name: 'Corn Common rust',
        description: cornCommonRust,
        remedy: "If the corn starts to show signs of infection, spray it with a fungicide immediately. When used at the first sign of infection, the fungicide is most effective.",
        source: "extension.umn.edu",
        index: 8);

    diseases[10] = DiseaseModel(
        name: 'Corn Northern Leaf Blight',
        description: cornNorthernLeafBlight,
        remedy: "Till the corn into the soil. If in a small garden, it may be more practical to simply uproot and destroy the damaged plants. The northern corn leaf blight should be treated using fungicides.",
        source: "udel.edu",
        index: 10);

    diseases[11] = DiseaseModel(
        name: 'Grape Black rot',
        description: grapeBlackRot,
        remedy: "Between bud break and roughly four weeks following bloom is the optimal period to treat black rot in grapes. Remove out all areas with lesions. If new lesions emerge on the leaves remove them immediately and begin a spray treatment regimen with fungicides.",
        source: "wikipedia.org",
        index: 11);

    diseases[12] = DiseaseModel(
        name: 'Grape Esca (Black Measles)',
        description: grapeEsca,
        remedy: "Leaves that are badly impacted should be pruned and removed. Provide suitable fungicides and avoid getting water onto the leaves. Temporarily keep the plant away from other plants as the bacteria can be spread to other plants.",
        source: "www2.ipm.ucanr.edu",
        index: 12);

    diseases[14] = DiseaseModel(
        name: 'Grape Leaf blight (Isariopsis Leaf Spot)',
        description: grapeLeafBlight,
        remedy: "Use fungicides to control the disease and remove all the infected leaves.",
        source: "plantvillage.psu.edu",
        index: 14);

    diseases[15] = DiseaseModel(
        name: 'Orange Haunglongbing (Citrus greening)',
        description: orangeHaunglongbing,
        remedy: "There is no cure for citrus greening once it has developed. Your tree will decline over time, and the disease will eventually destroy the tree. Therefore It's essential to get rid of citrus greening disease-affected trees since every tree infected with citrus greening has the potential to infect healthy trees.",
        source: "frontiersin.org",
        index: 15);

    diseases[16] = DiseaseModel(
        name: 'Peach Bacterial spot',
        description: peachBacterialSpot,
        remedy: "To prevent the germs from spreading to other leaves, remove the afflicted leaves as soon as possible. Remove any old fruit debris from the garden and avoid planting new crops where host plants once thrived. There are no chemical treatments for this disease. Therefore take the necessary preventive measures at the first sign of symptoms.",
        source: "canr.msu.edu",
        index: 16);

    diseases[18] = DiseaseModel(
        name: 'Bell pepper bacterial spot',
        description: bellPepperBacterialSpot,
        remedy: "Infected seeds might potentially spread bacterial leaf spot. Therefore buy certified disease free seed and seedlings. Splattering damp soil onto the leaves also spreads the bacterium. Therefore Use a soaker hose to reduce spatter and avoid overhead watering. Crop rotation can assist in the prevention of bacterial leaf spot.",
        source: "extension.wvu.edu",
        index: 18);

    diseases[21] = DiseaseModel(
        name: 'Potato Early blight',
        description: potatoEarlyBlight,
        remedy: "To treat the Potato Early blight, prune plants to improve air circulation and reduce fungal problems. Moreover, keep the soil under plants clean and free of garden debris. Potato Early blight can be prevented by planting potato varieties that are resistant to the disease",
        source: "www2.ipm.ucanr.edu",
        index: 20);

    diseases[22] = DiseaseModel(
        name: 'Potato Late blight',
        description: potatoLateBlight,
        remedy: "Potato Late blight can be treated by planting resistant cultivars when available. Also, remove volunteers from the garden prior to planting and space plants far enough apart to allow for plenty of air circulation.",
        source: "apsnet.org",
        index: 22);

    diseases[25] = DiseaseModel(
        name: 'Squash Powdery mildew',
        description: squashPowderyMildew,
        remedy: "For Squash Powdery mildew, Use sulfur-containing organic fungicides to prevent and cure the infections. Furthermore, remove the affected part from the plant and discard. Some perennials can be cut down to the ground and new growth will appear.",
        source: "growveg.com",
        index: 25);

    diseases[27] = DiseaseModel(
        name: 'Strawberry Leaf scorch',
        description: strawberryLeafScorch,
        remedy: "Strawberry Leaf scorch can be treated by removing infected garden debris from the strawberry patch, as well as establishing frequent new strawberry transplants.",
        source: "gardeningknowhow.com",
        index: 27);

    diseases[28] = DiseaseModel(
        name: 'Tomato Bacterial spot',
        description: tomatoBacterialSpot,
        remedy: "Tomato Bacterial spot cannot be cured.  So to prevent the spread, remove plants with symptoms from the field.  Burn, bury or hot compost the affected plants and avoid eating symptomatic fruit.",
        source: "hort.extension.wisc.edu",
        index: 28);

    diseases[29] = DiseaseModel(
        name: 'Tomato Early blight',
        description: tomatoEarlyBlight,
        remedy: "Tomato Early blight can be treated by removing infected plant portions. If you notice any telltale signs, prune those sections from the plant and discard them far away from your garden. Also, can use fungicide to solve the problem.",
        source: "extension.umn.edu",
        index: 29);

    diseases[31] = DiseaseModel(
        name: 'Tomato Late blight',
        description: tomatoLateBlight,
        remedy: "Tomato Late blight is not a treatable disease, and it will kill the plants. It is important to destroy infected plants once you confirm that your plant is having late blight because it can spread quickly.",
        source: "www2.ipm.ucanr.edu",
        index: 31);

    diseases[32] = DiseaseModel(
        name: 'Tomato Leaf Mold',
        description: tomatoLeafMold,
        remedy: "Tomato Leaf Mold can be treated by spraying fungicide. When spraying fungicide, cover all parts of the plant that are above ground. Another treatment is to let the plants air out and dry. By doing this, the humidity of the leaves becomes low.",
        source: "canr.msu.edu",
        index: 32);

    diseases[33] = DiseaseModel(
        name: 'Tomato Septoria leaf spot',
        description: tomatoSeptoriaLeafSpot,
        remedy: "Spraying fungicides can help in treating Septoria leaf spot disease. The chemicals need to be applied on a seven-to-ten-day schedule to be effective. The most used chemicals are maneb and chlorothalonil. Potassium bicarbonate, ziram, and copper products are a few other sprays useful against the fungus.",
        source: "missouribotanicalgarden.org",
        index: 33);

    diseases[34] = DiseaseModel(
        name: 'Tomato Spider mites (Two-spotted spider mite)',
        description: tomatoSpiderMites,
        remedy: "To treat the two-spotted mites apply a pesticide specific to mites called a miticide. Two-spotted mites should be started before the plants are seriously damaged. Apply the miticide for control of two-spotted mites every 7 days or so. Switch to another type of miticide after three applications, Since mites can develop resistance to chemicals.",
        source: "pnwhandbooks.org",
        index: 34);

    diseases[35] = DiseaseModel(
        name: 'Tomato Target Spot',
        description: tomatoTargetSpot,
        remedy: "Tomato Target Spot can be treated using fungicides. Fungicides that are used for Tomato Target Spot are chlorothalonil, copper oxychloride or mancozeb. Treatment should be started when the first spots are seen and continue at 10-14-day intervals until 3-4 weeks before last harvest.",
        source: "gardeningknowhow.com",
        index: 35);

    diseases[36] = DiseaseModel(
        name: 'Tomato Mosaic Virus',
        description: tomatoMosaicVirus,
        remedy: "There is no cure for mosaic viruses. So, to prevent the infection from spreading, remove all infected plants and destroy them. The virus can persist in infected plant matter so avoid putting them in the compost pile. Burn infected plants or throw them out.",
        source: "sciencedirect.com",
        index: 36);

    diseases[37] = DiseaseModel(
        name: 'Tomato Yellow Leaf Curl Virus',
        description: tomatoYellowLeafCurlVirus,
        remedy: "For, Tomato Yellow Leaf Curl Virus use a fungicide named imidacloprid  for the treatment. Imidacloprid should be sprayed on the entire plant and below the leaves. Spray every 14-21 days and rotate monthly with Abamectin so that the infection won't build-up resistance to chemicals.",
        source: "www2.ipm.ucanr.edu",
        index: 37);

  }

  //disease details
  static String appleScab = "Apple scab is a common disease of plants in the rose family (Rosaceae) that is caused by the ascomycete fungus Venturia inaequalis. While this disease affects several plant genera, including Sorbus, Cotoneaster, and Pyrus, it is most commonly associated with the infection of Malus trees, including species of flowering crab apple, as well as cultivated apple. The first symptoms of this disease are found in the foliage, blossoms, and developing fruits of affected trees, which develop dark, irregularly-shaped lesions upon infection. Although apple scab rarely kills its host, infection typically leads to fruit deformation and premature leaf and fruit drop, which enhance the susceptibility of the host plant to abiotic stress and secondary infection. The reduction of fruit quality and yield may result in crop losses of up to 70%, posing a significant threat to the profitability of apple producers.[6] To reduce scab-related yield losses, growers often combine preventive practices, including sanitation and resistance breeding, with reactive measures, such as targeted fungicide or biocontrol treatments, to prevent the incidence and spread of apple scab in their crops";
  static String appleBlackRot = "Black rot is a disease of apples that infects fruit, leaves, and bark caused by the fungus Botryosphaeria obtusa. It can also jump to healthy tissue on pear or quince trees but is typically a secondary fungus of weak or dead tissues in other plants. Begin checking your apple trees for signs of infection about a week after the petals fall from your apple blossoms.";
  static String appleCederRust = "This fungus is wide spread in eastern North America. It is usually associated with rural areas that alternate between farmland and forest or thicket. It requires two hosts to be present, usually within a mile of each other, a juniper species, usually eastern redcedar (Juniperus virginiana), and an apple, crabapple (Malus or Pyrus spp. depending on source), hawthorn (Crataegus spp.) or quince (Cydonia oblonga). The fungus takes on different forms on each host and most readily noticeable on redcedar. One form or another of the fungus can be can be found throughout the growing season, but may not be seen in drier sites until after a series of rains. It frequently is found in disturbed or open areas such as along gravel or dirt roads, trails openings, pastures and apple orchards.";
  static String cherryPowderyMildew = "Powdery mildew of sweet and sour cherry is caused by Podosphaera clandestina, an obligate biotrophic fungus. Mid- and late-season sweet cherry (Prunus avium) cultivars are commonly affected, rendering them unmarketable due to the covering of white fungal growth on the cherry surface. Season long disease control of both leaves and fruit is critical to minimize overall disease pressure in the orchard and consequently to protect developing fruit from accumulating spores on their surfaces.";
  static String cornGreyLeafSpot = "Gray leaf spot is typically the most serious foliar disease of corn in the U.S. corn belt, although other diseases can be more important in areas and years where weather conditions do not favor gray leaf spot. Gray leaf spot requires extended periods of high humidity and warm conditions. It can be confused with other foliar diseases of corn.";
  static String cornCommonRust = "Common rust frequently occurs in the northern U.S. in mid to later summer. It rarely reaches levels that cause yield loss in commercial hybrids. It is most problematic during prolonged periods of cool, wet weather. Rust diseases are generally easy to identify by the appearance of brown pustules. Common rust produces rust-colored to dark brown, elongated pustules on both leaf surfaces. The pustules contain rust spores (urediniospores) that are cinnamon brown in color. Pustules darken as they age. Leaves, as well as sheaths, can be infected. Under severe conditions leaf chlorosis and death may occur. Common rust can be differentiated from Southern rust by the brown pustules occurring on both top and bottom leaf surfaces with common rust.";
  static String cornNorthernLeafBlight = "Northern corn leaf blight (NCLB) is a disease of corn caused by the fungus, Exserohilum turcicum. Severe outbreaks of the disease can cause up to 30-50% yield loss in dent corn if the disease is established before tassel. NCLB also causes significant reduction in quality in sweet corn and silage corn. This publication will outline how to identify the disease, review its lifecycle, as well as appropriate management options for growers. NCLB is favored by moderate temperatures and wet, humid weather. Frequent rainfall, high humidity, or fields prone to extended periods of heavy dews may be at risk for developing NCLB. Symptoms generally appear first on the lower leaves, but may move higher in the canopy as the disease progresses. Leaf blades, sheaths, and ear husks may show symptoms on susceptible hybrids.";
  static String grapeBlackRot = "Grape black rot is a fungal disease caused by an ascomycetous fungus, Guignardia bidwellii, that attacks grape vines during hot and humid weather. “Grape black rot originated in eastern North America, but now occurs in portions of Europe, South America, and Asia. It can cause complete crop loss in warm, humid climates, but is virtually unknown in regions with arid summers.” The name comes from the black fringe that borders growing brown patches on the leaves. The disease also attacks other parts of the plant, “all green parts of the vine: the shoots, leaf and fruit stems, tendrils, and fruit. The most damaging effect is to the fruit”. Grape black rot affects many grape growers throughout the United States, therefore, it is important to understand the disease life cycle and environmental conditions to best manage the disease. Once infection takes place, different methods are available to control the disease.";
  static String grapeEsca = "Esca, Botryosphaeria dieback, Eutypa dieback, and Phomopsis dieback make up a complex of trunk diseases caused by different wood-infecting fungi. The foliar symptom of Esca is an interveinal striping. The stripes, which start out as dark red in red cultivars and yellow in white cultivars, dry and become necrotic. Foliar symptoms may occur at any time during the growing season, but are most prevalent during July and August. They are often restricted to an individual shoot or to shoots originating from the same spur or cane. Symptomatic leaves can dry completely and drop prematurely. On berries, small, round, dark spots each bordered by a brown-purple ring, may occur. These fruit spots, which are better viewed on white cultivars, may appear at any time between fruit set and ripening. In severely affected vines, the berries often crack and dry or are subject to spoilage.";
  static String grapeLeafBlight = "On leaf surface we will see lesions which are irregularly shaped (2 to 25 mm in diameter). Initially lesions are dull red to brown in color turn black later. If disease is severe this lesions may coalesce. On berries we can see symptom similar to black rot but the entire clusters will collapse. This disease is caused by a fungus. Common in tropical and subtropical grapes. The disease appear late in the season. Cynthiana and Cabernet Sauvignon are susceptible to this pathogen.";
  static String orangeHaunglongbing = "Huanglongbing (HLB) or citrus greening is the most severe citrus disease, currently devastating the citrus industry worldwide. The presumed causal bacterial agent Candidatus Liberibacter spp. affects tree health as well as fruit development, ripening and quality of citrus fruits and juice. Fruit from infected orange trees can be either symptomatic or asymptomatic. Symptomatic oranges are small, asymmetrical and greener than healthy fruit. Furthermore, symptomatic oranges show higher titratable acidity and lower soluble solids, solids/acids ratio, total sugars, and malic acid levels. Among flavor volatiles, ethyl butanoate, valencene, decanal and other ethyl esters are lower, but many monoterpenes are higher in symptomatic fruit compared to healthy and asymptomatic fruit.";
  static String peachBacterialSpot = "Bacterial spot is an important disease of peaches, nectarines, apricots, and plums caused by Xanthomonas campestris pv. pruni. Symptoms of this disease include fruit spots, leaf spots, and twig cankers. Fruit symptoms include pitting, cracking, gumming, and watersoaked tissue, which can make the fruit more susceptible to brown rot, rhizopus, and other fungal infections. Severe leaf spot infections can cause early defoliation. Severe defoliation can result in reduced fruit size, and sunburn and cracking of fruit. Early defoliated trees are reduced in vigor and winter hardiness. Leaf symptoms of bacterial spot on peaches and nectarines are generally dark, small lesions, often clustered at the leaf tip where water collects during dews and rain. Leaf tissue around lesions can turn yellow. Fruit symptoms of bacterial spot may be confused with peach scab, caused by the fungus Cladosporium carpophyllium, however scab spots are more circular, have a dark brown/greenish, fuzzy appearance, and do not pit the fruit surface, although skin cracking can occur. Scab does not cause leaf symptoms but can cause spots on twigs. Initial fruit spots of bacterial spot may be superficial but develop into craters.";
  static String bellPepperBacterialSpot = "Bacterial leaf spot, caused by Xanthomonas campestris pv. vesicatoria, is the most common and destructive disease for peppers in the eastern United States. It is a gram-negative, rod-shaped bacterium that can survive in seeds and plant debris from one season to another (Frank et al. 2005). Different strains or races of the bacterium are cultivar-specific, causing disease symptoms in certain varieties due to stringent host specificity. Bacterial leaf spot can devastate a pepper crop by early defoliation of infected leaves and disfiguring fruit. In severe cases, plants may die as it is extremely difficult to find a cure once the disease takes hold. However, there are several options for growers to prevent it from occurring and spreading.";
  static String potatoEarlyBlight = "Early blight is primarily a disease of stressed or senescing plants. Symptoms appear first on the oldest foliage. Affected leaves develop circular to angular dark brown lesions 0.12 to 0.16 inch (3–4 mm) in diameter. Concentric rings often form in lesions to produce characteristic target-board effect. Severely infected leaves turn yellow and drop. Infected tubers show a brown, corky dry rot. Between crops, the early blight fungus can overwinter on potato refuse in the field, in soil, on tubers, and on other solanaceous plants. Infection occurs when spores of the fungus come in contact with susceptible leaves and sufficient free moisture is present. Spore germination and infection are favored by warm weather and wet conditions from dew, rain, or sprinkler irrigation. Alternately, wet and dry periods with relatively dry, windy conditions favor spore dispersal and disease spread. Tubers can be infected as they are lifted through the soil at harvest. If sufficient moisture is present, spores germinate and infect the tubers.";
  static String potatoLateBlight = "Late blight is the disease that caused the Irish potato famine of the 1840s. The pathogen was first described by M. J. Berkeley and subsequently named Phytophthora infestans by Anton de Bary in the 1870’s (Berkeley, 1846; de Bary, 1876).  de Bary's  (the \"father of plant pathology\") conclusive studies convinced the scientific community that the white sporulation of P. infestans on infected potato plants was the causal agent of the disease and not the result of spontaneous generation from the decaying vegetation or the wrath of God. Thus, late blight signifies the official beginning of the science of plant pathology. These early studies also contributed to Louis Pasteur's germ theory which was proposed 15 years later. Late blight of potato is identified by blackish/brown lesions on leaves and stems (Figures 3,4) that may be small at first and appear water-soaked or have chlorotic borders but expand rapidly and the entire leaf becomes become necrotic. In humid conditions, P. infestans produces sporangia and sporangiophores on the surface of infected tissue and the resulting white sporulation can be seen at the margins of lesions on abaxial (lower) surfaces of leaves. As many lesions accumulate, the entire plant can be destroyed in a matter of days after the first lesions are observed if the appropriate fungicide applications are not used.";
  static String squashPowderyMildew = "White deposits develop on the top sides of leaves that make them look like they have been dusted with flour. As this fungal disease advances, leaves become grayish-green and become dry to the touch. Eventually these leaves turn brown and fall off. Powdery mildew is most likely to infect older plants that are beginning to decline after producing a crop. Warm temperatures between 70 and 80F (21 to 27C) favor cucurbit powdery mildew, but rainy weather is not required to trigger an outbreak. Powdery mildew fungi clog up leaf pores and block light to photosynthetic cells, so the plants are weakened in their ability to use light as an energy source. New growth stops, old leaves fall off, and the plants struggle to stay alive. Pumpkins or winter squash produced by mildewed plants may lack flavor, and quickly lose quality in storage.";
  static String strawberryLeafScorch = "Scorched strawberry leaves are caused by a fungal infection which affects the foliage of strawberry plantings. The fungus responsible is called Diplocarpon earliana. Strawberries with leaf scorch may first show signs of issue with the development of small purplish blemishes that occur on the topside of leaves. Over time, the spots will continue to grow larger and darken. In severe cases, dark spots may even cover entire portions of strawberry plant leaves and cause them to completely dry and fall from the plant. Though the foliage of the infected plants is not aesthetically pleasing, it is seldom that the presence of this fungus impacts the quality of the strawberry crop itself.";
  static String tomatoBacterialSpot = "Bacterial spot of tomato is a potentially devastating disease that, in severe cases, can lead to unmarketable fruit and even plant death.  Bacterial spot can occur wherever tomatoes are grown, but is found most frequently in warm, wet climates, as well as in greenhouses.  The disease is often an issue in Wisconsin. Bacterial spot can affect all above ground parts of a tomato plant, including the leaves, stems, and fruit.  Bacterial spot appears on leaves as small (less than ⅛ inch), sometimes water-soaked (i.e., wet-looking) circular areas.  Spots may initially be yellow-green, but darken to brownish-red as they age.  When the disease is severe, extensive leaf yellowing and leaf loss can also occur.  On green fruit, spots are typically small, raised and blister-like, and may have a yellowish halo.  As fruit mature, the spots enlarge (reaching a maximum size of ¼ inch) and turn brown, scabby and rough.";
  static String tomatoEarlyBlight = "Early blight is one of the most common tomato and potato diseases, occurring nearly every season in Minnesota. It affects leaves, fruits and stems and can be severely yield-limiting when susceptible tomato cultivars are used and weather is favorable. Initially, small dark spots form on older foliage near the ground. Leaf spots are round, brown and can grow up to 1/2 inch in diameter. Larger spots have target-like concentric rings. The tissue around spots often turns yellow. Severely infected leaves turn brown and fall off, or dead, dried leaves may cling to the stem. Early blight can be caused by two closely related species: Alternaria tomatophila and Alternaria solani. Both pathogens can infect tomatoes, potatoes, peppers, and several weeds in the Solanaceae family including black nightshade (Solanum ptycanthum), and hairy nightshade (Solanum physalifolium).";
  static String tomatoLateBlight = "Late blight is found when humid conditions coincide with mild temperatures for prolonged periods. When humidity is above 90% and the average temperature is in the range of 60° to 78°F, infection occurs in about 10 hours. If conditions are ideal for disease development, disease development is rapid and losses can be severe. The fungus overwinters in potatoes, tomatoes, hairy nightshade, and possibly in the soil. Spores of the fungus are easily spread by wind to other plants. Leaf symptoms of late blight first appear as small, water-soaked areas that rapidly enlarge to form purple-brown, oily-appearing blotches. On the lower side of leaves, rings of grayish white mycelium and spore-forming structures may appear around the blotches. Entire leaves die and infections quickly spread to petioles and young stems. Infected fruit turn brown but remain firm unless infected by secondary decay organisms; symptoms usually begin on the shoulders of the fruit because spores land on fruit from above.";
  static String tomatoLeafMold = "Tomato leaf mold is a fungal disease that can develop when there are extended periods of leaf wetness and the relative humidity is high (greater than 85 percent). Due to this moisture requirement, the disease is seen primarily in hoophouses and greenhouses. Tomato leaf mold can develop during early spring temperatures (50.9 degrees Fahrenheit) or those characteristic of summer (90 F). The optimal temperature tomato leaf mold is in the low 70s. Symptoms of disease include yellow spots on the upper leaf surface. Discrete masses of olive-green spores can be seen on the underside of the affected leaves. The older leaves become infected first and die prematurely. The pathogen may spread rapidly during periods of prolonged relative humidity. The disease can cause flowers to drop but usually does not affect developing fruit. If infection occurs late in the season, yield losses will be minimal, but if the disease takes hold earlier, the premature defoliation will impact yield.";
  static String tomatoSeptoriaLeafSpot = "Septoria leaf spot is caused by a fungus, Septoria lycopersici. It is one of the most destructive diseases of tomato foliage and is particularly severe in areas where wet, humid weather persists for extended periods. Septoria leaf spot usually appears on the lower leaves after the first fruit sets. Spots are circular, about 1/16 to 1/4 inch in diameter with dark brown margins and tan to gray centers with small black fruiting structures. Characteristically, there are many spots per leaf. This disease spreads upwards from oldest to youngest growth. If leaf lesions are numerous, the leaves turn slightly yellow, then brown, and then wither. Fruit infection is rare. The fungus overwinters on infected tomato debris or on weeds in the nightshade family, the same family to which tomatoes belong. The fungus can also survive on equipment such as plant stakes and cages. Long periods of high relative humidity, temperatures of 60–80 degrees F, and leaf wetness are ideal conditions for development and spread of the pathogen.";
  static String tomatoSpiderMites = "Several species of spider mites are common in the Pacific Northwest. Frequently, infestations include a mixture of spider mite species. Adult mites are about 0.06 inch long, have four pairs of legs, are greenish to pink or cream color, and have various-size black spots on the body. Under warm conditions, spider mites move rapidly within the colony area. Damaged leaves become somewhat stippled on the upper surface and may turn brown or bronze with heavy damage. The undersurface of leaves may have a grayish cast due to webbing. Wilting, leaf deformity, tissue death, and abscission all may take place. (Trivia fact: Twospotted spider mites can feed on 18 to 22 plant cells per minute.)";
  static String tomatoTargetSpot = "Also known as early blight, target spot of tomato is a fungal disease that attacks a diverse assortment of plants, including papaya, peppers, snap beans, potatoes, cantaloupe, and squash as well as passion flower and certain ornamentals. Target spot on tomato fruit is difficult to control because the spores, which survive on plant refuse in the soil, are carried over from season to season. Read on to learn how to treat target spot on tomatoes. Target spot on tomato fruit is difficult to recognize in the early stages, as the disease resembles several other fungal diseases of tomatoes. However, as diseased tomatoes ripen and turn from green to red, the fruit displays circular spots with concentric, target-like rings and a velvety black, fungal lesions in the center. The “targets” become pitted and larger as the tomato matures.";
  static String tomatoMosaicVirus = "Tomato mosaic virus (ToMV ) Long considered a strain of TMV, ToMV is a distinct viral species, also transmitted by contact. Present on every continent, this virus is found more frequently than TMV on tomato and pepper, both in field crops and under protection. The importance of ToMV has greatly diminished with the widespread use of resistant varieties of tomato. Recent experiments of introducing non-resistant crop varieties have shown however, that the very stable ToMV virus is still widely present in the field. symptoms can vary depending on the nature of the strains, cultivar, stage of infection, temperature, intensity of light, and nitrogen and boron soil content. For example, high temperatures may reduce the intensity of symptoms on leaves.";
  static String tomatoYellowLeafCurlVirus = "Tomato yellow leaf curl virus is undoubtedly one of the most damaging pathogens of tomato, and it limits production of tomato in many tropical and subtropical areas of the world. It is also a problem in many countries that have a Mediterranean climate such as California. Thus, the spread of the virus throughout California must be considered as a serious potential threat to the tomato industry. Leaves of infected plants are small and curl upward; and show strong crumpling and interveinal and marginal yellowing. The internodes of infected plants become shortened and, together with the stunted growth, plants often take on a bushy appearance, which is sometimes referred to as 'bonsai' or broccoli'-like growth. Flowers formed on infected plants commonly do not develop and fall off (abscise). Fruit production is dramatically reduced, particularly when plants are infected at an early age, and it is not uncommon for losses of 100% to be experienced in fields with heavily infected plants.";

}