-- 
-- 
-- 
--

    -- this index points to the location of this save
    -- in the aWarriorSaves, aPriestSaves, aWizardSaves, aRogueSaves
    -- We do this so we can split the saves up and give
    -- bonuses for things like just poison or just wands.
    -- 1 = Paralyzation, poison or death
    -- 2 = Rod, Staff or Wand
    -- 3 = Petrification or Polymorph
    -- 4 = Breath
    -- 5 = Spell
    saves_table_index = {
        ["poison"] = 1,
        ["paralyzation"] = 1,
        ["death"] = 1,
        ["rod"] = 2,
        ["staff"] = 2,
        ["wand"] = 2,
        ["petrification"] = 3,
        ["polymorph"] = 3,
        ["breath"] = 4,
        ["spell"] = 5
    };

    aWarriorSaves = {};
    aPriestSaves = {};
    aWizardSaves = {};
    aRogueSaves = {};

    -- every 3 levels get improvement of 2 thaco
    thaco_priest_rate = 3;
    thaco_priest_advancement = 2;
    
    -- every 1 level get improvement of 1 thaco
    thaco_warrior_rate = 1;
    thaco_warrior_advancement = 1;

    -- every 2 levels get improvement of 1 thaco
    thaco_rogue_rate = 2;
    thaco_rogue_advancement = 1;
    
    -- every 3 levels get improvement of 1 thaco
    thaco_wizard_rate = 3;
    thaco_wizard_advancement = 1;

    -- ability scores 
    aStrength = {};
    aDexterity = {};
    aWisdom = {};
    aConstitution = {};
    aCharisma = {};
    aIntelligence = {};
    
