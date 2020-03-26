-- 
-- 
-- 
--
-- what version of AD&D is this
coreVersion = "1e";

-- ability scores 
aStrength = {};
aDexterity = {};
aWisdom = {};
aConstitution = {};
aCharisma = {};
aIntelligence = {};

-- required for npcs, base save table
aWarriorSaves = {};

-- required for npcs, hit matrix when used
aMatrix = {};

function onInit()
  DataCommonADND.coreVersion = coreVersion;

  -- default initiative dice size 
  DataCommonADND.nDefaultInitiativeDice = 6;
  
  DataCommonADND.aDefaultSurpriseDice = {"d6"};
  
  -- default coin weight, 10 coins = 1 pound, 1e, ouch
  DataCommonADND.nDefaultCoinWeight = 0.1;
  
  -- aStrength[abilityScore]={hit adj, dam adj, weight allow, max press, open doors, bend bars}
  aStrength[1]  = {-3,-1,-350,0,"1(0)",0,2,3,4,5,7};
  aStrength[2]  = {-3,-1,-350,0,"1(0)",0,2,3,4,5,7};
  aStrength[3]  = {-3,-1,-350,0,"1(0)",0,2,3,4,5,7};
  aStrength[4]  = {-2,-1,-250,0,"1(0)",0,11,14,17,20,25};
  aStrength[5]  = {-2,-1,-250,0,"1(0)",0,11,14,17,20,25};
  aStrength[6]  = {-1,0,-150,0,"1(0)",0,21,30,39,47,55};
  aStrength[7]  = {-1,0,-150,0,"1(0)",0,21,30,39,47,55};
  aStrength[8]  = {0,0,0,0,"1-2(0)",1,36,51,66,81,90};
  aStrength[9]  = {0,0,0,0,"1-2(0)",1,36,51,66,81,90};
  aStrength[10] = {0,0,0,0,"1-2(0)",2,41,59,77,97,110};
  aStrength[11] = {0,0,0,0,"1-2(0)",2,41,59,77,97,110};
  aStrength[12] = {0,0,100,0,"1-2(0)",4,46,70,94,118,140};
  aStrength[13] = {0,0,100,0,"1-2(0)",4,46,70,94,118,140};
  aStrength[14] = {0,0,200,0,"1-2(0)",7,56,86,116,146,170};
  aStrength[15] = {0,0,200,0,"1-2(0)",7,56,86,116,146,170};
  aStrength[16] = {0,1,350,0,"1-3(0)",10,71,101,131,161,195};
  aStrength[17] = {1,1,500,0,"1-3(0)",13,71,101,131,161,195};
  aStrength[18] = {1,2,750,0,"1-3(0)",16 ,111,150,189,228,255};
  aStrength[19] = {3,7,4500,0,"7 in 8(3)",50,486,500,550,600,640};
  aStrength[20] = {3,8,5000,0,"7 in 8(3)",60,536,580,610,670,700};
  aStrength[21] = {4,9,6000,0,"9 in 10(4)",70,636,680,720,790,810};
  aStrength[22] = {4,10,7500,0,"11 in 12(4)",80,786,830,870,900,970};
  aStrength[23] = {5,11,9000,0,"11 in 12(5)",90 ,936,960,1000,1090,1130};
  aStrength[24] = {6,12,12000,0,"19 in 20(7in8)",100 ,1236,1290,1300,1380,1440};
  aStrength[25] = {7,14,15000,0,"23 in 24(9in10)",100,1536,1590,1600,1680,1750};
  -- Deal with 18 01-100 strength
  aStrength[50] = {1,3,1000,0,"1-3(0)",20,136,175,214,253,280};
  aStrength[75] = {2,3,1250,0,"1-4(0)",25,161,200,239,278,305};
  aStrength[90] = {2,4,1500,0,"1-4(0)",30,186,225,264,303,330};
  aStrength[99] = {2,5,2000,0,"1-4(1)",35,236,275,314,353,380};
  aStrength[100] ={3,6,3000,0,"1-5(2)",40,336,375,414,453,480};
 -- make sure the ruleset uses the same
 DataCommonADND.aStrength=aStrength; 

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
 -- make sure the ruleset uses the same
 DataCommonADND.aDexterity=aDexterity; 
    
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
 -- make sure the ruleset uses the same
 DataCommonADND.aWisdom=aWisdom; 

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
  -- make sure the ruleset uses the same
  DataCommonADND.aConstitution=aConstitution; 
    
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
  -- make sure the ruleset uses the same
  DataCommonADND.aCharisma=aCharisma; 
    
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
  -- make sure the ruleset uses the same
  DataCommonADND.aIntelligence=aIntelligence; 


  -- this needs to stick around for NPC save values
  -- since they use the warrior table
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

 -- make sure the ruleset uses the same
 DataCommonADND.aWarriorSaves=aWarriorSaves; 
 
 -- matrix style hit table for monsters
-- AC 10 .. -10  
-- -1      = 11,12,13,14,15,16,17,18,19,20,20,20,20,20,20,21,22,23,24,25,26 
 -- 0      = 10,11,12,13,14,15,16,17,18,19,20,20,20,20,20,20,21,22,23,24,25
 -- 1      = 9,10,11,12,13,14,15,16,17,18,19,20,20,20,20,20,20,21,22,23,24
 -- 1+     = 8,9,10,11,12,13,14,15,16,17,18,19,20,20,20,20,20,20,21,22,23
 -- 2-3+   = 6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20,20,20,20,20,21
 -- 4-5+   = 5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20,20,20,20,20
 -- 6-7+   = 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20,20,20
 -- 8-9+   = 2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20,20
 -- 10-11+ = 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
 -- 12-13+ = -1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
 -- 14-15+ = -2,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18
 -- 16+    = -3,-2,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17

 aMatrix['-1']  = {11,12,13,14,15,16,17,18,19,20,20,20,20,20,20,21,22,23,24,25,26}; -- below 1-1
 aMatrix['1-1'] = {10,11,12,13,14,15,16,17,18,19,20,20,20,20,20,20,21,22,23,24,25}; -- 1-1
 aMatrix['1']   = {9,10,11,12,13,14,15,16,17,18,19,20,20,20,20,20,20,21,22,23,24};  
 aMatrix['1+']  = {8,9,10,11,12,13,14,15,16,17,18,19,20,20,20,20,20,20,21,22,23};   -- 1+X
 aMatrix['2']   = {6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20,20,20,20,20,21};
 aMatrix['3']   = {6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20,20,20,20,20,21};
 aMatrix['4']   = {5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20,20,20,20,20};
 aMatrix['5']   = {5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20,20,20,20,20};
 aMatrix['6']   = {3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20,20,20};
 aMatrix['7']   = {3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20,20,20};
 aMatrix['8']   = {2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20,20};
 aMatrix['9']   = {2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,20,20};
 aMatrix['10']  = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
 aMatrix['11']  = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
 aMatrix['12']  = {-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19};
 aMatrix['13']  = {-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19};
 aMatrix['14']  = {-2,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18};
 aMatrix['15']  = {-2,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18};
 aMatrix['16']  = {-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17};   

 -- now make sure the ruleset uses the same matrix
 DataCommonADND.aMatrix=aMatrix; 
end
