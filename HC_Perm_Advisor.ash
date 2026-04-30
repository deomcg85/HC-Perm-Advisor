// ============================================================
//  HC_Perm_Advisor.ash  v3
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
//    essentials  near  turngen  substats  item
//    survive     misc  mp       meat      init  marginal
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

    // GET ASAP (priority 0, filed under Essentials)
    add("Transcendent Olfaction", "Transcendent Olfaction",
        "1. Essentials", 0,
        "Buy 'Manual of Transcendent Olfaction' from the Bounty Hunter Hunter's Shack for 200 filthy lucre. Farm daily bounties -- expect 2-3 months.",
        "One of the best skills in the game. Queues 3 copies of a monster and makes them ignore queue rejection. Saves countless turns every run."
    );

    // Main ascension order 1-22
    add("Pastamastery", "Pastamastery",
        "1. Essentials", 1,
        "Play a Pastamancer (PM) run. Skill unlocks at Level 5.",
        "Summons 3 dry noodles/day. Core turn gen via pasta dishes, especially combined with scrumptious reagent ingredients."
    );
    add("Superhuman Cocktailcrafting", "Superhuman Cocktailcrafting",
        "1. Essentials", 2,
        "Play a Disco Bandit (DB) run. Skill unlocks at Level 15. Perm this BEFORE Advanced Cocktailcrafting so you get Nash Crosby's Still access immediately in the next run.",
        "Summons +2 AC ingredients/day. Unlocks Nash Crosby's Still as a Moxie class -- gives Superhuman cocktails and cheap MP via soda water to tonic water."
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
        "Play a Disco Bandit (DB) run. Skill unlocks at Level 9.",
        "Saves 1 turn per 5 crafting actions. Very valuable if you craft food, booze, and reagents every day."
    );
    add("Torso Awaregness", "Torso Awaregness",
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
        "Buy the spellbook from the Dungeoneer's Association Vending Machine (Daily Dungeon area) or the mall. Check current pricing.",
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
        "+level*2 ML (e.g. +18 ML at level 9). Scales -- add a little at a time. Likely gives more substats than flat +10 ML options."
    );
    add("Tao of the Terrapin", "Tao of the Terrapin",
        "6. Survivability", 22,
        "Play a Turtle Tamer (TT) run. Skill unlocks at Level 15.",
        "Doubles the power of hats and pants for Damage Absorption. Vastly improves survivability at all stages of the game."
    );

    // Near-Essentials (30-39)
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

    // Turn-Gen / Savings (40-49)
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

    // Substats (50-59, beyond ascension order)
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

    // +Item% (60-69)
    add("Singer's Faithful Ocelot", "Singer's Faithful Ocelot",
        "5. +Item%", 60,
        "Buy the spellbook from the Dungeoneer's Association Vending Machine (~15 fat loot tokens from Daily Dungeon) or the mall (~200,000 meat).",
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
        "Buy 'Hodgman's Journal #1: The Lean Times' from the mall (~5,000,000 meat).",
        "+5% item (passive). Expensive for the bonus."
    );

    // Survivability (70-79, beyond ascension order)
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

    // Misc (80-82)
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

    // Max MP (83-89)
    add("Thick-Skinned", "Thick-Skinned",
        "8. Max MP", 83,
        "Farm PvP fights daily to earn 2,000 swagger, then buy 'How to Tolerate Jerks' from the PvP store. Takes ~1 month. Auto-HC perms itself.",
        "+10 max HP AND +10 max MP. Underrated. Helps survivability AND reaching MP for key buffs. Auto-HC perms -- never have to think about it again."
    );
    add("Wisdom of the Elder Tortoises", "Wisdom of the Elder Tortoises",
        "8. Max MP", 84,
        "Play a Turtle Tamer (TT) run. Skill unlocks at Level 11.",
        "+50% max MP. Huge percentage bonus, especially valuable early in runs."
    );
    add("Slimy Synapses", "Slimy Synapses",
        "8. Max MP", 85,
        "Fight Mother Slime in the Slime Tube to collect slime-soaked brain drops. Each drop upgrades skill +1 max MP, caps at 10 upgrades. Glands can be costly.",
        "+10 max MP total at max upgrades. Flat +MP is best early when it matters for casting buffs."
    );
    add("Blood Sugar Sauce Magic", "Blood Sugar Sauce Magic",
        "8. Max MP", 86,
        "Play a Sauceror (SA) run. Skill unlocks at Level 15.",
        "+10% max MP (-10% max HP), or 30%/-30% as SA. Toggleable -- turn on for MP, off when you need HP."
    );

    // +Meat% (90-99)
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
        "5% discount at all NPC stores. Not a %meat buff directly but saves a meaningful amount over a full run."
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
        "Buy 'Hodgman's Journal #2: Entrepreneurythmics' from the mall (~2,000,000 meat).",
        "+10% meat. Will eventually pay for itself over many runs."
    );

    // +Init% (100-109)
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
        "Buy the spellbook from the Dungeoneer's Association Vending Machine (~15 fat loot tokens) or the mall (~200,000 meat).",
        "+10% initiative (10 turns, 5 MP). Cheap addition to other initiative sources."
    );

    // Marginal / Expensive (110+)
    add("Chip on Your Shoulder", "Chip on Your Shoulder",
        "11. Marginal", 110,
        "Farm PvP fights to earn 3,000 swagger, then buy 'How to Hold a Grudge' from the PvP store. Takes 1+ months.",
        "+5 rollover PvP fights/day. Marginally helps you earn swagger for better PvP skills faster."
    );
    add("Abs of Tin", "Abs of Tin",
        "11. Marginal", 111,
        "Buy 'Hodgman's Journal #3: Pumping Tin' from the mall (~800,000 meat).",
        "+10% max HP. Cheap enough to be worth picking up eventually."
    );
    add("Marginally Insane", "Marginally Insane",
        "11. Marginal", 112,
        "Buy 'Hodgman's Journal #4: View From The Big Top' from the mall (~1,000,000 meat).",
        "+10% max MP. Flat +max MP is better early but this is cheap enough to be worthwhile later."
    );
    add("20/20 Vision", "20/20 Vision",
        "11. Marginal", 113,
        "Buy the 'do-it-yourself laser eye surgery kit' from the mall (Old Raffle prize, ~29,000,000 meat). Auto-HC perms.",
        "+10% item (passive). Very expensive for the bonus. Auto-HC perms itself."
    );
    add("Brain Games", "Brain Games",
        "11. Marginal", 114,
        "Buy the 'electronic Brain Trainer game' from the mall (Old Raffle prize, ~180,000,000 meat).",
        "+3 rollover adventures/day. Ridiculously expensive. Low priority unless you have meat to burn."
    );
    add("Request Sandwich", "Request Sandwich",
        "11. Marginal", 115,
        "Obtain 'note from Clancy' as a reward from multiple Avatar of Boris ascensions.",
        "Summons a P.B.L.T. (2.66 adv/fullness, 50% success rate). Marginal at best."
    );
}