function onInit()
    -- default initiative dice size 
	nDefaultInitiativeDice = 6;

    -- aStrength[abilityScore]={hit adj, dam adj, weight allow, max press, open doors, bend bars}
    aStrength[1]  = {-3,-1,-350,0,"1(0)",0};
    aStrength[2]  = {-3,-1,-350,0,"1(0)",0};
    aStrength[3]  = {-3,-1,-350,0,"1(0)",0};
    aStrength[4]  = {-2,-1,-250,0,"1(0)",0};
    aStrength[5]  = {-2,-1,-250,0,"1(0)",0};
    aStrength[6]  = {-1,0,-150,0,"1(0)",0};
    aStrength[7]  = {-1,0,-150,0,"1(0)",0};
    aStrength[8]  = {0,0,0,0,"1-2(0)",1};
    aStrength[9]  = {0,0,0,0,"1-2(0)",1};
    aStrength[10] = {0,0,0,0,"1-2(0)",2};
    aStrength[11] = {0,0,0,0,"1-2(0)",2};
    aStrength[12] = {0,0,100,0,"1-2(0)",4};
    aStrength[13] = {0,0,100,0,"1-2(0)",4};
    aStrength[14] = {0,0,200,0,"1-2(0)",7};
    aStrength[15] = {0,0,200,0,"1-2(0)",7};
    aStrength[16] = {0,1,350,0,"1-3(0)",10};
    aStrength[17] = {1,1,500,0,"1-3(0)",13};
    aStrength[18] = {1,2,750,0,"1-3(0)",16};
    aStrength[19] = {3,7,4500,0,"7 in 8(3)",50};
    aStrength[20] = {3,8,5000,0,"7 in 8(3)",60};
    aStrength[21] = {4,9,6000,0,"9 in 10(4)",70};
    aStrength[22] = {4,10,7500,0,"11 in 12(4)",80};
    aStrength[23] = {5,11,9000,0,"11 in 12(5)",90};
    aStrength[24] = {6,12,12000,0,"19 in 20(7in8)",100};
    aStrength[25] = {7,14,15000,0,"23 in 24(9in10)",100};
    -- Deal with 18 01-100 strength
    aStrength[50] = {1,3,1000,0,"1-3(0)",20};
    aStrength[75] = {2,3,1250,0,"1-4(0)",25};
    aStrength[90] = {2,4,1500,0,"1-4(0)",30};
    aStrength[99] = {2,5,2000,0,"1-4(1)",35};
    aStrength[100] ={3,6,3000,0,"1-5(2)",40};

    -- aDexterity[abilityScore]={reaction, missile, defensive}
    aDexterity[1]  =  {-3,-3,4};
    aDexterity[2]  =  {-3,-3,4};
    aDexterity[3]  =  {-3,-3,4};
    aDexterity[4]  =  {-2,-2,3};
    aDexterity[5]  =  {-1,-1,2};
    aDexterity[6]  =  {0,0,1};
    aDexterity[7]  =  {0,0,0};
    aDexterity[8]  =  {0,0,0};
    aDexterity[9]  =  {0,0,0};
    aDexterity[10]  = {0,0,0};
    aDexterity[11]  = {0,0,0};
    aDexterity[12]  = {0,0,0};
    aDexterity[13]  = {0,0,0};
    aDexterity[14]  = {0,0,0};
    aDexterity[15]  = {0,0,-1};
    aDexterity[16]  = {1,1,-2};
    aDexterity[17]  = {2,2,-3};
    aDexterity[18]  = {3,3,-4};
    aDexterity[19]  = {3,3,-4};
    aDexterity[20]  = {3,3,-4};
    aDexterity[21]  = {4,4,-5};
    aDexterity[22]  = {4,4,-5};
    aDexterity[23]  = {4,4,-5};
    aDexterity[24]  = {5,5,-6};
    aDexterity[25]  = {5,5,-6};
    
    -- aWisdom[abilityScore]={magic adj, spell bonuses, spell failure, spell imm. }
    aWisdom[1]   =    {-3, "None", 20, "None"};
    aWisdom[2]   =    {-3, "None", 20, "None"};
    aWisdom[3]   =    {-3, "None", 20, "None"};
    aWisdom[4]   =    {-2, "None", 20, "None"};
    aWisdom[5]   =    {-1, "None", 20, "None"};
    aWisdom[6]   =    {-1, "None", 20, "None"};
    aWisdom[7]   =    {-1, "None", 20, "None"};
    aWisdom[8]   =    { 0, "None", 20, "None"};
    aWisdom[9]   =    { 0, "None", 20, "None"};
    aWisdom[10]  =    { 0, "None", 15, "None"};
    aWisdom[11]  =    { 0, "None", 10, "None"};
    aWisdom[12]  =    { 0, "None", 5, "None"};
    aWisdom[13]  =    { 0, "1x1", 0, "None"};
    aWisdom[14]  =    { 0, "2x1", 0, "None"};
    aWisdom[15]  =    { 1, "2x1,1x2", 0, "None"};
    aWisdom[16]  =    { 2, "2x2,2x2", 0, "None"};
    aWisdom[17]  =    { 3, "2x2,2x2,1x3", 0, "None"};
    aWisdom[18]  =    { 4, "Various", 0, "None"};
    aWisdom[19]  =    { 4, "Various", 0, "Various"};
    aWisdom[20]  =    { 4, "Various", 0, "Various"};
    aWisdom[21]  =    { 4, "Various", 0, "Various"};
    aWisdom[22]  =    { 4, "Various", 0, "Various"};
    aWisdom[23]  =    { 4, "Various", 0, "Various"};
    aWisdom[24]  =    { 4, "Various", 0, "Various"};
    aWisdom[25]  =    { 4, "Various", 0, "Various"};
    -- deal with long string bonus for tooltip
    aWisdom[118]  =    { 4, "Bonus Spells: 2x1st, 2x2nd, 1x3rd, 1x4th", 0, "None"};
    aWisdom[119]  =    { 4, "Bonus Spells: 3x1st, 2x2nd, 1x3rd, 2x4th", 0, "Spells: cause fear,charm person, command, friends, hypnotism"};
    aWisdom[120]  =    { 4, "Bonus Spells: 3x1st, 3x2nd, 1x3rd, 3x4th", 0, "Spells: cause fear,charm person, command, friends, hypnotism, forget, hold person, enfeeble, scare"};
    aWisdom[121]  =    { 4, "Bonus Spells: 3x1st, 3x2nd, 2x3rd, 3x4th, 1x5th", 0, "Spells: cause fear,charm person, command, friends, hypnotism, forget, hold person, enfeeble, scare, fear"};
    aWisdom[122]  =    { 4, "Bonus Spells: 3x1st, 3x2nd, 2x3rd, 4x4th, 2x5th", 0, "Spells: cause fear,charm person, command, friends, hypnotism, forget, hold person, enfeeble, scare, fear, charm monster, confusion, emotion, fumble, suggestion"};
    aWisdom[123]  =    { 4, "Bonus Spells: 3x1st, 3x2nd, 2x3rd, 4x4th, 4x5th", 0, "Spells: cause fear,charm person, command, friends, hypnotism, forget, hold person, enfeeble, scare, fear, charm monster, confusion, emotion, fumble, suggestion, chaos, feeblemind, hold monster,magic jar,quest"};
    aWisdom[124]  =    { 4, "Bonus Spells: 3x1st, 3x2nd, 2x3rd, 4x4th, 4x5th, 2x6th", 0, "Spells: cause fear,charm person, command, friends, hypnotism, forget, hold person, enfeeble, scare, fear, charm monster, confusion, emotion, fumble, suggestion, chaos, feeblemind, hold monster,magic jar,quest, geas, mass suggestion, rod of ruleship"};
    aWisdom[125]  =    { 4, "Bonus Spells: 3x1st, 3x2nd, 2x3rd, 4x4th, 4x5th, 3x6th, 1x7th", 0, "Spells: cause fear,charm person, command, friends, hypnotism, forget, hold person, enfeeble, scare, fear, charm monster, confusion, emotion, fumble, suggestion, chaos, feeblemind, hold monster,magic jar,quest, geas, mass suggestion, rod of ruleship, antipathy/sympath, death spell,mass charm"};

    -- aConstitution[abilityScore]={hp, system shock, resurrection survivial, poison save, regeneration}
    aConstitution[1]  =   {"-2",35,40,0,"None"};
    aConstitution[2]  =   {"-2",35,40,0,"None"};
    aConstitution[3]  =   {"-2",35,40,0,"None"};
    aConstitution[4]  =   {"-1",40,45,0,"None"};
    aConstitution[5]  =   {"-1",45,50,0,"None"};
    aConstitution[6]  =   {"-1",50,55,0,"None"};
    aConstitution[7]  =   {"0",55,60,0,"None"};
    aConstitution[8]  =   {"0",60,65,0,"None"};
    aConstitution[9]  =   {"0",65,70,0,"None"};
    aConstitution[10]  =  {"0",70,75,0,"None"};
    aConstitution[11]  =  {"0",75,80,0,"None"};
    aConstitution[12]  =  {"0",80,85,0,"None"};
    aConstitution[13]  =  {"0",85,90,0,"None"};
    aConstitution[14]  =  {"0",88,92,0,"None"};
    aConstitution[15]  =  {"1",91,94,0,"None"};
    aConstitution[16]  =  {"2",95,96,0,"None"};
    aConstitution[17]  =  {"2/3",97,98,0,"None"};
    aConstitution[18]  =  {"2/4",99,100,0,"None"};
    aConstitution[19]  =  {"5",99,100,1,"None"};
    aConstitution[20]  =  {"5",99,100,1,"1/6 turns"};
    aConstitution[21]  =  {"6",99,100,2,"1/5 turns"};
    aConstitution[22]  =  {"6",99,100,2,"1/4 turns"};
    aConstitution[23]  =  {"6",99,100,3,"1/3 turns"};
    aConstitution[24]  =  {"7",99,100,3,"1/2"};
    aConstitution[25]  =  {"7",100,100,4,"1 turn"};
    
    -- aCharisma[abilityScore]={Max # hench, loyalty, reaction afj}
    aCharisma[1]   =  {1, -30,-25};
    aCharisma[2]   =  {1, -30,-25};
    aCharisma[3]   =  {1, -30,-25};
    aCharisma[4]   =  {1, -25,-20};
    aCharisma[5]   =  {2, -20,-15};
    aCharisma[6]   =  {2, -15,-10};
    aCharisma[7]   =  {3, -10,-5};
    aCharisma[8]   =  {3, -5,0};
    aCharisma[9]   =  {4, 0, 0};
    aCharisma[10]  =  {4, 0, 0};
    aCharisma[11]  =  {4, 0, 0};
    aCharisma[12]  =  {5, 0, 0};
    aCharisma[13]  =  {5, 0, 5};
    aCharisma[14]  =  {6, 5, 10};
    aCharisma[15]  =  {7, 15, 15};
    aCharisma[16]  =  {8, 20, 25};
    aCharisma[17]  =  {10,30, 30};
    aCharisma[18]  =  {15,40, 35};
    aCharisma[19]  =  {20,50,40};
    aCharisma[20]  =  {25,60,45};
    aCharisma[21]  =  {30,70,50};
    aCharisma[22]  =  {35,80,55};
    aCharisma[23]  =  {40,90,60};
    aCharisma[24]  =  {45,100,65};
    aCharisma[25]  =  {50,100,70};
    
    -- aIntelligence[abilityScore]={# languages, spelllevel, learn spell, max spells, illusion immunity}
    aIntelligence[1]  =    {0, 0,0,  0,"None"};
    aIntelligence[2]  =    {0, 0,0,  0,"None"};
    aIntelligence[3]  =    {0, 0,0,  0,"None"};
    aIntelligence[4]  =    {0, 0,0,  0,"None"};
    aIntelligence[5]  =    {0, 0,0,  0,"None"};
    aIntelligence[6]  =    {0, 0,0,  0,"None"};
    aIntelligence[7]  =    {0, 0,0,  0,"None"};
    aIntelligence[8]  =    {1, 0,0,  0,"None"};
    aIntelligence[9]  =    {1, 4,35, 6,"None"};
    aIntelligence[10]  =   {2, 5,45, 7,"None"};
    aIntelligence[11]  =   {2, 5,45, 7,"None"};
    aIntelligence[12]  =   {3, 5,45, 7,"None"};
    aIntelligence[13]  =   {3, 6,55, 9,"None"};
    aIntelligence[14]  =   {4, 6,55, 9,"None"};
    aIntelligence[15]  =   {4, 7,65, 11,"None"};
    aIntelligence[16]  =   {5, 7,65, 11,"None"};
    aIntelligence[17]  =   {6, 8,75, 14,"None"};
    aIntelligence[18]  =   {7, 9, 85,18,"None"};
    aIntelligence[19]  =   {7, 11,95,"All","1st"};
    aIntelligence[20]  =   {7, 12,96,"All","1,2"};
    aIntelligence[21]  =   {7, 13,97,"All","1,2,3"};
    aIntelligence[22]  =   {7, 14,98,"All","1,2,3,4"};
    aIntelligence[23]  =   {7, 15,99,"All","1,2,3,4,5"};
    aIntelligence[24]  =   {7, 16,100,"All","1,2,3,4,5,6"};
    aIntelligence[25]  =   {7, 17,100,"All","1,2,3,4,5,6,7"};
    -- these have such long values we stuff them into tooltips instead
    aIntelligence[119]  =   {7, 11,95,"All","Level: 1st"};
    aIntelligence[120]  =   {7, 12,96,"All","Level: 1st, 2nd"};
    aIntelligence[121]  =   {7, 13,97,"All","Level: 1st, 2nd, 3rd"};
    aIntelligence[122]  =   {7, 14,98,"All","Level: 1st, 2nd, 3rd, 4th"};
    aIntelligence[123]  =   {7, 15,99,"All","Level: 1st, 2nd, 3rd, 4th, 5th"};
    aIntelligence[124]  =   {7, 16,100,"All","Level: 1st, 2nd, 3rd, 4th, 5th, 6th"};
    aIntelligence[125]  =   {7, 17,100,"All","Level: 1st, 2nd, 3rd, 4th, 5th, 6th, 7th"};



                      -- Death, Rod, Poly, Breath, Spell
    aWarriorSaves[0]  = {16,18,17,20,19};
    aWarriorSaves[1]  = {14,16,15,17,17};
    aWarriorSaves[2]  = {14,16,15,17,17};
    aWarriorSaves[3]  = {13,15,14,16,16};
    aWarriorSaves[4]  = {13,15,14,16,16};
    aWarriorSaves[5]  = {11,13,12,13,14};
    aWarriorSaves[6]  = {11,13,12,13,14};
    aWarriorSaves[7]  = {10,12,11,12,13};
    aWarriorSaves[8]  = {10,12,11,12,13};
    aWarriorSaves[9]  = {8,10,9,9,11};
    aWarriorSaves[10] = {8,10,9,9,11};
    aWarriorSaves[11] = {7,9,8,8,10};
    aWarriorSaves[12] = {7,9,8,8,10};
    aWarriorSaves[13] = {5,7,6,5,8};
    aWarriorSaves[14] = {5,7,6,5,8};
    aWarriorSaves[15] = {4,6,5,4,7};
    aWarriorSaves[16] = {4,6,5,4,7};
    aWarriorSaves[17] = {3,5,4,4,6};
    aWarriorSaves[18] = {3,5,4,4,6};
    aWarriorSaves[19] = {3,5,4,4,6};
    aWarriorSaves[20] = {3,5,4,4,6};
    aWarriorSaves[21] = {3,5,4,4,6};

                     -- Death, Rod, Poly, Breath, Spell
    aPriestSaves[0]  = {10,14,13,16,15};
    aPriestSaves[1]  = {10,14,13,16,15};
    aPriestSaves[2]  = {10,14,13,16,15};
    aPriestSaves[3]  = {10,14,13,16,15};
    aPriestSaves[4]  = {9,13,12,15,14};
    aPriestSaves[5]  = {9,13,12,15,14};
    aPriestSaves[6]  = {9,13,12,15,14};
    aPriestSaves[7]  = {7,11,10,13,12};
    aPriestSaves[8]  = {7,11,10,13,12};
    aPriestSaves[9]  = {7,11,10,13,12};
    aPriestSaves[10] = {6,10,9,12,11};
    aPriestSaves[11] = {6,10,9,12,11};
    aPriestSaves[12] = {6,10,9,12,11};
    aPriestSaves[13] = {5,9,8,11,10};
    aPriestSaves[14] = {5,9,8,11,10};
    aPriestSaves[15] = {5,9,8,11,10};
    aPriestSaves[16] = {4,8,7,10,9};
    aPriestSaves[17] = {4,8,7,10,9};
    aPriestSaves[18] = {4,8,7,10,9};
    aPriestSaves[19] = {2,6,5,8,7};
    aPriestSaves[20] = {2,6,5,8,7};
    aPriestSaves[21] = {2,6,5,8,7};

                     -- Death, Rod, Poly, Breath, Spell
    aWizardSaves[0]  = {14,11,13,15,12};
    aWizardSaves[1]  = {14,11,13,15,12};
    aWizardSaves[2]  = {14,11,13,15,12};
    aWizardSaves[3]  = {14,11,13,15,12};
    aWizardSaves[4]  = {14,11,13,15,12};
    aWizardSaves[5]  = {14,11,13,15,12};
    aWizardSaves[6]  = {13,9,11,13,10};
    aWizardSaves[7]  = {13,9,11,13,10};
    aWizardSaves[8]  = {13,9,11,13,10};
    aWizardSaves[9]  = {13,9,11,13,10};
    aWizardSaves[10] = {13,9,11,13,10};
    aWizardSaves[11] = {11,7,9,11,8};
    aWizardSaves[12] = {11,7,9,11,8};
    aWizardSaves[13] = {11,7,9,11,8};
    aWizardSaves[14] = {11,7,9,11,8};
    aWizardSaves[15] = {11,7,9,11,8};
    aWizardSaves[16] = {10,5,7,9,6};
    aWizardSaves[17] = {10,5,7,9,6};
    aWizardSaves[18] = {10,5,7,9,6};
    aWizardSaves[19] = {10,5,7,9,6};
    aWizardSaves[20] = {10,5,7,9,6};
    aWizardSaves[21] = {8,3,5,7,4};

                    -- Death, Rod, Poly, Breath, Spell
    aRogueSaves[0]  = {13,14,12,16,15};
    aRogueSaves[1]  = {13,14,12,16,15};
    aRogueSaves[2]  = {13,14,12,16,15};
    aRogueSaves[3]  = {13,14,12,16,15};
    aRogueSaves[4]  = {13,14,12,16,15};
    aRogueSaves[5]  = {12,12,11,15,12};
    aRogueSaves[6]  = {12,12,11,15,12};
    aRogueSaves[7]  = {12,12,11,15,12};
    aRogueSaves[8]  = {12,12,11,15,12};
    aRogueSaves[9]  = {11,10,10,14,11};
    aRogueSaves[10] = {11,10,10,14,11};
    aRogueSaves[11] = {11,10,10,14,11};
    aRogueSaves[12] = {11,10,10,14,11};
    aRogueSaves[13] = {10,8,9,13,9};
    aRogueSaves[14] = {10,8,9,13,9};
    aRogueSaves[15] = {10,8,9,13,9};
    aRogueSaves[16] = {10,8,9,13,9};
    aRogueSaves[17] = {9,6,8,12,7};
    aRogueSaves[18] = {9,6,8,12,7};
    aRogueSaves[19] = {9,6,8,12,7};
    aRogueSaves[20] = {9,6,8,12,7};
    aRogueSaves[21] = {8,4,7,11,5};
    
end
