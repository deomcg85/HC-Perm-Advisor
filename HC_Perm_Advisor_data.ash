// ============================================================
//  HC_Perm_Advisor_data.ash
//  Skill database for the Hardcore Skill Perm Advisor.
//  Auto-loaded by HC_Perm_Advisor.ash via import.
//
//  To add or edit skills, modify this file only.
//  Do not run this file directly.
// ============================================================

// ============================================================
//  HC_Perm_Advisor.ash  v4
//  Based on: The Ascension Speed Show's Hardcore Standard
//  Perm Tier List (Updated 09-JAN-25)
//  by Aenimus (#2273519) & Lyft (#3045223)
//
//  USAGE:
//    call HC_Perm_Advisor.ash              -> category menu
//    call HC_Perm_Advisor.ash top          -> global top 5 by priority
//    call HC_Perm_Advisor.ash all          -> full list grouped by category
//    call HC_Perm_Advisor.ash 5            -> top skills for +Item% (by number)
//    call HC_Perm_Advisor.ash item         -> top skills for +Item% (by keyword)
//
//  KEYWORDS:
//    auto  essentials  near  turngen  substats  item
//    survive  misc  mp  meat  init  marginal  unrestricted
// ============================================================

record SkillData {
    string kol_name;
    string display_name;
    string category;
    int    priority;
    string how_to_get;
    string notes;
};

SkillData[int] skill_db;
int db_count = 0;

void add(string kname, string dname, string cat, int pri,
         string htg, string why) {
    SkillData sd;
    sd.kol_name     = kname;
    sd.display_name = dname;
    sd.category     = cat;
    sd.priority     = pri;
    sd.how_to_get   = htg;
    sd.notes        = why;
    skill_db[db_count] = sd;
    db_count += 1;
}