// ---- INSERTION SORT ----------------------------------------
void sort_by_priority(SkillData[int] arr, int size) {
    if (size <= 1) return;
    for i from 1 to size - 1 {
        SkillData key = arr[i];
        int j = i - 1;
        while (j >= 0 && arr[j].priority > key.priority) {
            arr[j + 1] = arr[j];
            j -= 1;
        }
        arr[j + 1] = key;
    }
}

// ---- IS PERMED ---------------------------------------------
boolean is_permed(string skill_name) {
    skill s = to_skill(skill_name);
    if (s == $skill[none]) return false;
    return have_skill(s);
}

// ---- BUILD NEEDED LIST (deduped, sorted) -------------------
SkillData[int] get_needed() {
    boolean[string] seen;
    SkillData[int] result;
    int idx = 0;
    foreach i, sd in skill_db {
        if (seen contains sd.kol_name) continue;
        seen[sd.kol_name] = true;
        skill s = to_skill(sd.kol_name);
        if (s == $skill[none]) continue;
        if (!have_skill(s)) {
            result[idx] = sd;
            idx += 1;
        }
    }
    sort_by_priority(result, idx);
    return result;
}

// ---- RESOLVE ARGUMENT TO CATEGORY --------------------------
string resolve_cat(string arg) {
    string a = to_lower_case(arg);
    if (a == "")                                           return "MENU";
    if (a == "top" || a == "0")                            return "TOP";
    if (a == "all")                                        return "ALL";
    if (a == "1" || a == "essentials" || a == "essential") return "1. Essentials";
    if (a == "2" || a == "near")                           return "2. Near-Essentials";
    if (a == "3" || a == "turngen" || a == "turn")         return "3. Turn-Gen";
    if (a == "4" || a == "substats" || a == "substat")     return "4. Substats";
    if (a == "5" || a == "item")                           return "5. +Item%";
    if (a == "6" || a == "survive" || a == "survival")     return "6. Survivability";
    if (a == "7" || a == "misc")                           return "7. Misc";
    if (a == "8" || a == "mp")                             return "8. Max MP";
    if (a == "9" || a == "meat")                           return "9. +Meat%";
    if (a == "10" || a == "init" || a == "initiative")     return "10. +Init%";
    if (a == "11" || a == "marginal")                      return "11. Marginal";
    return "UNKNOWN";
}

