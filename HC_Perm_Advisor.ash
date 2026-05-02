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
//
//  INSTALL: run HC_Perm_Advisor_install.ash to get both files,
//  or download manually from:
//  https://github.com/deomcg85/HC-Perm-Advisor
// ============================================================

import "scripts/HC_Perm_Advisor_data.ash"

// ---- DECODE COMMON HTML ENTITIES ---------------------------
string html_decode(string s) {
    s = replace_string(s, "&#39;", "'");
    s = replace_string(s, "&amp;", "&");
    s = replace_string(s, "&lt;",  "<");
    s = replace_string(s, "&gt;",  ">");
    s = replace_string(s, "&quot;", "\"");
    return s;
}

// ---- FETCH HC PERMED SKILLS FROM CHARSHEET -----------------
boolean[string] get_hc_permed_skills() {
    boolean[string] permed;
    string page = visit_url("charsheet.php");
    if (length(page) == 0) return permed;

    string marker  = "</a> (<b>HP</b>)";
    int marker_len = length(marker);
    int pos        = index_of(page, marker);

    while (pos >= 0) {
        string before     = substring(page, 0, pos);
        int    name_start = last_index_of(before, ">") + 1;
        string skill_name = html_decode(substring(page, name_start, pos));
        permed[to_lower_case(skill_name)] = true;
        pos = index_of(page, marker, pos + marker_len);
    }

    return permed;
}

// ---- INSERTION SORT ----------------------------------------
void sort_by_priority(SkillData[int] arr, int size) {
    if (size <= 1) return;
    for i from 1 to size - 1 {
        SkillData key = arr[i];
        int j = i - 1;
        while (j >= 0 && arr[j].priority > key.priority) {
            arr[j + 1] = arr[j];
            j = j - 1;
        }
        arr[j + 1] = key;
    }
}

// ---- BUILD NEEDED LIST (deduped, sorted) -------------------
SkillData[int] get_needed(boolean[string] hc_permed, boolean using_charsheet) {
    boolean[string] seen;
    SkillData[int]  result;
    int idx = 0;

    foreach i, sd in skill_db {
        if (seen contains sd.kol_name) continue;
        seen[sd.kol_name] = true;

        skill s = to_skill(sd.kol_name);
        if (s == $skill[none]) continue;

        boolean already_permed;
        if (using_charsheet) {
            already_permed = (hc_permed contains to_lower_case(sd.kol_name));
        } else {
            already_permed = have_skill(s);
        }

        if (!already_permed) {
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
    if (a == "0.5" || a == "auto")                         return "0.5. Auto-perms";
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
    if (a == "12" || a == "unrestricted")                  return "12. Unrestricted";
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
    print(" 0.5  auto         -- Auto-HC-perm skills (no ascension needed)", "black");
    print("   1  essentials   -- Do these first, regardless of bottleneck", "black");
    print("   2  near         -- Near-Essentials; strong universal skills", "black");
    print("   3  turngen      -- Turn generation and crafting savings", "black");
    print("   4  substats     -- Monster Level, substat gains, levelling", "black");
    print("   5  item         -- +Item drop %", "black");
    print("   6  survive      -- Survivability, healing, damage reduction", "black");
    print("   7  misc         -- Miscellaneous utility skills", "black");
    print("   8  mp           -- Max MP", "black");
    print("   9  meat         -- +Meat %", "black");
    print("  10  init         -- +Initiative %", "black");
    print("  11  marginal     -- Fractional turn savers; marginal gains", "black");
    print("  12  unrestricted -- Non-standard path highlights (not usable in Standard)", "black");
    print("", "");
    print("   0  top          -- Global top 5 by overall priority", "black");
    print("      all          -- Full ranked list, grouped by category", "black");
    print("", "");
}

// ---- CROSS-REFERENCE WARNING --------------------------------
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
    } else {
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

    // Special footer note for category 12
    if (cat == "12. Unrestricted") {
        print("", "");
        print("NOTE: The following skills exceed 200M meat and are not listed above:", "gray");
        print("  Sweet Synthesis (~418M) -- Converts candy to massive buffs. Does it all.", "gray");
        print("  Calculate the Universe (~500M) -- NC skill usable 1-4x/day, does substats/turns/etc.", "gray");
        print("  Both are extremely powerful but priced out of reach for most players.", "gray");
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
    cat_order[0]  = "0.5. Auto-perms";
    cat_order[1]  = "1. Essentials";
    cat_order[2]  = "2. Near-Essentials";
    cat_order[3]  = "3. Turn-Gen";
    cat_order[4]  = "4. Substats";
    cat_order[5]  = "5. +Item%";
    cat_order[6]  = "6. Survivability";
    cat_order[7]  = "7. Misc";
    cat_order[8]  = "8. Max MP";
    cat_order[9]  = "9. +Meat%";
    cat_order[10] = "10. +Init%";
    cat_order[11] = "11. Marginal";
    cat_order[12] = "12. Unrestricted";

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

    print("NOTE: Category 12 skills over 200M (Sweet Synthesis ~418M, Calculate the Universe ~500M)", "gray");
    print("      are not listed. Browse category 12 for details.", "gray");
}

// ---- MAIN --------------------------------------------------
void main(string arg) {
    build_skill_db();
    string cat = resolve_cat(arg);

    if (cat == "UNKNOWN") {
        print("Unknown option: '" + arg + "'  --  Run 'call HC_Perm_Advisor.ash' to see the menu.", "red");
        return;
    }

    // ── Standard restriction warning ────────────────────────
    // Check if the player is in a Standard-restricted ascension
    // by fetching the API status and reading the path field.
    // Standard paths include path 17 (Standard) and similar.
    // The safest check is limitmode > 0 from the API.
    boolean in_standard_run = false;
    string api_status = visit_url("api.php?what=status&for=HC_Perm_Advisor");
    if (length(api_status) > 0) {
        int lm_pos = index_of(api_status, "\"limitmode\":");
        if (lm_pos >= 0) {
            string lm_str = substring(api_status, lm_pos + 13, lm_pos + 15);
            lm_str = replace_string(lm_str, "}", "");
            lm_str = replace_string(lm_str, ",", "");
            lm_str = replace_string(lm_str, "\"", "");
            in_standard_run = (to_int(lm_str) > 0);
        }
    }

    if (in_standard_run) {
        print("", "");
        print("*** STANDARD RESTRICTION WARNING ***", "red");
        print("You appear to be in a Standard-restricted ascension.", "red");
        print("50 skills in this list are OUT OF STANDARD 2025 and", "red");
        print("cannot be acquired this run. They are flagged with", "red");
        print("[OUT OF STANDARD 2025] in their HOW TO GET text.", "red");
        print("For best results, run this script in aftercore after", "red");
        print("freeing the king from the prism.", "red");
        print("", "");
    } else if (cat != "MENU") {
        print("TIP: For most accurate results, run this script in aftercore", "gray");
        print("     after freeing the king -- all perms will be fully visible.", "gray");
        print("", "");
    }

    print("Checking HC permed skills from character sheet...", "gray");
    boolean[string] hc_permed      = get_hc_permed_skills();
    boolean         using_charsheet = (count(hc_permed) > 0);

    if (using_charsheet) {
        print("Found " + count(hc_permed) + " HC permed skill(s) on your character sheet.", "gray");
    } else {
        print("Could not fetch character sheet -- falling back to have_skill() detection.", "orange");
        print("For accurate results, run this script when KoLmafia is not auto-adventuring.", "orange");
    }
    print("", "");

    SkillData[int] needed = get_needed(hc_permed, using_charsheet);

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