void build_skill_db() {

    // 0.5. Auto-perms (priority -10 to -5)
    // These skills HC-perm themselves automatically when used,
    // or are obtained through special non-ascension routes.
    add("Transcendent Olfaction", "Transcendent Olfaction",
        "0.5. Auto-perms", -10,
        "Buy the Manual of Transcendent Olfaction from the Bounty Hunter Hunter Shack for 200 filthy lucre. Farm daily bounties -- expect 2-3 months.",
        "One of the best skills in the game. Queues 3 copies of a monster and makes them ignore queue rejection. Saves countless turns every run."
    );
    add("Thick-Skinned", "Thick-Skinned",
        "0.5. Auto-perms", -9,
        "Farm PvP fights daily to earn 2,000 swagger, then buy How to Tolerate Jerks from the PvP store. Takes ~1 month. Auto-HC perms itself.",
        "+10 max HP AND +10 max MP. Underrated. Helps survivability AND reaching MP for key buffs. Auto-HC perms -- never need to think about it again."
    );
    add("20/20 Vision", "20/20 Vision",
        "0.5. Auto-perms", -8,
        "Buy the do-it-yourself laser eye surgery kit from the mall (Old Raffle prize, ~29,000,000 meat). Auto-HC perms itself.",
        "+10% item (passive). Expensive for the bonus but auto-HC perms itself permanently."
    );
    add("Chip on your Shoulder", "Chip on your Shoulder",
        "0.5. Auto-perms", -7,
        "Farm PvP fights to earn 3,000 swagger, then buy How to Hold a Grudge from the PvP store. Takes 1+ months.",
        "+5 rollover PvP fights/day. Marginally helps you earn swagger for better PvP skills faster."
    );
    add("Brain Games", "Brain Games",
        "0.5. Auto-perms", -6,
        "Buy the electronic Brain Trainer game from the mall (Old Raffle prize, ~180,000,000 meat).",
        "+3 rollover adventures/day. Very expensive. Low priority unless you have excess meat."
    );
    add("Request Sandwich", "Request Sandwich",
        "0.5. Auto-perms", -5,
        "Obtain the note from Clancy as a reward from multiple Avatar of Boris ascensions.",
        "Summons a P.B.L.T. (2.66 adv/fullness, 50% success rate). Marginal at best. Requires significant AoB investment."
    );

    // 1. Essentials (main ascension order 1-22)
    add("Pastamastery", "Pastamastery",
        "1. Essentials", 1,
        "Play a Pastamancer (PM) run. Skill unlocks at Level 5.",
        "Summons 3 dry noodles/day. Core turn gen via pasta dishes, especially combined with scrumptious reagent ingredients."
    );
    add("Superhuman Cocktailcrafting", "Superhuman Cocktailcrafting",
        "1. Essentials", 2,
        "Play a Disco Bandit (DB) run. Skill unlocks at Level 15. Perm this BEFORE Advanced Cocktailcrafting so you get Nash Crosby Still access immediately in the next run.",
        "Summons +2 AC ingredients/day. Unlocks Nash Crosby Still as a Moxie class -- gives Superhuman cocktails and cheap MP via soda water to tonic water."
    );
    add("Advanced Cocktailcrafting", "Advanced Cocktailcrafting",
        "1. Essentials", 3,
        "Play a Disco Bandit (DB) run. Skill unlocks at Level 5. Do this immediately after perming Superhuman Cocktailcrafting.",
        "Summons 3 garnishes/day. Enables fancy tavern swills and better booze. Synergizes with the hippy store and bottles of rum from the pirates."
    );
    add("The Ode to Booze", "Ode to Booze",
        "1. Essentials", 4,
        "Play an Accordion Thief (AT) run. Skill unlocks at Level 12. Requires 50 max MP to cast -- ensure you can reach that before this ascension.",
        "+1 adventure per potency of booze drunk including nightcaps. Roughly 14+ free turns/day. One of the biggest single turn-gen skills available."
    );
    add("The Magical Mojomuscular Melody", "Magical Mojomuscular Melody",
        "1. Essentials", 5,
        "Play an Accordion Thief (AT) run. Skill unlocks at Level 2. Do this run IMMEDIATELY after perming Ode so you can use Ode during this ascension.",
        "+10 Mysticality and +20 max MP. Makes it possible to cast Ode and other high-MP buffs. Essential infrastructure for the whole perm journey."
    );
    add("Advanced Saucecrafting", "Advanced Saucecrafting",
        "1. Essentials", 6,
        "Play a Sauceror (SA) run. Skill unlocks at Level 5.",
        "Summons 3 scrumptious reagents/day. Enables Milk of Magnesium (+5 adv/day), saucy pasta, and buff potions such as tomato juice of powerful power."
    );
    add("Smooth Movements", "Smooth Movements",
        "1. Essentials", 7,
        "Play a Disco Bandit (DB) run. Skill unlocks at Level 14.",
        "-5% combat rate. Speeds up the vast majority of quests. Mutually exclusive with Musk of the Moose."
    );
    add("The Sonata of Sneakiness", "Sonata of Sneakiness",
        "1. Essentials", 8,
        "Play an Accordion Thief (AT) run. Skill unlocks at Level 13.",
        "-5% combat rate as an AT Song. Stack with Smooth Movements for -10% total."
    );
    add("Saucemaven", "Saucemaven",
        "1. Essentials", 9,
        "Play a Sauceror (SA) run. Skill unlocks at Level 11.",
        "+3 adventures per saucy food (+5 if Mysticality class). Better the more saucy food you eat daily."
    );
    add("The Way of Sauce", "The Way of Sauce",
        "1. Essentials", 10,
        "Play a Sauceror (SA) run. Skill unlocks at Level 15.",
        "+2 scrumptious reagents/day plus unlocks additional recipes. More Milk of Magnesium and more saucy food per day."
    );
    add("Expert Corner-Cutter", "Expert Corner-Cutter",
        "1. Essentials", 11,
        "Play a Disco Bandit (DB) run. Skill unlocks at Level 9. NOTE: The DB class version is Standard-legal. The LyleCo Contractor Manual version is Out of Standard 2025.",
        "Saves 1 turn per 5 crafting actions. Very valuable if you craft food, booze, and reagents every day."
    );
    add("Torso Awareness", "Torso Awareness",
        "4. Substats", 12,
        "Use the Gnome Moxie moon sign (Fragnk, the Regnaissance Gnome) when ascending, OR complete the Melvign the Gnome quest in-run. Any class can do the Melvign quest.",
        "+3 substats/combat by enabling the astral shirt slot. THE best astral pet for few-skill runs -- shirt gives substats, DA, and prismatic damage."
    );
    add("Curse of Weaksauce", "Curse of Weaksauce",
        "6. Survivability", 13,
        "Play a Sauceror (SA) run. Skill unlocks at Level 12.",
        "Delevels monster ~3% of original Attack per round. Bread-and-butter combat skill. Combine with Itchy Curse Finger for free stagger rounds."
    );
    add("Drescher's Annoying Noise", "Drescher's Annoying Noise",
        "4. Substats", 14,
        "Buy the spellbook from the Dungeoneer Association Vending Machine (Daily Dungeon area) or the mall. Check current pricing.",
        "+10 ML (3.33 substats/combat). Lasts 20 turns. High ML is harder to survive -- start low and increase gradually."
    );
    add("Tongue of the Walrus", "Tongue of the Walrus",
        "6. Survivability", 15,
        "Play a Seal Clubber (SC) run. Skill unlocks at Level 9.",
        "Heals 30-40 HP and cures Beaten Up. Better than Cocoon early when max HP is still low."
    );
    add("Mad Looting Skillz", "Mad Looting Skillz",
        "5. +Item%", 16,
        "Play a Disco Bandit (DB) run. Skill unlocks at Level 8.",
        "+20% item drops (passive). The highest passive +item% in the game."
    );
    add("Fat Leon's Phat Loot Lyric", "Fat Leon's Phat Loot Lyric",
        "5. +Item%", 17,
        "Play an Accordion Thief (AT) run. Skill unlocks at Level 7.",
        "+20% item drops as an AT Song. Stack with Mad Looting Skillz for a large total item bonus."
    );
    add("Grab a Cold One", "Grab a Cold One",
        "3. Turn-Gen", 18,
        "Dread skill -- from The Machine in Dreadsylvania. Requires a Skull Capacitor (~3,500,000 meat, 3 uses). Need a Disco Bandit AND Seal Clubber in the same Dread run.",
        "Summons a Cold One daily (up to 6 adventures at level 11). Excellent filler booze."
    );
    add("Spaghetti Breakfast", "Spaghetti Breakfast",
        "3. Turn-Gen", 19,
        "Dread skill -- from The Machine in Dreadsylvania. Requires a Skull Capacitor (~3,500,000 meat, 3 uses). Need a Pastamancer AND Sauceror in the same Dread run.",
        "Summons a Spaghetti Breakfast daily (up to 6 adventures at level 11). Must be the FIRST food eaten each day."
    );
    add("Saucestorm", "Saucestorm",
        "6. Survivability", 20,
        "Play a Sauceror (SA) run. Skill unlocks at Level 5.",
        "Deals cold + hot damage (~50 cap each, rolled separately). Cheap bread-and-butter combat spell for early-to-mid levels."
    );
    add("Ur-Kel's Aria of Annoyance", "Ur-Kel's Aria of Annoyance",
        "4. Substats", 21,
        "Play an Accordion Thief (AT) run. Skill unlocks at Level 15.",
        "+level*2 ML (e.g. +18 ML at level 9). Scales -- add a little at a time."
    );
    add("Tao of the Terrapin", "Tao of the Terrapin",
        "6. Survivability", 22,
        "Play a Turtle Tamer (TT) run. Skill unlocks at Level 15.",
        "Doubles the power of hats and pants for Damage Absorption. Vastly improves survivability at all stages of the game."
    );

    // 2. Near-Essentials (30-39)
    add("Cannelloni Cocoon", "Cannelloni Cocoon",
        "2. Near-Essentials", 30,
        "Play a Pastamancer (PM) run. Skill unlocks at Level 12.",
        "Full heal to max HP. Better than Tongue for seasoned players with higher max HP."
    );
    add("Amphibian Sympathy", "Amphibian Sympathy",
        "2. Near-Essentials", 31,
        "Play a Turtle Tamer (TT) run. Skill unlocks at Level 5.",
        "+5 familiar weight. Roughly +10% item, +1 stats, or +20% meat depending on familiar."
    );
    add("Itchy Curse Finger", "Itchy Curse Finger",
        "2. Near-Essentials", 32,
        "Play a Sauceror (SA) run. Skill unlocks at Level 8.",
        "Makes curses stagger (no round spent). Dramatically improves Curse of Weaksauce. Useless without Weaksauce."
    );
    add("Musk of the Moose", "Musk of the Moose",
        "2. Near-Essentials", 33,
        "Play a Seal Clubber (SC) run. Skill unlocks at Level 14.",
        "+5% combat. Use when hunting specific monsters. Mutually exclusive with Smooth Movements."
    );
    add("Carlweather's Cantata of Confrontation", "Cantata of Confrontation",
        "2. Near-Essentials", 34,
        "Play an Accordion Thief (AT) run. Skill unlocks at Level 14.",
        "+5% combat as an AT Song. Use when hunting specific monsters."
    );

    // 3. Turn-Gen / Savings (40-49)
    add("Transcendental Noodlecraft", "Transcendental Noodlecraft",
        "3. Turn-Gen", 40,
        "Play a Pastamancer (PM) run. Skill unlocks at Level 15.",
        "+2 dry noodles/day plus additional recipes. Useful but involves multiple cooking steps."
    );
    add("The Long View", "The Long View",
        "3. Turn-Gen", 41,
        "Play a Turtle Tamer (TT) run. Skill unlocks at Level 12.",
        "+3 rollover adventures/day. Gets less valuable as runs get faster -- no benefit on Day 1."
    );
    add("Super-Advanced Meatsmithing", "Super-Advanced Meatsmithing",
        "3. Turn-Gen", 42,
        "Play a Seal Clubber (SC) run. Skill unlocks at Level 5.",
        "Enables crafting a chrome weapon, which gives +3 rollover adventures per day."
    );

    // 4. Substats (50-59, beyond ascension order)
    add("Aloysius' Antiphon of Aptitude", "Antiphon of Aptitude",
        "4. Substats", 50,
        "Play an Accordion Thief (AT) run. Skill unlocks at Level 11.",
        "+1 to all three substats per fight. Better than facial expressions but expensive at 40 MP."
    );
    add("Pride of the Puffin", "Pride of the Puffin",
        "4. Substats", 51,
        "Play a Seal Clubber (SC) run. Skill unlocks at Level 15.",
        "+10 ML (3.33 substats/combat). Consider after survivability is solid."
    );
    add("Knowing Smile", "Knowing Smile (Moxie facial expression)",
        "4. Substats", 52,
        "Play an Accordion Thief (AT) run. Skill unlocks at Level 14. Alternatives: Patient Smile (Muscle) = TT Lv14, Wry Smile (Mysticality) = SA Lv13.",
        "+1 Moxie substat/combat. Perm whichever matches your most-played mainstat first. Facial expressions are mutually exclusive."
    );
    add("Slimy Sinews", "Slimy Sinews",
        "4. Substats", 53,
        "Fight Mother Slime in the Slime Tube to collect slime-soaked hypophysis drops. Each drop upgrades the skill +2 max HP, caps at 10 upgrades. Glands can be costly.",
        "+20 max HP total at max upgrades. Flat +HP is excellent early on when every HP counts."
    );

    // 5. +Item% (60-69)
    add("Singer's Faithful Ocelot", "Singer's Faithful Ocelot",
        "5. +Item%", 60,
        "Buy the spellbook from the Dungeoneer Association Vending Machine (~15 fat loot tokens from Daily Dungeon) or the mall (~200,000 meat).",
        "+10% item as a TT Buff (10 turns, 15 MP). Manageable cost for a solid item bonus."
    );
    add("Leash of Linguini", "Leash of Linguini",
        "5. +Item%", 61,
        "Play a Pastamancer (PM) run. Skill unlocks at Level 11.",
        "+5 familiar weight. Roughly +10% item with a fairy-type familiar."
    );
    add("Thief Among the Honorable", "Thief Among the Honorable",
        "5. +Item%", 62,
        "Play an Accordion Thief (AT) run. Skill unlocks at Level 10.",
        "+5% item AND +10% meat in one passive. Good double value."
    );
    add("Empathy of the Newt", "Empathy of the Newt",
        "5. +Item%", 63,
        "Play a Turtle Tamer (TT) run. Skill unlocks at Level 8.",
        "+5 familiar weight. MP expensive for what it gives but helpful across many familiar types."
    );
    add("Sensitive Fingers", "Sensitive Fingers",
        "5. +Item%", 64,
        "Play a Disco Bandit (DB) run. Skill unlocks at Level 14.",
        "+10% pickpocket chance. Like ~100% item if you win initiative. Very useful on Moxie-class runs."
    );
    add("Master Accordion Master Thief", "Master Accordion Master Thief",
        "5. +Item%", 65,
        "Play an Accordion Thief (AT) run. Skill unlocks at Level 13.",
        "+10% pickpocket chance. Pairs with Sensitive Fingers for reliable pickpocketing."
    );
    add("Natural Born Scrabbler", "Natural Born Scrabbler",
        "5. +Item%", 66,
        "Buy Hodgman Journal #1: The Lean Times from the mall (~5,000,000 meat).",
        "+5% item (passive). Expensive for the bonus."
    );

    // 6. Survivability (70-79, beyond ascension order)
    add("Skin of the Leatherback", "Skin of the Leatherback",
        "6. Survivability", 70,
        "Play a Turtle Tamer (TT) run. Skill unlocks at Level 2.",
        "Passive Damage Reduction equal to level/2. DR is generally better than DA early on."
    );
    add("Hide of the Walrus", "Hide of the Walrus",
        "6. Survivability", 71,
        "Play a Seal Clubber (SC) run. Skill unlocks at Level 7.",
        "+50 Damage Absorption (passive). Always on, no MP cost."
    );
    add("Astral Shell", "Astral Shell",
        "6. Survivability", 72,
        "Play a Turtle Tamer (TT) run. Skill unlocks at Level 12.",
        "+80 DA and +1 prismatic elemental resistance. One of the best all-round survivability buffs."
    );
    add("Elemental Saucesphere", "Elemental Saucesphere",
        "6. Survivability", 73,
        "Play a Sauceror (SA) run. Skill unlocks at Level 4.",
        "+2 prismatic elemental resistance. Helps with Haunted Kitchen, A-boo Peak, Level 13 tests."
    );
    add("Ghostly Shell", "Ghostly Shell",
        "6. Survivability", 74,
        "Play a Turtle Tamer (TT) run. Skill unlocks at Level 4.",
        "+80 Damage Absorption for cheap. Good early DA."
    );
    add("Spirit of Ravioli", "Spirit of Ravioli",
        "6. Survivability", 75,
        "Play a Pastamancer (PM) run. Skill unlocks at Level 9.",
        "+25% max HP (passive). The highest passive percent max HP in the game."
    );
    add("Conspiratorial Whispers", "Conspiratorial Whispers",
        "6. Survivability", 76,
        "Dread skill -- from The Machine in Dreadsylvania. Requires a Skull Capacitor (~3,500,000 meat, 3 uses). Need a Turtle Tamer AND Disco Bandit in the same run.",
        "Instant cast. Delevels and damages every round based on familiar weight. Self-staggers without needing a separate skill."
    );
    add("Tolerance of the Kitchen", "Tolerance of the Kitchen",
        "6. Survivability", 77,
        "Play a Sauceror (SA) run. Skill unlocks at Level 13.",
        "+2 hot resistance. Speeds up the Haunted Kitchen. Helps vs friar demons and Level 13."
    );
    add("Diminished Gag Reflex", "Diminished Gag Reflex",
        "6. Survivability", 78,
        "Play a Sauceror (SA) run. Skill unlocks at Level 13.",
        "+2 stench resistance. Speeds up Haunted Kitchen alongside hot resistance."
    );
    add("Northern Exposure", "Northern Exposure",
        "6. Survivability", 79,
        "Play a Seal Clubber (SC) run. Skill unlocks at Level 13.",
        "+2 cold resistance. Helps survive A-boo Clues and Mt. McLargeHuge without the eXtreme outfit."
    );

    // 7. Misc (80-82)
    add("Mariachi Memory", "Mariachi Memory",
        "7. Misc", 80,
        "Play an Accordion Thief (AT) run. Skill unlocks at Level 15.",
        "Allows +1 extra AT Song in your head. Very useful once you have many AT Songs permed."
    );
    add("Flavour of Magic", "Flavour of Magic",
        "7. Misc", 81,
        "Play a Pastamancer (PM) run. Skill unlocks at Level 14.",
        "Tunes PM spells to specific elements. +10 flat spell damage. Key for the Blech House NC and elemental vulnerabilities."
    );
    add("Pulverize", "Pulverize",
        "7. Misc", 82,
        "Play a Seal Clubber (SC) run. Skill unlocks at Level 15. Requires a meat-tenderizing hammer (1,000 meat) to use.",
        "Smash items into nuggets. Some items are worth more smashed than sold whole."
    );

    // 8. Max MP (83-89)
    add("Wisdom of the Elder Tortoises", "Wisdom of the Elder Tortoises",
        "8. Max MP", 83,
        "Play a Turtle Tamer (TT) run. Skill unlocks at Level 11.",
        "+50% max MP. Huge percentage bonus, especially valuable early in runs."
    );
    add("Slimy Synapses", "Slimy Synapses",
        "8. Max MP", 84,
        "Fight Mother Slime in the Slime Tube to collect slime-soaked brain drops. Each drop upgrades skill +1 max MP, caps at 10 upgrades. Glands can be costly.",
        "+10 max MP total at max upgrades. Flat +MP is best early when it matters for casting buffs."
    );
    add("Blood Sugar Sauce Magic", "Blood Sugar Sauce Magic",
        "8. Max MP", 85,
        "Play a Sauceror (SA) run. Skill unlocks at Level 15.",
        "+10% max MP (-10% max HP), or 30%/-30% as SA. Toggleable -- turn on for MP, off when you need HP."
    );

    // 9. +Meat% (90-99)
    add("The Polka of Plenty", "Polka of Plenty",
        "9. +Meat%", 90,
        "Play an Accordion Thief (AT) run. Skill unlocks at Level 5.",
        "+50% meat as an AT Song. Run most of the run for significantly more end-of-run meat."
    );
    add("Nimble Fingers", "Nimble Fingers",
        "9. +Meat%", 91,
        "Play a Disco Bandit (DB) run. Skill unlocks at Level 6.",
        "+20% meat (passive). The highest passive +meat% in the game."
    );
    add("Five Finger Discount", "Five Finger Discount",
        "9. +Meat%", 92,
        "Play an Accordion Thief (AT) run. Skill unlocks at Level 7.",
        "5% discount at all NPC stores. Saves a meaningful amount over a full run."
    );
    add("Inner Sauce", "Inner Sauce",
        "9. +Meat%", 93,
        "Play a Sauceror (SA) run. Skill unlocks at Level 4.",
        "+1 MP regen/adventure (3-4 for SA). Saves ~9 meat/adventure in MP costs."
    );
    add("Expert Panhandling", "Expert Panhandling",
        "9. +Meat%", 94,
        "Play a Sauceror (SA) run. Skill unlocks at Level 3.",
        "+10-15% meat (+15% with a saucepan equipped)."
    );
    add("Thrift and Grift", "Thrift and Grift",
        "9. +Meat%", 95,
        "Buy Hodgman Journal #2: Entrepreneurythmics from the mall (~2,000,000 meat).",
        "+10% meat. Will eventually pay for itself over many runs."
    );

    // 10. +Init% (100-109)
    add("Springy Fusilli", "Springy Fusilli",
        "10. +Init%", 100,
        "Play a Pastamancer (PM) run. Skill unlocks at Level 6.",
        "+40% initiative (10 turns, 10 MP). Cheap enough to outvalue passive initiative."
    );
    add("Overdeveloped Sense of Self Preservation", "Overdeveloped Sense of Self Preservation",
        "10. +Init%", 101,
        "Play a Disco Bandit (DB) run. Skill unlocks at Level 2.",
        "+20% initiative (passive). Always-on with no MP cost."
    );
    add("Cletus's Canticle of Celerity", "Canticle of Celerity",
        "10. +Init%", 102,
        "Play an Accordion Thief (AT) run. Skill unlocks at Level 3.",
        "+20% initiative as an AT Song (5+ turns, 4 MP). Very cheap to cast."
    );
    add("Walberg's Dim Bulb", "Walberg's Dim Bulb",
        "10. +Init%", 103,
        "Buy the spellbook from the Dungeoneer Association Vending Machine (~15 fat loot tokens) or the mall (~200,000 meat).",
        "+10% initiative (10 turns, 5 MP). Cheap addition to other initiative sources."
    );

    // 11. Marginal (110+)
    add("Abs of Tin", "Abs of Tin",
        "11. Marginal", 110,
        "Buy Hodgman Journal #3: Pumping Tin from the mall (~800,000 meat).",
        "+10% max HP. Cheap enough to be worth picking up eventually."
    );
    add("Marginally Insane", "Marginally Insane",
        "11. Marginal", 111,
        "Buy Hodgman Journal #4: View From The Big Top from the mall (~1,000,000 meat).",
        "+10% max MP. Flat +max MP is better early but this is cheap enough to be worthwhile later."
    );
    add("Ambidextrous Funkslinging", "Ambidextrous Funkslinging",
        "11. Marginal", 112,
        "Play a Disco Bandit (DB) run. Skill unlocks at Level 12.",
        "Lets you use up to two items per combat round. Quality-of-life passive. Helps against the Shadow and for flyering."
    );
    add("Disco Nap", "Disco Nap",
        "11. Marginal", 113,
        "Play a Disco Bandit (DB) run. Skill unlocks at Level 3.",
        "Heals 20 HP, removes certain debuffs, and allows one free campsite rest per day. Free rests restore MP and clear Beaten Up."
    );
    add("Adventurer of Leisure", "Adventurer of Leisure",
        "11. Marginal", 114,
        "Play a Disco Bandit (DB) run. Skill unlocks at Level 3. Requires Disco Nap.",
        "Disco Nap now heals 40 HP and grants 2 additional free campsite rests per day. Useful for restoring MP or clearing Beaten Up."
    );
    add("Armorcraftiness", "Armorcraftiness",
        "11. Marginal", 115,
        "Play a Turtle Tamer (TT) run. Skill unlocks at Level 5.",
        "Allows crafting advanced armor including lynyrd gear (useful for Level 11 quest without DPC IOTM) and barskin cloak (useful with DPC IOTM for zap wand)."
    );
    add("Double-Fisted Skull Smashing", "Double-Fisted Skull Smashing",
        "11. Marginal", 116,
        "Play a Seal Clubber (SC) run. Skill unlocks at Level 12.",
        "Allows dual-wielding 1-handed weapons. Marginal in-run use, e.g. dual obsidian nutcrackers for max spell damage vs Wall of Bones."
    );
    add("Impetuous Sauciness", "Impetuous Sauciness",
        "11. Marginal", 117,
        "Play a Sauceror (SA) run. Skill unlocks at Level 12.",
        "+5 turns to Sauceror buffs. Primarily useful for extending sauce potion durations."
    );
    add("Rage of the Reindeer", "Rage of the Reindeer",
        "11. Marginal", 118,
        "Play a Seal Clubber (SC) run. Skill unlocks at Level 11.",
        "+10% Muscle and +10 Weapon Damage (10 turns, 10 MP). Contributes to the Level 13 Muscle stat test."
    );
    add("Disco Fever", "Disco Fever",
        "11. Marginal", 119,
        "Play a Disco Bandit (DB) run. Skill unlocks at Level 13.",
        "+10% Moxie and +10 Ranged Damage (10 turns, 10 MP). Contributes to the Level 13 Moxie stat test."
    );
    add("Stevedave's Shanty of Superiority", "Stevedave's Shanty of Superiority",
        "11. Marginal", 120,
        "Play an Accordion Thief (AT) run. Skill unlocks at Level 10.",
        "+10% to all attributes as an AT Song (30 MP). Not great but could help save a turn at Level 13 stat tests."
    );
    add("Cold-Blooded Fearlessness", "Cold-Blooded Fearlessness",
        "11. Marginal", 121,
        "Play a Turtle Tamer (TT) run. Skill unlocks at Level 13.",
        "+2 spooky resistance (passive). The most common monster element in a run is spooky, so this helps survivability."
    );
    add("Heart of Polyester", "Heart of Polyester",
        "11. Marginal", 122,
        "Play a Disco Bandit (DB) run. Skill unlocks at Level 13.",
        "+2 sleaze resistance (passive). Blech house NC and sausage goblins require sleaze resistance."
    );
    add("Northern Explosion", "Northern Explosion",
        "11. Marginal", 123,
        "Play a Seal Clubber (SC) run. Skill unlocks at Level 13.",
        "Cold-damage attack (16 MP). Auto-hits for SC with club equipped. Can help speed through Blech house for muscle classes."
    );
    add("Testudinal Teachings", "Testudinal Teachings",
        "11. Marginal", 124,
        "Play a Turtle Tamer (TT) run. Skill unlocks at Level 9.",
        "Familiars gain +1 experience per 6th combat. Quite marginal -- 420 fights = 70 extra XP."
    );
    add("Splattersmash", "Splattersmash",
        "11. Marginal", 125,
        "Dread skill -- from The Machine in Dreadsylvania. Requires a Skull Capacitor (~3,500,000 meat). Need a Seal Clubber AND Sauceror in the same Dread run.",
        "Deals damage based on Muscle to grouped enemies. Part of a Wall of Bones strategy."
    );
    add("Shell Up", "Shell Up",
        "11. Marginal", 126,
        "Play a Turtle Tamer (TT) run. Skill unlocks at Level 5.",
        "Blocks an attack once per combat and deals 10% of Muscle as damage. Buys an extra round vs the Wall of Skin."
    );
    add("Sauceshell", "Sauceshell",
        "11. Marginal", 127,
        "Dread skill -- from The Machine in Dreadsylvania. Requires a Skull Capacitor (~3,500,000 meat). Need a Turtle Tamer AND Sauceror in the same Dread run.",
        "Blocks an attack once per combat and deals 70-90 hot damage. Buys an extra round vs the Wall of Skin."
    );
    add("The Psalm of Pointiness", "The Psalm of Pointiness",
        "11. Marginal", 128,
        "Play an Accordion Thief (AT) run. Skill unlocks at Level 10.",
        "Inflicts 4-8 damage and delevels 1-5 when attacked (AT Song, 15 MP). Another source of damage for the Wall of Skin."
    );
    add("Spiky Shell", "Spiky Shell",
        "11. Marginal", 129,
        "Play a Turtle Tamer (TT) run. Skill unlocks at Level 9.",
        "Inflicts 3-5 damage to an attacking monster (TT Buff, 8 MP). Another source of damage for the Wall of Skin."
    );
    add("Song of Bravado", "Song of Bravado",
        "11. Marginal", 130,
        "Dread skill -- from The Machine in Dreadsylvania. Need an Accordion Thief AND Disco Bandit in the same Dread run.",
        "+15% to all attributes (Dread Song, 10 turns, 100 MP). Very MP expensive. Dread Songs are all mutually exclusive."
    );
    add("Scarysauce", "Scarysauce",
        "11. Marginal", 131,
        "SA Spookyraven skill -- obtained from the Haunted Ballroom or related Spookyraven Manor areas.",
        "+2 cold and +2 sleaze resistance, and damages attacking monsters. Marginally useful for elemental resistance tests and killing the Wall of Skin."
    );
    add("Icy Glare", "Icy Glare",
        "11. Marginal", 132,
        "Play a Sauceror (SA) run. Skill unlocks at Level 3.",
        "+10 cold damage and +10 cold spell damage (facial expression, 10 turns, 10 MP). Useful for tower elemental test or Typical Tavern NC tests."
    );
    add("Dirge of Dreadfulness", "Dirge of Dreadfulness",
        "11. Marginal", 133,
        "AT Spookyraven skill -- obtained from Spookyraven Manor areas.",
        "+12 spooky damage and +12 spooky spell damage (AT Song, 20 MP). Useful for tower elemental test and Typical Tavern NCs."
    );
    add("Snarl of the Timberwolf", "Snarl of the Timberwolf",
        "11. Marginal", 134,
        "SC Spookyraven skill -- obtained from Spookyraven Manor areas.",
        "+10 spooky damage (facial expression, 10 turns, 10 MP). Smaller bonus than Dirge but facial expression can be more practical than a song."
    );

    // 12. Unrestricted Highlights (200+)
    // These skills are NOT usable in Standard paths but are
    // powerful in unrestricted runs. Anything over 200M meat
    // is noted separately -- see the category footer when browsing.
    add("Shattering Punch", "Shattering Punch",
        "12. Unrestricted", 200,
        "[OUT OF STANDARD 2025] Buy Training scroll: Shattering Punch from the mall (~1,000,000 meat). X-32-F Combat Training Snowman skill.",
        "3 free kills/day (combat skill, 30 MP). One of the best free kill sources available. Very high value in unrestricted."
    );
    add("Snokebomb", "Snokebomb",
        "12. Unrestricted", 201,
        "[OUT OF STANDARD 2025] Buy Training scroll: Snokebomb from the mall (~200,000 meat). X-32-F Combat Training Snowman skill.",
        "3 banishes/day, 20-turn duration (combat skill, 30 MP). Very cheap and highly versatile. Strong in any unrestricted run."
    );
    add("Gingerbread Mob Hit", "Gingerbread Mob Hit",
        "12. Unrestricted", 202,
        "[OUT OF STANDARD 2025] Buy My Life of Crime, a Memoir from the mall (~1,111,111 meat). Gingerbread City skillbook.",
        "1 free kill/day (combat skill, 30 MP). Supplements Shattering Punch for more daily free kills."
    );
    add("Evoke Eldritch Horror", "Evoke Eldritch Horror",
        "12. Unrestricted", 203,
        "[OUT OF STANDARD 2025] Buy the eldritch tincture from the mall (~18,000,000 meat). Eldritch Horror world event skill.",
        "1 free fight/day (94.5% chance). The other 5.5% of the time you get Beaten Up, which is annoying but costs no turn."
    );
    add("Steely-Eyed Squint", "Steely-Eyed Squint",
        "12. Unrestricted", 204,
        "[OUT OF STANDARD 2025] Buy The Western Look LT&T skillbook from the mall (~4,700,000 meat).",
        "Doubles your Item Drop % for 1 turn (1/day, 100 MP). Most powerful LT&T skill. Many unrestricted paths route around maximising Squint turns, e.g. capping Green Ops Soldiers."
    );
    add("Bend Hell", "Bend Hell",
        "12. Unrestricted", 205,
        "[OUT OF STANDARD 2025] Buy Hell and How I Bent It LT&T skillbook from the mall (~1,750,000 meat).",
        "Doubles your elemental damage for 1 turn (1/day, 100 MP). Very strong for the Mob of Zeppelin Protestors. Extend with stone wool or Platinum Yendorian Express Card for full benefit."
    );
    add("Bow-Legged Swagger", "Bow-Legged Swagger",
        "12. Unrestricted", 206,
        "[OUT OF STANDARD 2025] Buy Tales of Western Braggadoccio LT&T skillbook from the mall (~3,400,000 meat).",
        "Doubles Weapon Damage and Initiative for 1 turn (1/day, 100 MP). In Community Service, effectively wins the Weapon Damage test. Also doubles initiative for Modern Zombies."
    );
    add("Emotionally Chipped", "Emotionally Chipped (Emotion Chip IOTM)",
        "12. Unrestricted", 207,
        "[OUT OF STANDARD 2025] Purchase the Emotion Chip IOTM (~173,000,000 meat in the mall). Perms as a single skill granting access to all Feel skills.",
        "Grants 4 powerful skills: Feel Envy (3/day Yellow Ray), Feel Pride (3x stat gains/fight), Feel Hatred (50-turn banish), Feel Lonely (-5% combat 20 turns). One of the best IotMs for unrestricted runs."
    );
    add("Comprehensive Cartography", "Comprehensive Cartography (IOTM)",
        "12. Unrestricted", 208,
        "[OUT OF STANDARD 2025] Purchase the Comprehensive Cartography IOTM (~137,000,000 meat). Perms as a single skill.",
        "3/day monster selection NC to pick exactly which monster you fight. Also passively speeds up quests, gives occasional gin/rum/whiskey, and provides helpful NCs. Saves many turns over a full run."
    );
    add("Visit your Favorite Bird", "Visit your Favorite Bird",
        "12. Unrestricted", 212,
        "[OUT OF STANDARD 2025] Purchase the Bird-A-Day Calendar IOTM (~142,000,000 meat). Requires finding and seeding the right bird before ascending.",
        "Once/day 20-turn buff that can give +100% meat, +150% initiative, +50% items, or -11% combat depending on your favorited bird. Finicky to set up but extremely powerful."
    );
    add("Gallapagosian Mating Call", "Gallapagosian Mating Call",
        "12. Unrestricted", 213,
        "[OUT OF STANDARD 2025] Buy Illustrated Mating Rituals of the Gallapagos Fortune Teller skillbook from the mall (~750,000 meat). Auto-HC perms.",
        "Queues 1 copy of a monster (unlike Olfaction, retains rejection). Stacks with Olfaction. No buff slot used. MP expensive but unlimited casts."
    );
    add("Get Big", "Get Big",
        "12. Unrestricted", 214,
        "[OUT OF STANDARD 2025] Buy How To Get Bigger Without Really Trying Fortune Teller skillbook from the mall (~750,000 meat). Auto-HC perms.",
        "+20% to all stats (10 turns, 15 MP). Helps survive combat and gives more stats from scalers. Good all-round buff."
    );
    add("Carol of the Hells", "Carol of the Hells",
        "12. Unrestricted", 215,
        "[OUT OF STANDARD 2025] Buy Carol of the Hells skillbook from the mall (~4,000,000 meat). Auto-HC perms.",
        "+100% spell damage (10 turns, 30 MP). Helps kill the Wall of Bones and boosts elemental spell damage significantly."
    );
    add("Carol of the Bulls", "Carol of the Bulls",
        "12. Unrestricted", 216,
        "[OUT OF STANDARD 2025] Buy Carol of the Bulls skillbook from the mall (~4,000,000 meat). Auto-HC perms.",
        "+100% weapon damage (10 turns, 30 MP). Strong weapon damage buff for physical attackers."
    );
    add("Carol of the Thrills", "Carol of the Thrills",
        "12. Unrestricted", 217,
        "[OUT OF STANDARD 2025] Buy Carol of the Thrills skillbook from the mall (~1,500,000 meat). Auto-HC perms.",
        "+3 substats/combat (10 turns, 30 MP). Decent substat source at a reasonable cost."
    );
    add("Paul's Passionate Pop Song", "Paul's Passionate Pop Song",
        "12. Unrestricted", 218,
        "[OUT OF STANDARD 2025] Buy Silly Little Love Song Fortune Teller skillbook from the mall (~750,000 meat). Auto-HC perms.",
        "4-5 MP regen/adventure as an AT Song (20 MP). Effectively free net MP regen with the antique accordion."
    );
    add("Acquire Rhinestones", "Acquire Rhinestones",
        "12. Unrestricted", 219,
        "[OUT OF STANDARD 2025] Buy They'll Love You In Rhinestones Fortune Teller skillbook from the mall (~750,000 meat). Auto-HC perms.",
        "Summons 23-37 rhinestones/day (10 MP). +1 Moxie per rhinestone used with no cap. Good Moxie boost for Level 13 and combat survivability."
    );
    add("Budget Conscious", "Budget Conscious",
        "12. Unrestricted", 220,
        "[OUT OF STANDARD 2025] Complete Neverending Party quest #9. Costs ~1,500,000 meat in guest passes. Auto-HC perms.",
        "+10% meat (passive). Will pay itself off eventually. Cheaper than most meat% skills."
    );
    add("Inscrutable Gaze", "Inscrutable Gaze",
        "12. Unrestricted", 221,
        "[OUT OF STANDARD 2025] Buy Convincing People You Can See The Future Fortune Teller skillbook from the mall (~750,000 meat). Auto-HC perms.",
        "+10% Mysticality substats as a facial expression (everything -- food, fights, etc.). Excellent for Mysticality mainstat runs."
    );
    add("Drinking to Drink", "Drinking to Drink",
        "12. Unrestricted", 222,
        "[OUT OF STANDARD 2025] Complete Neverending Party quest #19 while wearing a shirt. Costs ~3,000,000 meat in daily guest passes. Auto-HC perms.",
        "+1 max liver capacity. Excellent turn generation -- pays for itself in the long run. Also gives +1 adventure from Ode/day."
    );
    add("Prevent Scurvy and Sobriety", "Prevent Scurvy and Sobriety",
        "12. Unrestricted", 223,
        "[OUT OF STANDARD 2025] Complete ~15 PirateRealm one-day passes (~6,000,000 meat total). Untradeable skillbook reward.",
        "Summons 3 rum + 3 citrus fruits daily (50 MP). Always gives 1 lime and 1 grapefruit. Synergizes with saucecrafting and cocktailcrafting."
    );
    add("Bowl Full of Jelly", "Bowl Full of Jelly",
        "12. Unrestricted", 224,
        "[OUT OF STANDARD 2025] Buy The Night Before Crimbo Ch. 2 skillbook from the mall (~6,500,000 meat). Crimbo 2020.",
        "Summons 1-fullness epic food daily (50 MP). 5-6 adventures. Slightly better than Spaghetti Breakfast as it has no eat-first requirement."
    );
    add("Eye and a Twist", "Eye and a Twist",
        "12. Unrestricted", 225,
        "[OUT OF STANDARD 2025] Buy The Night Before Crimbo Ch. 4 skillbook from the mall (~7,500,000 meat). Crimbo 2020.",
        "Summons 1-potency epic booze daily (50 MP). Excellent filler booze, comparable to Cold One."
    );
    add("Fashionably Late", "Fashionably Late",
        "12. Unrestricted", 226,
        "[OUT OF STANDARD 2025] Buy CRIMBCO Employee Handbook chapter 1 from the mall (~1,850,000 meat). Crimbo 2010.",
        "+1 rollover adventure/day (passive). Cheap and permanent passive turn gen."
    );
    add("Long Winter's Nap", "Long Winter's Nap",
        "12. Unrestricted", 227,
        "[OUT OF STANDARD 2025] Buy The Night Before Crimbo Ch. 1 skillbook from the mall (~6,950,000 meat). Crimbo 2020.",
        "5 free rests per day. Restores HP/MP and can clear Beaten Up multiple times. Strong synergy with IotMs that add alternate resting sources."
    );
    add("Ancestral Recall", "Ancestral Recall",
        "12. Unrestricted", 228,
        "[OUT OF STANDARD 2025] Learn from the Ancestral Recall card from the Deck of Every Card (IotM). Can also learn from gift cards even without the deck.",
        "Converts up to 2 deck draws into up to 6 turns/day (1 blue mana per cast). Good if you own the Deck of Every Card or can access gift cards."
    );
    add("Lock Picking", "Lock Picking",
        "12. Unrestricted", 229,
        "[OUT OF STANDARD 2025] Complete a Low Key Summer challenge path run, or buy Manual of Lock Picking from the mall.",
        "Once per ascension: choose and acquire Boris Key, Jarlsberg Key, or Sneaky Pete Key (5 MP). Saves one Daily Dungeon trip. Synergy with Prevent Scurvy and Sobriety for key lime pies."
    );
    add("Inigo's Incantation of Inspiration", "Inigo's Incantation of Inspiration",
        "12. Unrestricted", 230,
        "[OUT OF STANDARD 2025] Buy from the mall (~1,000,000 meat). AT Traveling Trader 2010 skill.",
        "1 free craft per 5 turns (AT Song, up to 5 casts/day). MP intensive but duration scales with accordion quality. Saves crafting turns for heavy crafters."
    );
    add("Rapid Prototyping", "Rapid Prototyping",
        "12. Unrestricted", 231,
        "[OUT OF STANDARD 2025] Buy Crimbot ROM: Rapid Prototyping from the mall (~15,000,000 meat). Crimbo 2014.",
        "+5 free crafts/day (passive). Worthwhile early if you do many reagent pastas and AC/SHCs per day. Expensive but saves crafting turns."
    );
    add("Elf Guard Cooking", "Elf Guard Cooking",
        "12. Unrestricted", 232,
        "Buy Elf Guard Field Manual: Culinary Arts from the mall. Crimbo 2023.",
        "3 free cooks/day (passive). Good value if you cook daily."
    );
    add("Old-School Cocktailcrafting", "Old-School Cocktailcrafting",
        "12. Unrestricted", 233,
        "Buy Cocktails of the Age of Sail from the mall. Crimbo 2023.",
        "3 free mixes/day (passive). Good value if you mix booze daily."
    );
    add("Executive Narcolepsy", "Executive Narcolepsy",
        "12. Unrestricted", 234,
        "[OUT OF STANDARD 2025] Buy CRIMBCO Employee Handbook chapter 2 from the mall (~1,500,000 meat). Crimbo 2010.",
        "+1 free craft/day (passive). Small but permanent crafting savings."
    );
    add("Elf Guard Relaxation Techniques", "Elf Guard Relaxation Techniques",
        "12. Unrestricted", 235,
        "Buy Elf Guard Field Manual: Wilderness Sleeping from the mall. Crimbo 2023.",
        "3 free rests/day (passive). Supplements Long Winter's Nap or serves as a cheaper alternative."
    );
    add("Curiosity of Br'er Tarrypin", "Curiosity of Br'er Tarrypin",
        "12. Unrestricted", 236,
        "[OUT OF STANDARD 2025] Buy Uncle Romulus skillbook from the mall (~70,000 meat). TT Traveling Trader 2010.",
        "+1 familiar experience per combat (TT Buff, 10 turns, 10 MP). Very cheap. Particularly useful for levelling the Grey Goose quickly in unrestricted runs."
    );
    add("Giant Growth", "Giant Growth",
        "12. Unrestricted", 237,
        "[OUT OF STANDARD 2025] Learn from the Giant Growth card from the Deck of Every Card (IotM). Can also learn from gift cards.",
        "+300% stats for 1 turn (combat skill, 1 green mana). Helpful for getting more stats from scalers or buffing up for the registration desk."
    );
    add("Blood Bond", "Blood Bond",
        "12. Unrestricted", 238,
        "[OUT OF STANDARD 2025] Buy the Booke of Vampyric Knowledge from the mall (~7,500,000 meat). Use as a Turtle Tamer. No longer obtainable in-run.",
        "+5 familiar weight (TT Buff, 10 turns, 30 HP cost instead of MP). Roughly +10% item with a fairy. With Cannelloni Cocoon, a very efficient item source."
    );
    add("Object Quasi-Permanence", "Object Quasi-Permanence",
        "12. Unrestricted", 239,
        "[OUT OF STANDARD 2025] Buy Peek-a-Boo! Spacegate Reward Book from the mall (~1,200,000 meat).",
        "+10% items (passive). Cheap passive item drop bonus."
    );
    add("Fruit Recognition", "Fruit Recognition",
        "12. Unrestricted", 240,
        "Buy The Encyclopedia of Fruit from the mall. Crimbo 2023.",
        "+5% item drops (passive). Small but free passive."
    );
    add("The Spirit of Taking", "The Spirit of Taking",
        "12. Unrestricted", 241,
        "[OUT OF STANDARD 2025] Buy The Spirit of Giving skillbook from the mall (~10,000,000 meat). Crimbo 2019.",
        "+10% item (TT Buff, 10 turns, 50 MP). Very MP intensive for what it gives. Worth it only with many other item% sources."
    );
    add("Blood Bubble", "Blood Bubble",
        "12. Unrestricted", 242,
        "[OUT OF STANDARD 2025] Buy the Booke of Vampyric Knowledge from the mall (~7,500,000 meat). Use as a Sauceror. No longer obtainable in-run.",
        "The first hit per combat misses (SA Buff, 3 turns, 30 HP). Extremely strong survivability -- synergizes with Cannelloni Cocoon to cast nearly your whole run. Especially good at high ML."
    );
    add("Blood Frenzy", "Blood Frenzy",
        "12. Unrestricted", 243,
        "[OUT OF STANDARD 2025] Buy the Booke of Vampyric Knowledge from the mall (~7,500,000 meat). Use as a Seal Clubber. No longer obtainable in-run.",
        "+50% weapon damage (SC Buff, 10 turns, 30 HP). Cheap HP-cost weapon damage buff. Handy for physical attackers."
    );
    add("Grease Up", "Grease Up",
        "12. Unrestricted", 244,
        "[OUT OF STANDARD 2025] Buy Now You Are Cooking With Grease skillbook from the mall (~4,000,000 meat). Elemental Planes, Sleaze Plane.",
        "+15 Sleaze Damage and massive bonus damage (10 turns, 15 MP). Notable for generating sleaze damage vs the Mob of Zeppelin Protestors."
    );
    add("Hypersane", "Hypersane",
        "12. Unrestricted", 245,
        "[OUT OF STANDARD 2025] Buy Merc Core Field Manual: Sanity Maintenance from the mall (~3-4,000,000 meat).",
        "+3 spooky resistance (passive). The most common monster element is spooky, making this the most broadly useful of the elemental resistance passives."
    );
    add("Refusal to Freeze", "Refusal to Freeze",
        "12. Unrestricted", 246,
        "[OUT OF STANDARD 2025] Buy To Build an Igloo from the mall (~3-4,000,000 meat).",
        "+3 cold resistance (passive). Useful for A-boo Clues, the Icy Peak, and various Level 13 tests."
    );
    add("Olfactory Burnout", "Olfactory Burnout",
        "12. Unrestricted", 247,
        "[OUT OF STANDARD 2025] Buy Scratch-and-Sniff Guide to Dinseylandfill from the mall (~3-4,000,000 meat).",
        "+3 stench resistance (passive). Helps in Guano Junction, Twin Peak, Haunted Kitchen, and war hippies."
    );
    add("Asbestos Heart", "Asbestos Heart",
        "12. Unrestricted", 248,
        "[OUT OF STANDARD 2025] Buy Lava Miner Daughter from the mall (~3-4,000,000 meat).",
        "+3 hot resistance (passive). Speeds up the Haunted Kitchen and helps with fire monsters throughout the game."
    );
    add("Unoffendable", "Unoffendable",
        "12. Unrestricted", 249,
        "[OUT OF STANDARD 2025] Buy History Most Offensive Jokes Vol. IX from the mall (~3-4,000,000 meat).",
        "+3 sleaze resistance (passive). Helps with Blech house NC, sausage goblins, and various Level 13 quest areas."
    );
    add("5-D Earning Potential", "5-D Earning Potential",
        "12. Unrestricted", 250,
        "[OUT OF STANDARD 2025] Buy Non-Euclidean Finance Spacegate Reward Book from the mall (~1,100,000 meat).",
        "+20% meat (passive). Very cheap for a passive meat bonus."
    );
    add("Elf Guard Extortion Techniques", "Elf Guard Extortion Techniques",
        "12. Unrestricted", 251,
        "Buy Elf Guard Field Manual: Extortion from the mall. Crimbo 2023.",
        "+10% meat (passive). Free passive meat if cheap in the mall."
    );
    add("Dimples, How Merry!", "Dimples, How Merry!",
        "12. Unrestricted", 252,
        "Buy The Night Before Crimbo Ch. 5 from the mall. Crimbo 2020.",
        "+1 stats per fight (passive). Small but requires no upkeep and competes with nothing."
    );
    add("Always Never Not Guzzling", "Always Never Not Guzzling",
        "12. Unrestricted", 253,
        "[OUT OF STANDARD 2025] Buy Never Don't Stop Not Striving Guzzlr skillbook from the mall (~1,300,000 meat). Tradeable -- does not require owning the Guzzlr IOTM.",
        "+25% booze drops from monsters. Helpful for getting ingredients like Chateau de Vinegar components."
    );
    add("Kung Fu Hustler", "Kung Fu Hustler",
        "12. Unrestricted", 254,
        "[OUT OF STANDARD 2025] Buy The Autobiography of Dynamite Superman Jones from the Traveling Trader 2010.",
        "Stacking passive buffs for unarmed combat streaks: +weapon damage at 1 kill, +initiative at 10, +damage at 20, +20% item at 30. Useful in Way of the Surprising Fist and Community Service."
    );
    add("Disintegrate", "Disintegrate",
        "12. Unrestricted", 255,
        "[OUT OF STANDARD 2025] Buy the Spacegate emergency disintegrator from the mall (~1,400,000 meat). Spacegate Skill.",
        "Yellow Ray with a 100-turn cooldown (150 MP). Makes a monster drop all non-conditional items. Good backup if you forgot to buy a yellow rocket."
    );
    add("Dead Nostrils", "Dead Nostrils",
        "12. Unrestricted", 256,
        "[OUT OF STANDARD 2025] Buy The Nose Knows, A Guide to Smells from the Bookmobile (~mall price varies).",
        "+1 stench resistance and +1 stench spell damage (passive). Helps in the Haunted Kitchen, Guano Junction, Twin Peak, and Level 13. Minor deodorant synergy in-run."
    );
    add("Secret Door Awareness", "Secret Door Awareness",
        "12. Unrestricted", 257,
        "Buy Manual of Secret Door Detection from the mall. 2023 IOTM derivative.",
        "Passive skill from the 2023 catalog IOTM. Check current mall pricing."
    );
    add("Love Mixology", "Love Mixology",
        "12. Unrestricted", 258,
        "[OUT OF STANDARD 2025] Buy Love Potions and the Wizards who Mix Them Fortune Teller skillbook from the mall (~750,000 meat). Auto-HC perms.",
        "Summons a Love Potion #XYZ (50 MP). Potions give random +/- stats, max HP, and max MP. The random nature makes them mostly unreliable, but occasionally excellent on Turn 1."
    );

}