// ---- PRINT ONE SKILL BLOCK ---------------------------------
void print_skill(int rank, SkillData sd) {
    print("#" + rank + "  " + sd.display_name + "  [" + sd.category + "]", "blue");
    print("   HOW TO GET : " + sd.how_to_get, "black");
    print("   WHY        : " + sd.notes, "black");
    print("", "");
}

// ---- PRINT CATEGORY MENU -----------------------------------
void print_menu(int total) {
    print("", "");
    print("=============================================================", "blue");
    print("  Hardcore Skill Perm Advisor  -- What is bottlenecking your runs?", "blue");
    print("  Based on tier list by Aenimus & Lyft (The Ascension Speed Show)", "blue");
    print("  Currently usable un-permed skills remaining: " + total, "blue");
    print("=============================================================", "blue");
    print("", "");
    print("  Run:  call HC_Perm_Advisor.ash [number or keyword]", "black");
    print("", "");
    print("   1  essentials  -- Do these first, regardless of bottleneck", "black");
    print("   2  near        -- Near-Essentials; strong universal skills", "black");
    print("   3  turngen     -- Turn generation and crafting savings", "black");
    print("   4  substats    -- Monster Level, substat gains, levelling", "black");
    print("   5  item        -- +Item drop %", "black");
    print("   6  survive     -- Survivability, healing, damage reduction", "black");
    print("   7  misc        -- Miscellaneous utility skills", "black");
    print("   8  mp          -- Max MP", "black");
    print("   9  meat        -- +Meat %", "black");
    print("  10  init        -- +Initiative %", "black");
    print("  11  marginal    -- Expensive or low-gain skills", "black");
    print("", "");
    print("   0  top         -- Global top 5 by overall priority", "black");
    print("      all         -- Full ranked list, grouped by category", "black");
    print("", "");
    print("  Tip: use the flowchart at https://imgur.com/a/4hF9rD5", "gray");
    print("       to help decide which category fits your situation.", "gray");
    print("", "");
}

// ---- CROSS-REFERENCE WARNING --------------------------------
// Only warns about main ascension order skills (priority <= 22)
// that are un-permed and sit below the chosen category's floor.
void print_crossref(SkillData[int] needed, string selected_cat) {
    int cat_min = 9999;
    foreach i, sd in needed {
        if (sd.category == selected_cat && sd.priority < cat_min) {
            cat_min = sd.priority;
        }
    }
    if (cat_min == 9999) return;

    SkillData[int] blockers;
    int bcount = 0;
    foreach i, sd in needed {
        if (sd.priority <= 22 && sd.priority < cat_min) {
            blockers[bcount] = sd;
            bcount += 1;
        }
    }
    if (bcount == 0) return;

    print("WARNING: Higher-priority ascension skills still un-permed:", "orange");
    int show = min(3, bcount);
    for i from 0 to show - 1 {
        SkillData sd = blockers[i];
        print("  #" + sd.priority + "  " + sd.display_name + "  [" + sd.category + "]", "orange");
    }
    if (bcount > show) {
        print("  (and " + (bcount - show) + " more -- run 'call HC_Perm_Advisor.ash essentials' to see all)", "orange");
    }
    print("  Consider tackling those first before this category.", "orange");
    print("", "");
}

