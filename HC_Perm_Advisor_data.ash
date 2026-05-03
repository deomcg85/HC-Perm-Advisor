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
        "3. Turn-Gen", 40,
        "[OUT OF STANDARD 2025] Buy the LyleCo Contractor Manual from the mall (~1,500,000 meat). This is the only source of this skill -- there is no class run version.",
        "5 free crafts/day (passive). Excellent if you cook reagent pastas and AC/SHCs daily. Saves crafting turns for milk of magnesium, potions, unstable fulminate, and more. Used after Inigo and Rapid Prototyping."
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

    // ── CATEGORY 4 ADDITIONS: Facial Expression Substats ────────
    // Patient Smile and Wry Smile complete the facial expression trio
    // alongside Knowing Smile (already in DB at priority 52)

    add("Patient Smile", "Patient Smile (Muscle facial expression)",
        "4. Substats", 54,
        "Play a Turtle Tamer (TT) run. Skill unlocks at Level 14.",
        "+1 Muscle substat/combat. Perm if you primarily run Muscle-class ascensions. Facial expressions are mutually exclusive -- only one active at a time."
    );
    add("Wry Smile", "Wry Smile (Mysticality facial expression)",
        "4. Substats", 55,
        "Play a Sauceror (SA) run. Skill unlocks at Level 13.",
        "+1 Mysticality substat/combat. Perm if you primarily run Mysticality-class ascensions. Facial expressions are mutually exclusive -- only one active at a time."
    );

    // ── CATEGORY 6 ADDITIONS: Gnome Skills ──────────────────────
    // Gnome moon sign skills -- obtained from underground Gnomish areas

    add("Powers of Observatiogn", "Powers of Observatiogn",
        "6. Survivability", 79,
        "Use the Mongoose moon sign when ascending. Unlocks from the Gnomish Loathing underground area.",
        "+25% item drops (passive). Misspelling is intentional -- it is how KoL names the skill. A solid passive item bonus from the Gnome moon path."
    );
    add("Gnefarious Pickpocketing", "Gnefarious Pickpocketing",
        "6. Survivability", 79,
        "Use the Wombat moon sign when ascending. Unlocks from the Gnomish Loathing underground area.",
        "+10% pickpocket chance (passive). Misspelling intentional. Useful alongside Sensitive Fingers and Master Accordion Master Thief for pickpocket builds."
    );
    add("Gnomish Hardigness", "Gnomish Hardigness",
        "6. Survivability", 79,
        "Use the Vole moon sign when ascending. Unlocks from the Gnomish Loathing underground area.",
        "+15 max HP (passive). Misspelling intentional. Solid early survivability boost from the Gnome moon path."
    );
    add("Cosmic Ugnderstanding", "Cosmic Ugnderstanding",
        "4. Substats", 56,
        "Use a Gnome moon sign (Mongoose, Wombat, or Vole) when ascending. Unlocks from the Gnomish Loathing underground area.",
        "+10% Mysticality substats (passive). Misspelling intentional. Good substat boost for Mysticality-class runs."
    );

    // ── CATEGORY 6: Class Combat Skill Groups ───────────────────
    // These grouped entries cover all remaining class skills not
    // already tracked individually. The representative kol_name
    // is a high-level skill from each class used for perm detection.
    // If you have not yet played that class to max level, the group
    // will show as un-permed.

    add("Cavalcade of Fury", "Seal Clubber Combat Skills (grouped)",
        "6. Survivability", 150,
        "Play a Seal Clubber (SC) run and level up fully. Covers all remaining SC class skills: Thrust-Smack, Lunge Smack, Lunging Thrust-Smack, Clobber, Harpoon!, Blubber Up, Fortitude of the Muskox, Audacity of the Otter, Claws of the Walrus, Batter Up!, Cold Shoulder, Wrath of the Wolverine, Buoyancy of the Beluga, Scowl of the Auk, Furious Wallop, Club Foot, Seething of the Snow Leopard, Ire of the Orca, Thirst of the Weasel, Cavalcade of Fury, Precision of the Penguin, Silent Hunter, Holiday Weight Gain, Iron Palm Technique, Hibernate.",
        "Full suite of SC combat and passive skills. Many are combat-only but some give useful passives. Perm detection uses Cavalcade of Fury (Level 15) as proxy for class completion."
    );
    add("Quiet Determination", "Turtle Tamer Combat Skills (grouped)",
        "6. Survivability", 151,
        "Play a Turtle Tamer (TT) run and level up fully. Covers all remaining TT class skills: Patience of the Tortoise, Headbutt, Shieldbutt, Kneebutt, Reptilian Fortitude, Tenacity of the Snapper, Hero of the Half-Shell, Spectral Snapper, Toss, Summon Leviatuga, Jingle Bells, Spirit Vacation, Stiff Upper Lip, Blessing of the War Snapper, Spirit Snap, Blessing of She-Who-Was, Butts of Steel, Pizza Lover, Blessing of the Storm Tortoise, Spirit Boon, Turtle Power, Quiet Determination.",
        "Full suite of TT combat and spirit skills. Includes spirit blessings, shell buffs, and familiar-related passives. Perm detection uses Quiet Determination (high level TT) as proxy."
    );
    add("Blood Bucatini", "Pastamancer Combat Skills (grouped)",
        "6. Survivability", 152,
        "Play a Pastamancer (PM) run and level up fully. Covers all remaining PM class skills: Manicotti Meditation, Ravioli Shurikens, Entangling Noodles, Cannelloni Cannon, Stuffed Mortar Shell, Weapon of the Pastalord, Lasagna Bandages, Spirit of Rigatoni, Fearful Fettucini, Spaghetti Spear, Tempuramancy, Candyblast, Stringozzi Serpent, Utensil Twist, Transcendent Al Dente, all Bind Thrall skills (Bind Vampieroghi, Bind Vermincelli, Bind Angel Hair Wisp, Bind Undead Elbow Macaroni, Bind Penne Dreadful, Bind Lasagmbie, Bind Spice Ghost, Bind Spaghetti Elemental), Arched Eyebrow of the Archmage, Bringing Up the Rear, Shield of the Pastalord, Thrall Unit Tactics, Subtle and Quick to Anger, Wizard Squint, Quiet Judgement, Blood Bucatini.",
        "Full suite of PM combat spells and thrall-binding skills. Includes all 8 thrall bind skills which summon pasta-themed undead companions. Perm detection uses Blood Bucatini (high level PM) as proxy."
    );
    add("Sauce Monocle", "Sauceror Combat Skills (grouped)",
        "6. Survivability", 153,
        "Play a Sauceror (SA) run and level up fully. Covers all remaining SA class skills: Sauce Contemplation, Stream of Sauce, Jalapeño Saucesphere, Wave of Sauce, Intrinsic Spiciness, Master Saucier, Saucegeyser, Saucy Salve, Irrepressible Spunk, Salsaball, Deep Saucery, Surge of Icing, Curse of Vichyssoise, Simmer, Soul Saucery, Curse of Marinara, Curse of the Thousand Islands, Saucecicle, Antibiotic Saucesphere, Sauce Monocle, Silent Treatment.",
        "Full suite of SA combat spells and sauce-themed skills. Many are combat damage spells or elemental attacks. Perm detection uses Sauce Monocle (high level SA) as proxy."
    );
    add("Blood Blade", "Disco Bandit Combat Skills (grouped)",
        "6. Survivability", 154,
        "Play a Disco Bandit (DB) run and level up fully. Covers all remaining DB class skills: Disco Aerobics, Disco Eye-Poke, Disco Dance of Doom, Disco Dance II: Electric Boogaloo, Disco Face Stab, Smooth Movement, Tango of Terror, Suckerpunch, Salacious Cocktailcrafting, Stealth Mistletoe, Deft Hands, Disco State of Mind, Frantic Gyrations, That's Not a Knife, Tricky Knifework, Flashy Dancer, Disco Smirk, Disco Greed, Knife in the Dark, Disco Bravado, Disco Shank, Disco Dance 3: Back in the Habit, Disco Inferno, Disco Leer, Silent Knife, Blood Blade.",
        "Full suite of DB combat and dance skills. Includes various stab/dance attacks and passive bonuses. Perm detection uses Blood Blade (high level DB) as proxy."
    );
    add("Mild Curse", "Accordion Thief Combat Skills (grouped)",
        "6. Survivability", 155,
        "Play an Accordion Thief (AT) run and level up fully. Covers all remaining AT class skills: Moxie of the Mariachi, The Moxious Madrigal, The Power Ballad of the Arrowsmith, Brawnee's Anthem of Absorption, Jackasses' Symphony of Destruction, The Ballad of Richie Thingfinder, Benetton's Medley of Diversity, Elron's Explosive Etude, Chorale of Companionship, Prelude of Precision, Sing, Donho's Bubbly Ballad, Cringle's Curative Carol, Dissonant Riff, Cadenza, Crab Claw Technique, Accordion Bash, Accordion Appreciation, Concerto de los Muertos, Suspicious Gaze, Bawdy Refrain, Sticky Fingers, Cone of Zydeco, Quiet Desperation, Bram's Bloody Bagatelle, Mild Curse.",
        "Full suite of AT songs and combat skills. Includes many AT Songs and combat abilities. Note: Ed the Undying is not recognised by KoLmafia and is excluded. Perm detection uses Mild Curse (high level AT) as proxy."
    );

    // ── CATEGORY 7 ADDITIONS: Misc Utility ──────────────────────

    add("CLEESH", "CLEESH",
        "7. Misc", 83,
        "Obtained from the Gnomish Loathing underground area or certain other sources. Check the KoL wiki for current acquisition details.",
        "Turns a monster into a newt, effectively banishing it without using a banish slot. A useful combat utility skill."
    );
    add("Summon Annoyance", "Summon Annoyance",
        "7. Misc", 84,
        "Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Summons a pile of Annoying French Canadians (items). Check wiki for current utility."
    );
    add("Pirate Bellow", "Pirate Bellow",
        "7. Misc", 85,
        "Obtained from a pirate-related source. Check the KoL wiki for current acquisition details.",
        "Combat skill with pirate-themed effects. Check wiki for current utility."
    );
    add("Summon Holiday Fun!", "Summon Holiday Fun!",
        "7. Misc", 86,
        "Obtained from a holiday event source. Check the KoL wiki for current acquisition details.",
        "Summons holiday-themed items. Check wiki for current utility and item details."
    );
    add("Summon Carrot", "Summon Carrot",
        "7. Misc", 87,
        "Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Summons carrots (familiars enjoy carrots). Check wiki for current utility."
    );
    add("Bear Essence", "Bear Essence",
        "7. Misc", 88,
        "Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Buff or combat skill with bear-themed effects. Check wiki for current utility."
    );
    add("Summon Kokomo Resort Pass", "Summon Kokomo Resort Pass",
        "7. Misc", 89,
        "Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Summons a Kokomo Resort Pass item. Check wiki for what the pass does and current utility."
    );
    add("Experience Safari", "Experience Safari",
        "7. Misc", 90,
        "Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Provides experience-related bonus. Check wiki for current utility."
    );
    add("Generate Irony", "Generate Irony",
        "7. Misc", 91,
        "Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Generates Irony (a special currency or resource). Check wiki for current utility and what Irony is used for."
    );

    // ── CATEGORY 11 ADDITIONS: More Dread Skills ────────────────
    // These are the remaining Dread Machine skills not already in DB.
    // All require coordinating two specific classes in a Dread run
    // plus a Skull Capacitor (~3,500,000 meat, 3 uses).

    add("Club Earth", "Club Earth",
        "11. Marginal", 135,
        "Dread skill -- from The Machine in Dreadsylvania. Requires a Skull Capacitor (~3,500,000 meat, 3 uses). Need a Seal Clubber AND Turtle Tamer in the same Dread run.",
        "Deals earth-based damage in combat. Marginal combat damage skill."
    );
    add("Carbohydrate Cudgel", "Carbohydrate Cudgel",
        "11. Marginal", 136,
        "Dread skill -- from The Machine in Dreadsylvania. Requires a Skull Capacitor (~3,500,000 meat, 3 uses). Need a Turtle Tamer AND Pastamancer in the same Dread run.",
        "Pasta-themed club attack. Marginal combat damage skill."
    );
    add("Song of the North", "Song of the North",
        "11. Marginal", 137,
        "Dread skill -- from The Machine in Dreadsylvania. Requires a Skull Capacitor (~3,500,000 meat, 3 uses). Need a Seal Clubber AND Accordion Thief in the same Dread run.",
        "Cold-damage AT Song variant. Dread Songs are all mutually exclusive."
    );
    add("Turtleini", "Turtleini",
        "11. Marginal", 138,
        "Dread skill -- from The Machine in Dreadsylvania. Requires a Skull Capacitor (~3,500,000 meat, 3 uses). Need a Turtle Tamer AND Pastamancer in the same Dread run.",
        "Pasta-turtle hybrid combat skill. Marginal combat damage."
    );
    add("Song of Slowness", "Song of Slowness",
        "11. Marginal", 139,
        "Dread skill -- from The Machine in Dreadsylvania. Requires a Skull Capacitor (~3,500,000 meat, 3 uses). Need an Accordion Thief AND Sauceror in the same Dread run.",
        "Slows monster attack rate as an AT Song. Dread Songs are all mutually exclusive."
    );
    add("Shadow Noodles", "Shadow Noodles",
        "11. Marginal", 140,
        "Dread skill -- from The Machine in Dreadsylvania. Requires a Skull Capacitor (~3,500,000 meat, 3 uses). Need a Pastamancer AND Disco Bandit in the same Dread run.",
        "Shadow-based noodle attack. Marginal combat damage skill."
    );
    add("Song of Starch", "Song of Starch",
        "11. Marginal", 141,
        "Dread skill -- from The Machine in Dreadsylvania. Requires a Skull Capacitor (~3,500,000 meat, 3 uses). Need a Pastamancer AND Accordion Thief in the same Dread run.",
        "Starch-based AT Song. Dread Songs are all mutually exclusive."
    );
    add("Splashdance", "Splashdance",
        "11. Marginal", 142,
        "Dread skill -- from The Machine in Dreadsylvania. Requires a Skull Capacitor (~3,500,000 meat, 3 uses). Need an Accordion Thief AND Disco Bandit in the same Dread run.",
        "Dance-based attack or AT Song. Dread Songs are all mutually exclusive."
    );
    add("Song of Sauce", "Song of Sauce",
        "11. Marginal", 143,
        "Dread skill -- from The Machine in Dreadsylvania. Requires a Skull Capacitor (~3,500,000 meat, 3 uses). Need a Sauceror AND Accordion Thief in the same Dread run.",
        "Sauce-themed AT Song. Dread Songs are all mutually exclusive."
    );

    // Slime Tube - remaining skill
    add("Slimy Shoulders", "Slimy Shoulders",
        "11. Marginal", 144,
        "Fight Mother Slime in the Slime Tube to collect slime-soaked shoulders drops. Each drop upgrades the skill, caps at 10 upgrades. Glands can be costly.",
        "+1 Damage Absorption per upgrade (+10 DA total). Flat DA is useful early but less impactful than percentage bonuses."
    );

    // Silent skills from The Silent Treatment path / special sources
    add("Silent Slam", "Silent Slam",
        "11. Marginal", 145,
        "Obtained from a special path or source. Check the KoL wiki for current acquisition details.",
        "Silent combat skill -- deals damage without making noise. Check wiki for current utility."
    );
    add("Silent Squirt", "Silent Squirt",
        "11. Marginal", 146,
        "Obtained from a special path or source. Check the KoL wiki for current acquisition details.",
        "Silent combat skill. Check wiki for current utility."
    );
    add("Silent Slice", "Silent Slice",
        "11. Marginal", 147,
        "Obtained from a special path or source. Check the KoL wiki for current acquisition details.",
        "Silent combat skill. Check wiki for current utility."
    );

    // ── CATEGORY 12 ADDITIONS: Hobopolis / Clan Dungeon Skills ──
    // These skills come from running the Hobopolis clan dungeon,
    // which requires access to a premium VIP clan with Hobopolis unlocked.

    add("Awesome Balls of Fire", "Awesome Balls of Fire",
        "12. Unrestricted", 260,
        "[OUT OF STANDARD 2025] Hobopolis clan dungeon skill. Requires a VIP clan with Hobopolis unlocked. Run the Hobopolis dungeon and defeat the relevant boss or complete the appropriate path.",
        "Fire-based combat damage skill. Useful for elemental damage in unrestricted runs."
    );
    add("Conjure Relaxing Campfire", "Conjure Relaxing Campfire",
        "12. Unrestricted", 261,
        "[OUT OF STANDARD 2025] Hobopolis clan dungeon skill. Requires a VIP clan with Hobopolis unlocked.",
        "Conjures a campfire allowing free resting. HP and MP restoration without using a rest. Useful in unrestricted runs."
    );
    add("Snowclone", "Snowclone",
        "12. Unrestricted", 262,
        "[OUT OF STANDARD 2025] Hobopolis clan dungeon skill. Requires a VIP clan with Hobopolis unlocked.",
        "Cold-damage combat skill. Useful for cold elemental encounters in unrestricted."
    );
    add("Maximum Chill", "Maximum Chill",
        "12. Unrestricted", 263,
        "[OUT OF STANDARD 2025] Hobopolis clan dungeon skill. Requires a VIP clan with Hobopolis unlocked.",
        "Cold resistance or passive cold buff. Check wiki for current stats and utility."
    );
    add("Eggsplosion", "Eggsplosion",
        "12. Unrestricted", 264,
        "[OUT OF STANDARD 2025] Hobopolis clan dungeon skill. Requires a VIP clan with Hobopolis unlocked.",
        "Egg-based explosive combat skill. Check wiki for current damage and utility."
    );
    add("Mudbath", "Mudbath",
        "12. Unrestricted", 265,
        "[OUT OF STANDARD 2025] Hobopolis clan dungeon skill. Requires a VIP clan with Hobopolis unlocked.",
        "Heals HP and possibly provides a buff. Useful for survivability in unrestricted runs."
    );
    add("Grease Lightning", "Grease Lightning",
        "12. Unrestricted", 266,
        "[OUT OF STANDARD 2025] Hobopolis clan dungeon skill. Requires a VIP clan with Hobopolis unlocked.",
        "Initiative boost or grease-based combat skill. Check wiki for current stats."
    );
    add("Inappropriate Backrub", "Inappropriate Backrub",
        "12. Unrestricted", 267,
        "[OUT OF STANDARD 2025] Hobopolis clan dungeon skill. Requires a VIP clan with Hobopolis unlocked.",
        "Debuffs or damages a monster. Check wiki for current effects and utility."
    );
    add("Raise Backup Dancer", "Raise Backup Dancer",
        "12. Unrestricted", 268,
        "[OUT OF STANDARD 2025] Hobopolis clan dungeon skill. Requires a VIP clan with Hobopolis unlocked.",
        "Summons a backup dancer to assist in combat. Check wiki for current effects."
    );
    add("Creepy Lullaby", "Creepy Lullaby",
        "12. Unrestricted", 269,
        "[OUT OF STANDARD 2025] Hobopolis clan dungeon skill. Requires a VIP clan with Hobopolis unlocked.",
        "Puts a monster to sleep or provides a banish-like effect. Useful combat utility in unrestricted."
    );
    add("Wassail", "Wassail",
        "12. Unrestricted", 270,
        "[OUT OF STANDARD 2025] Hobopolis clan dungeon skill. Requires a VIP clan with Hobopolis unlocked.",
        "Healing skill. Restores HP in or out of combat. Useful for survivability in unrestricted runs."
    );
    add("Toynado", "Toynado",
        "12. Unrestricted", 271,
        "[OUT OF STANDARD 2025] Hobopolis clan dungeon skill. Requires a VIP clan with Hobopolis unlocked.",
        "Summons a tornado of toys dealing damage. Combat skill useful for unrestricted."
    );

    // ── CATEGORY 12: Misc Spacegate / IotM Skills ───────────────

    add("Chronic Indigestion", "Chronic Indigestion",
        "12. Unrestricted", 272,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Passive skill that provides a bonus related to food or digestion. Check wiki for current effects."
    );
    add("Really Expensive Jewelrycrafting", "Really Expensive Jewelrycrafting",
        "12. Unrestricted", 273,
        "Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Allows crafting of expensive jewelry items. Check wiki for what items can be crafted and their value."
    );
    add("Rainbow Gravitation", "Rainbow Gravitation",
        "12. Unrestricted", 274,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Gravity or rainbow-themed combat or utility skill. Check wiki for current effects."
    );
    add("Vent Rage Gland", "Vent Rage Gland",
        "12. Unrestricted", 275,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Vents rage dealing damage or providing a combat effect. Check wiki for current utility."
    );
    add("Summon Crimbo Candy", "Summon Crimbo Candy",
        "12. Unrestricted", 276,
        "[OUT OF STANDARD 2025] Obtained from a Crimbo event source. Check the KoL wiki for current acquisition details.",
        "Summons Crimbo candy items. Synergizes with Sweet Synthesis for candy-to-buff conversion."
    );
    add("Unaccompanied Miner", "Unaccompanied Miner",
        "12. Unrestricted", 277,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Mining-related skill. Provides resources or combat utility. Check wiki for current effects."
    );
    add("Volcanometeor Showeruption", "Volcanometeor Showeruption",
        "12. Unrestricted", 278,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Volcano/meteor-themed combat skill dealing significant damage. Check wiki for current stats."
    );
    add("Lunch Break", "Lunch Break",
        "12. Unrestricted", 279,
        "[OUT OF STANDARD 2025] Obtained from a special path or IotM source. Check the KoL wiki for current acquisition details.",
        "Provides a mid-run rest or food-related benefit. Check wiki for current effects."
    );
    add("Offensive Joke", "Offensive Joke",
        "12. Unrestricted", 280,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Stuns, delevels, or damages a monster with a joke. Combat utility skill."
    );
    add("Managerial Manipulation", "Managerial Manipulation",
        "12. Unrestricted", 281,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Manipulation-based skill with office/management theme. Check wiki for current effects."
    );
    add("Natural Born Skeleton Killer", "Natural Born Skeleton Killer",
        "12. Unrestricted", 282,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Provides bonus damage or effects against skeleton enemies. Check wiki for current utility."
    );
    add("Master of the Surprising Fist", "Master of the Surprising Fist",
        "12. Unrestricted", 283,
        "Obtained from completing the Way of the Surprising Fist challenge path. Unlocks after a WotSF ascension.",
        "Provides combat bonuses when fighting unarmed. Synergizes with Kung Fu Hustler. Check wiki for full effects."
    );
    add("Torment Plant", "Torment Plant",
        "12. Unrestricted", 284,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Plants a torment plant that deals damage over time or provides a battlefield effect. Check wiki."
    );
    add("Pinch Ghost", "Pinch Ghost",
        "12. Unrestricted", 285,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Pinches a ghost enemy for damage or a special effect. Useful against ghost-type monsters."
    );
    add("Tattle", "Tattle",
        "12. Unrestricted", 286,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Reveals information about a monster or provides a combat effect. Check wiki for current utility."
    );
    add("Frigidalmatian", "Frigidalmatian",
        "12. Unrestricted", 287,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Cold-themed dalmatian combat or familiar skill. Check wiki for current effects."
    );
    add("Deep Dark Visions", "Deep Dark Visions",
        "12. Unrestricted", 288,
        "[OUT OF STANDARD 2025] Obtained from a Spacegate or special IotM source. Check the KoL wiki for current acquisition details.",
        "Vision-based skill providing buffs or combat effects from deep/dark encounters. Check wiki."
    );
    add("Shrap", "Shrap",
        "12. Unrestricted", 289,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Shrapnel-based combat skill dealing damage. Check wiki for current stats and utility."
    );
    add("Psychokinetic Hug", "Psychokinetic Hug",
        "12. Unrestricted", 290,
        "[OUT OF STANDARD 2025] Obtained from a Spacegate or special source. Check the KoL wiki for current acquisition details.",
        "Psychic hug that deals damage or provides a buff. Check wiki for current effects."
    );
    add("Sloppy Secrets", "Sloppy Secrets",
        "12. Unrestricted", 291,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Reveals monster secrets or provides combat advantage. Check wiki for current utility."
    );
    add("Alien Source Code", "Alien Source Code",
        "12. Unrestricted", 292,
        "[OUT OF STANDARD 2025] Obtained from the Spacegate IOTM or related source. Check the KoL wiki for current acquisition details.",
        "Alien-themed code skill providing tech-based effects. Check wiki for current stats."
    );
    add("Belch The Rainbow", "Belch The Rainbow",
        "12. Unrestricted", 293,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Belches a rainbow dealing prismatic elemental damage. Fun and potentially useful for elemental resistance tests."
    );
    add("Intimidating Mien", "Intimidating Mien",
        "12. Unrestricted", 294,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Intimidates a monster reducing its stats or effectiveness. Check wiki for current effects."
    );
    add("Mathematical Precision", "Mathematical Precision",
        "12. Unrestricted", 295,
        "[OUT OF STANDARD 2025] Obtained from a Spacegate or special source. Check the KoL wiki for current acquisition details.",
        "Provides precision-based bonus to hit or damage. Check wiki for current stats."
    );
    add("Ruthless Efficiency", "Ruthless Efficiency",
        "12. Unrestricted", 296,
        "[OUT OF STANDARD 2025] Obtained from a Spacegate or special source. Check the KoL wiki for current acquisition details.",
        "Efficiency-based passive or active skill. Check wiki for current effects."
    );
    add("Speluck", "Speluck",
        "12. Unrestricted", 297,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Luck-based spell skill providing random beneficial effects. Check wiki for current utility."
    );
    add("Garbage Nova", "Garbage Nova",
        "12. Unrestricted", 298,
        "[OUT OF STANDARD 2025] Obtained from a Spacegate or special source. Check the KoL wiki for current acquisition details.",
        "Nova-level garbage explosion dealing high damage. Check wiki for current stats."
    );
    add("Dinsey Operations Expert", "Dinsey Operations Expert",
        "12. Unrestricted", 299,
        "[OUT OF STANDARD 2025] Obtained from the Dinsey World event or related source. Check the KoL wiki for current acquisition details.",
        "Expertise in Dinsey World operations providing passive bonuses. Check wiki for current effects."
    );
    add("Rotten Memories", "Rotten Memories",
        "12. Unrestricted", 300,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Memory-based skill providing combat or passive effects. Check wiki for current utility."
    );
    add("Healing Salve", "Healing Salve",
        "12. Unrestricted", 301,
        "[OUT OF STANDARD 2025] Obtained from a Deck of Every Card or special source. Check the KoL wiki for current acquisition details.",
        "Heals HP in or out of combat. Check wiki for heal amount and MP cost."
    );
    add("Dark Ritual", "Dark Ritual",
        "12. Unrestricted", 302,
        "[OUT OF STANDARD 2025] Obtained from a Deck of Every Card or special source. Check the KoL wiki for current acquisition details.",
        "Dark ritual providing mana or a powerful buff. Check wiki for current effects."
    );
    add("[16025]Lightning Bolt", "Lightning Bolt (lightning milk, skill #16025)",
        "12. Unrestricted", 303,
        "[OUT OF STANDARD 2025] Use a lightning milk item to learn this skill. Check the KoL wiki for the current source of lightning milk. Costs 1 bolt of Lightning per cast (consumed from inventory, not MP).",
        "Deals 1 damage on the first two casts in a combat, then 5,000 damage on the third cast. Unique gimmick -- plan your combat around the three-cast trigger. Note: a second unrelated Lightning Bolt (skill #138) exists from the Deck of Every Card."
    );
    add("[138]Lightning Bolt", "Lightning Bolt (Deck of Every Card, skill #138)",
        "12. Unrestricted", 303,
        "[OUT OF STANDARD 2025] Memorize the spell from the Lightning Bolt (R) card drawn from a Deck of Every Card (IotM). Can also be learned from a gift card even without owning the deck. Costs 1 red mana per cast (consumed from inventory).",
        "Deals ~3,000 damage per cast. One of the highest reliable single-hit damage options in the game. Great combat finisher in unrestricted. Note: a second unrelated Lightning Bolt (skill #16025) exists from lightning milk."
    );
    add("Pyromania", "Pyromania",
        "12. Unrestricted", 304,
        "[OUT OF STANDARD 2025] Obtained from a Spacegate reward book or special source. Check the KoL wiki for current acquisition details.",
        "Fire-themed passive or active skill. Check wiki for current effects and utility."
    );
    add("Firegate", "Firegate",
        "12. Unrestricted", 305,
        "[OUT OF STANDARD 2025] Obtained from a Spacegate reward book or special source. Check the KoL wiki for current acquisition details.",
        "Creates a firegate providing hot damage or a barrier. Check wiki for current effects."
    );
    add("Perfect Freeze", "Perfect Freeze",
        "12. Unrestricted", 306,
        "[OUT OF STANDARD 2025] Obtained from a Spacegate reward book or special source. Check the KoL wiki for current acquisition details.",
        "Freezes a monster or provides cold-based effects. Check wiki for current stats."
    );
    add("Beardfreeze", "Beardfreeze",
        "12. Unrestricted", 307,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Beard-based freeze skill with cold effects. Check wiki for current utility."
    );
    add("Frost Bite", "Frost Bite",
        "12. Unrestricted", 308,
        "[OUT OF STANDARD 2025] Obtained from a Spacegate reward book or special source. Check the KoL wiki for current acquisition details.",
        "Cold bite attack dealing frost damage. Check wiki for current stats."
    );
    add("Shivering Monkey Technique", "Shivering Monkey Technique",
        "12. Unrestricted", 309,
        "[OUT OF STANDARD 2025] Obtained from a special path or source. Check the KoL wiki for current acquisition details.",
        "Monkey-themed martial arts technique. Check wiki for current combat effects."
    );
    add("Communism!", "Communism!",
        "12. Unrestricted", 310,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Revolutionary skill providing shared benefits or combat effects. Check wiki for current utility."
    );
    add("Astute Angler", "Astute Angler",
        "12. Unrestricted", 311,
        "[OUT OF STANDARD 2025] Obtained from a special fishing-related source. Check the KoL wiki for current acquisition details.",
        "Fishing expertise providing item or combat bonuses. Check wiki for current effects."
    );
    add("Eldritch Intellect", "Eldritch Intellect",
        "12. Unrestricted", 312,
        "[OUT OF STANDARD 2025] Obtained from an Eldritch Horror event source. Check the KoL wiki for current acquisition details.",
        "Eldritch-themed intellect boost. Check wiki for current stats and effects."
    );
    add("Licorice Rope", "Licorice Rope",
        "12. Unrestricted", 313,
        "[OUT OF STANDARD 2025] Obtained from a Spacegate or special source. Check the KoL wiki for current acquisition details.",
        "Licorice-themed rope skill for entangling or dealing damage. Check wiki for current utility."
    );
    add("Fifteen Minutes of Flame", "Fifteen Minutes of Flame",
        "12. Unrestricted", 314,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Fifteen-minute flame buff dealing hot damage or providing a hot bonus. Check wiki."
    );
    add("Ceci N'Est Pas Un Chapeau", "Ceci N'Est Pas Un Chapeau",
        "12. Unrestricted", 315,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Surrealist hat-themed skill. Check wiki for current effects and what it actually does."
    );
    add("Stack Lumps", "Stack Lumps",
        "12. Unrestricted", 316,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Stacks lumps for a progressive damage or buff effect. Check wiki for current utility."
    );
    add("Quantum Movement", "Quantum Movement",
        "12. Unrestricted", 317,
        "[OUT OF STANDARD 2025] Obtained from a Spacegate or special source. Check the KoL wiki for current acquisition details.",
        "Quantum-themed movement skill providing initiative or evasion. Check wiki for current stats."
    );
    add("Eternal Flame", "Eternal Flame",
        "12. Unrestricted", 318,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Eternal flame buff providing ongoing hot damage or resistance. Check wiki for current effects."
    );
    add("Meteor Lore", "Meteor Lore",
        "12. Unrestricted", 319,
        "[OUT OF STANDARD 2025] Obtained from a Spacegate reward book or special source. Check the KoL wiki for current acquisition details.",
        "Knowledge of meteors providing buffs or combat bonuses. Part of the meteor-themed skill family. Check wiki."
    );
    add("Army of Toddlers", "Army of Toddlers",
        "12. Unrestricted", 320,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Summons an army of toddlers for combat assistance or damage. Check wiki for current effects."
    );
    add("Tiki Mixology", "Tiki Mixology",
        "12. Unrestricted", 321,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Tiki-themed mixology skill providing booze crafting or buff bonuses. Check wiki for current utility."
    );
    add("Implode Universe", "Implode Universe",
        "12. Unrestricted", 322,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Universe implosion skill dealing massive damage. Check wiki for cost, cooldown, and utility."
    );
    add("Ashes and Soot", "Ashes and Soot",
        "12. Unrestricted", 323,
        "[OUT OF STANDARD 2025] Obtained from a special source. Check the KoL wiki for current acquisition details.",
        "Ash and soot-themed skill providing hot damage or resistance. Check wiki for current effects."
    );

    // ── CATEGORY 12: Missing Tier List Skills (were dropped) ────

    add("Chubby and Plump", "Chubby and Plump",
        "12. Unrestricted", 324,
        "[OUT OF STANDARD 2025] Buy The Night Before Crimbo Ch. 6 skillbook from the mall (~5,700,000 meat). Crimbo 2020.",
        "Summons 1 Chubby and Plump bar/day (50 MP). Gives 50 turns of +50% max HP/MP. More useful in unrestricted where Sweet Synthesis makes candy valuable."
    );
    add("Ancient Crymbo Lore", "Ancient Crymbo Lore",
        "12. Unrestricted", 325,
        "[OUT OF STANDARD 2025] Buy the Crymbich Manuscript from the mall (~780,000 meat). Crimbo 2021.",
        "+3 substats/combat (passive) -- but ONLY active in December. Do not perm this outside of December. Very cheap if it happens to be December."
    );

    // Crimbo Training skills from Crimbo 2022
    add("Crimbo Training: First Aid Technician", "Crimbo Training: First Aid Technician",
        "12. Unrestricted", 326,
        "[OUT OF STANDARD 2025] Complete the corresponding Crimbo 2022 training task. Check the KoL wiki for current availability.",
        "First aid-themed passive or active skill from the Crimbo 2022 train event. Check wiki for current effects."
    );
    add("Crimbo Training: Passenger Greeter", "Crimbo Training: Passenger Greeter",
        "12. Unrestricted", 327,
        "[OUT OF STANDARD 2025] Complete the corresponding Crimbo 2022 training task. Check the KoL wiki for current availability.",
        "Passenger greeting skill from Crimbo 2022. Check wiki for current effects."
    );
    add("Crimbo Training: Concierge", "Crimbo Training: Concierge",
        "12. Unrestricted", 328,
        "[OUT OF STANDARD 2025] Complete the corresponding Crimbo 2022 training task. Check the KoL wiki for current availability.",
        "Concierge skill from Crimbo 2022. Check wiki for current effects."
    );
    add("Crimbo Training: Track Switcher", "Crimbo Training: Track Switcher",
        "12. Unrestricted", 329,
        "[OUT OF STANDARD 2025] Complete the corresponding Crimbo 2022 training task. Check the KoL wiki for current availability.",
        "Track switching skill from Crimbo 2022. Check wiki for current effects."
    );
    add("Crimbo Training: Bartender", "Crimbo Training: Bartender",
        "12. Unrestricted", 330,
        "[OUT OF STANDARD 2025] Complete the corresponding Crimbo 2022 training task. Check the KoL wiki for current availability.",
        "Bartending skill from Crimbo 2022 -- may provide cocktailcrafting bonuses. Check wiki for current effects."
    );
    add("Crimbo Training: Waiter", "Crimbo Training: Waiter",
        "12. Unrestricted", 331,
        "[OUT OF STANDARD 2025] Complete the corresponding Crimbo 2022 training task. Check the KoL wiki for current availability.",
        "Waiting skill from Crimbo 2022. Check wiki for current effects."
    );
    add("Crimbo Training: Coal Taster", "Crimbo Training: Coal Taster",
        "12. Unrestricted", 332,
        "[OUT OF STANDARD 2025] Complete the corresponding Crimbo 2022 training task. Check the KoL wiki for current availability.",
        "Coal tasting skill from Crimbo 2022. Check wiki for current effects."
    );
    add("Crimbo Training: Dessert Steward", "Crimbo Training: Dessert Steward",
        "12. Unrestricted", 333,
        "[OUT OF STANDARD 2025] Complete the corresponding Crimbo 2022 training task. Check the KoL wiki for current availability.",
        "Dessert stewardship skill from Crimbo 2022 -- may provide food-related bonuses. Check wiki."
    );
    add("Crimbo Training: Night Watchman", "Crimbo Training: Night Watchman",
        "12. Unrestricted", 334,
        "[OUT OF STANDARD 2025] Complete the corresponding Crimbo 2022 training task. Check the KoL wiki for current availability.",
        "Night watchman skill from Crimbo 2022. Check wiki for current effects."
    );
    add("Crimbo Training: Sanitation Consultant", "Crimbo Training: Sanitation Consultant",
        "12. Unrestricted", 335,
        "[OUT OF STANDARD 2025] Complete the corresponding Crimbo 2022 training task. Check the KoL wiki for current availability.",
        "Sanitation skill from Crimbo 2022. Check wiki for current effects."
    );
    add("Crimbo Training: Graffiti Censor", "Crimbo Training: Graffiti Censor",
        "12. Unrestricted", 336,
        "[OUT OF STANDARD 2025] Complete the corresponding Crimbo 2022 training task. Check the KoL wiki for current availability.",
        "Graffiti censoring skill from Crimbo 2022. Check wiki for current effects."
    );

    // Annual / Special Event Skills
    add("Chitinous Soul", "Chitinous Soul",
        "12. Unrestricted", 337,
        "[OUT OF STANDARD 2025] Obtained from a special path or event. Check the KoL wiki for current acquisition details.",
        "Chitin-based soul skill providing armor or resistance. Check wiki for current effects."
    );
    add("Just the Facts", "Just the Facts",
        "12. Unrestricted", 338,
        "[OUT OF STANDARD 2025] Obtained from a detective-themed path or event. Check the KoL wiki for current acquisition details.",
        "Fact-based passive providing combat or info bonuses. Check wiki for current utility."
    );
    add("Too Cool", "Too Cool",
        "12. Unrestricted", 339,
        "[OUT OF STANDARD 2025] Obtained from a summer camp or special event. Check the KoL wiki for current acquisition details.",
        "Cool passive providing some bonus. Check wiki for current effects."
    );
    add("Attract Snakes", "Attract Snakes",
        "12. Unrestricted", 340,
        "[OUT OF STANDARD 2025] Obtained from a summer camp or special event. Check the KoL wiki for current acquisition details.",
        "Attracts snakes providing some combat or item effect. Check wiki for current utility."
    );
    add("Hide From Seekers", "Hide From Seekers",
        "12. Unrestricted", 341,
        "[OUT OF STANDARD 2025] Obtained from a summer camp or special event. Check the KoL wiki for current acquisition details.",
        "Hides from seekers providing a combat evasion effect. Check wiki for current utility."
    );
    add("Reindeer Games", "Reindeer Games",
        "12. Unrestricted", 342,
        "[OUT OF STANDARD 2025] Obtained from a holiday event. Check the KoL wiki for current acquisition details.",
        "Reindeer-themed games skill providing holiday bonuses. Check wiki for current effects."
    );
    add("Master Egg Hunter", "Master Egg Hunter",
        "12. Unrestricted", 343,
        "[OUT OF STANDARD 2025] Obtained from a holiday egg hunt event. Check the KoL wiki for current acquisition details.",
        "Expert egg hunting skill providing item find bonuses. Check wiki for current effects."
    );
    add("Holiday Multitasking", "Holiday Multitasking",
        "12. Unrestricted", 344,
        "[OUT OF STANDARD 2025] Obtained from a holiday event. Check the KoL wiki for current acquisition details.",
        "Multitasking during holidays providing efficiency bonuses. Check wiki for current effects."
    );
    add("SLEEP(5)", "SLEEP(5)",
        "12. Unrestricted", 345,
        "[OUT OF STANDARD 2025] Crimbo 2014 Crimbot skill. Obtained by assembling specific Crimbot ROM combinations.",
        "Robot sleep skill causing a monster or effect delay. Check wiki for current utility in Crimbot context."
    );
    add("OVERCLOCK(10)", "OVERCLOCK(10)",
        "12. Unrestricted", 346,
        "[OUT OF STANDARD 2025] Crimbo 2014 Crimbot skill. Obtained by assembling specific Crimbot ROM combinations.",
        "Overclocks robot capabilities providing speed or damage bonus. Check wiki for current effects."
    );
    add("STATS+++", "STATS+++",
        "12. Unrestricted", 347,
        "[OUT OF STANDARD 2025] Crimbo 2014 Crimbot skill. Obtained by assembling specific Crimbot ROM combinations.",
        "Massively boosts stats. Check wiki for exact stat bonuses and context."
    );
    add("Holiday Burial Knowledge", "Holiday Burial Knowledge",
        "12. Unrestricted", 348,
        "[OUT OF STANDARD 2025] Obtained from a holiday event. Check the KoL wiki for current acquisition details.",
        "Knowledge of holiday burial practices providing some bonus. Check wiki for current effects."
    );

    // Drunken Sailor skills (PirateRealm or special pirate event)
    add("Let's Beat Up This Drunken Sailor", "Let us Beat Up This Drunken Sailor",
        "12. Unrestricted", 349,
        "[OUT OF STANDARD 2025] Obtained from PirateRealm or a pirate-themed event. Check the KoL wiki for current acquisition details.",
        "Combat skill involving beating up a drunken sailor. Check wiki for damage and effects."
    );
    add("I'm Smarter Than a Drunken Sailor", "I am Smarter Than a Drunken Sailor",
        "12. Unrestricted", 350,
        "[OUT OF STANDARD 2025] Obtained from PirateRealm or a pirate-themed event. Check the KoL wiki for current acquisition details.",
        "Intelligence-based passive providing bonuses. Check wiki for current effects."
    );
    add("Look At That Drunken Sailor Dance", "Look At That Drunken Sailor Dance",
        "12. Unrestricted", 351,
        "[OUT OF STANDARD 2025] Obtained from PirateRealm or a pirate-themed event. Check the KoL wiki for current acquisition details.",
        "Dancing sailor skill providing combat or initiative effects. Check wiki for current utility."
    );
    add("Who's Going to Pay This Drunken Sailor?", "Who is Going to Pay This Drunken Sailor",
        "12. Unrestricted", 352,
        "[OUT OF STANDARD 2025] Obtained from PirateRealm or a pirate-themed event. Check the KoL wiki for current acquisition details.",
        "Payment-themed skill providing meat or item bonuses. Check wiki for current effects."
    );
    add("Only Dogs Love a Drunken Sailor", "Only Dogs Love a Drunken Sailor",
        "12. Unrestricted", 353,
        "[OUT OF STANDARD 2025] Obtained from PirateRealm or a pirate-themed event. Check the KoL wiki for current acquisition details.",
        "Dog-and-sailor themed skill. Check wiki for current effects and utility."
    );

}