// ---- SHOW: GLOBAL TOP 5 ------------------------------------
void show_top(SkillData[int] needed) {
    int total = count(needed);
    print("", "");
    print("=============================================================", "blue");
    print("  Hardcore Skill Perm Advisor  --  Global Top 5", "blue");
    print("=============================================================", "blue");
    print("", "");
    if (total == 0) {
        print("You have permed everything on the tier list!", "green");
        return;
    }
    int display = min(5, total);
    print("Showing " + display + " of " + total + " un-permed skills:", "black");
    print("", "");
    for i from 0 to display - 1 {
        print_skill(i + 1, needed[i]);
    }
    if (total > 5) {
        print("... and " + (total - 5) + " more.", "gray");
        print("Run 'call HC_Perm_Advisor.ash all' for the full list.", "gray");
    }
}

// ---- SHOW: CATEGORY ----------------------------------------
void show_category(SkillData[int] needed, string cat) {
    SkillData[int] cat_skills;
    int ccount = 0;
    foreach i, sd in needed {
        if (sd.category == cat) {
            cat_skills[ccount] = sd;
            ccount += 1;
        }
    }

    print("", "");
    print("=============================================================", "blue");
    print("  Hardcore Skill Perm Advisor  --  " + cat, "blue");
    print("=============================================================", "blue");
    print("", "");

    print_crossref(needed, cat);

    if (ccount == 0) {
        print("You have permed all skills in this category!", "green");
        return;
    }

    int display = min(5, ccount);
    print("Top " + display + " un-permed in this category (" + ccount + " remaining):", "black");
    print("", "");
    for i from 0 to display - 1 {
        print_skill(i + 1, cat_skills[i]);
    }
    if (ccount > 5) {
        print("... and " + (ccount - 5) + " more in this category.", "gray");
        print("Run 'call HC_Perm_Advisor.ash all' to see everything.", "gray");
    }
}

// ---- SHOW: FULL LIST GROUPED BY CATEGORY -------------------
void show_all(SkillData[int] needed) {
    int total = count(needed);
    print("", "");
    print("=============================================================", "blue");
    print("  Hardcore Skill Perm Advisor  --  All Un-Permed Skills (" + total + " remaining)", "blue");
    print("=============================================================", "blue");
    print("", "");

    if (total == 0) {
        print("You have permed everything on the tier list!", "green");
        return;
    }

    string[int] cat_order;
    cat_order[0]  = "1. Essentials";
    cat_order[1]  = "2. Near-Essentials";
    cat_order[2]  = "3. Turn-Gen";
    cat_order[3]  = "4. Substats";
    cat_order[4]  = "5. +Item%";
    cat_order[5]  = "6. Survivability";
    cat_order[6]  = "7. Misc";
    cat_order[7]  = "8. Max MP";
    cat_order[8]  = "9. +Meat%";
    cat_order[9]  = "10. +Init%";
    cat_order[10] = "11. Marginal";

    int global_rank = 1;
    foreach ci, cat in cat_order {
        SkillData[int] cat_skills;
        int ccount = 0;
        foreach i, sd in needed {
            if (sd.category == cat) {
                cat_skills[ccount] = sd;
                ccount += 1;
            }
        }
        if (ccount == 0) continue;

        print("-- " + cat + " (" + ccount + " remaining) --", "blue");
        print("", "");
        foreach i, sd in cat_skills {
            print_skill(global_rank, sd);
            global_rank += 1;
        }
    }
}

// ---- MAIN --------------------------------------------------
void main(string arg) {
    build_skill_db();
    string cat = resolve_cat(arg);

    if (cat == "UNKNOWN") {
        print("Unknown option: '" + arg + "'  --  Run 'call HC_Perm_Advisor.ash' to see the menu.", "red");
        return;
    }

    SkillData[int] needed = get_needed();

    if (cat == "MENU") {
        print_menu(count(needed));
    } else if (cat == "TOP") {
        show_top(needed);
        print("Based on tier list by Aenimus & Lyft (The Ascension Speed Show) -- Jan 2025", "gray");
    } else if (cat == "ALL") {
        show_all(needed);
        print("Based on tier list by Aenimus & Lyft (The Ascension Speed Show) -- Jan 2025", "gray");
    } else {
        show_category(needed, cat);
        print("Based on tier list by Aenimus & Lyft (The Ascension Speed Show) -- Jan 2025", "gray");
    }
}
