# Hardcore Skill Perm Advisor

A [KoLmafia](https://wiki.kolmafia.us/index.php/KoLmafia) ASH script for [Kingdom of Loathing](https://www.kingdomofloathing.com/) that compares your character's permanently HC-permed skills against a curated priority list and advises what to perm next — including exactly how to get each skill.

Based on **[The Ascension Speed Show's Hardcore (and Softcore) Standard Perm Tier List](https://docs.google.com/spreadsheets/d/1UG68Vl_5V-EqQXdyF2QMehdZ43Gh78pwD3R0UC_bky4/)** by Aenimus (#2273519) & Lyft (#3045223).

---

## Features

- **Accurate HC perm detection** — fetches your character sheet directly to identify only truly HC-permed skills, not just skills you currently have access to in-run
- **Standard restriction warnings** — detects if you are in a Standard-restricted ascension and warns you; all 50 out-of-Standard 2025 skills are flagged in their How to Get text
- **Category menu** — organises skills by what is bottlenecking your runs (essentials, turn gen, survivability, +item%, unrestricted highlights, and more)
- **Priority order** — follows the tier list's ascension order exactly, so you always work on the most impactful skill first
- **Detailed advice** — tells you exactly how to get each skill (which class run and level, Dread Machine combo, PvP swagger cost, mall item price, IOTM cost, etc.)
- **Cross-reference warnings** — if you browse a specific category, the script warns you if there are higher-priority core ascension skills you have not done yet
- **Full list mode** — see every un-permed skill grouped by category

---

## When to Run This Script

**Best time: aftercore, after freeing the king from the prism.**

- All your HC perms will be fully visible on your character sheet
- Standard restrictions do not apply in aftercore
- The skill count will be accurate with nothing hidden or locked

The script will still work mid-ascension — it fetches your character sheet directly so it reads your actual HC perms rather than just your current class skills. However:

- If you are in a **Standard-restricted** ascension, the script will display a red warning and 50 skills will be flagged as `[OUT OF STANDARD 2025]` in their How to Get text — these cannot be acquired during a Standard run
- **Expert Corner-Cutter** is a special case: the Disco Bandit class version (Level 9) is Standard-legal; only the LyleCo Contractor's Manual version is restricted

---

## Installation

1. Download both files from this repository:
   - `HC_Perm_Advisor.ash`
   - `HC_Perm_Advisor_data.ash`
2. Place **both** files in your KoLmafia `scripts/` folder
   - On Mac: `/Users/[yourname]/Library/Application Support/KoLmafia/scripts/`
   - On Windows: usually `C:\Users\[yourname]\KoLmafia\scripts\`
   - Or check the exact location in KoLmafia under **General → Preferences → Script location**
3. Run it from the KoLmafia gCLI:
```
call HC_Perm_Advisor.ash
```

> **Both files must be present in the same scripts folder.** The main script will not run without the data file.

### Updating

To update to the latest version, download both files again from this page and overwrite the existing ones in your scripts folder.

---

## Usage

Run commands from the KoLmafia gCLI (the command line at the bottom of the relay browser or desktop app).

### Show the category menu
```
call HC_Perm_Advisor.ash
```
Displays all available categories and the full list of commands. Start here if you are not sure what to work on next.

### Global top 5 by overall priority
```
call HC_Perm_Advisor.ash top
```
Shows the next 5 skills to perm regardless of category — best if you just want to follow the list in order.

### Browse a specific category
```
call HC_Perm_Advisor.ash [number or keyword]
```

| Number | Keyword | Category |
|--------|---------|----------|
| 0.5 | `auto` | Auto-HC-perm skills (no ascension needed) |
| 1 | `essentials` | Do these first, regardless of bottleneck |
| 2 | `near` | Near-Essentials; strong universal skills |
| 3 | `turngen` | Turn generation and crafting savings |
| 4 | `substats` | Monster Level, substat gains, levelling |
| 5 | `item` | +Item drop % |
| 6 | `survive` | Survivability, healing, damage reduction |
| 7 | `misc` | Miscellaneous utility skills |
| 8 | `mp` | Max MP |
| 9 | `meat` | +Meat % |
| 10 | `init` | +Initiative % |
| 11 | `marginal` | Fractional turn savers; marginal gains |
| 12 | `unrestricted` | Non-standard path highlights (not usable in Standard) |

**Examples:**
```
call HC_Perm_Advisor.ash auto
call HC_Perm_Advisor.ash 5
call HC_Perm_Advisor.ash item
call HC_Perm_Advisor.ash survive
call HC_Perm_Advisor.ash unrestricted
```

### Full list of everything un-permed
```
call HC_Perm_Advisor.ash all
```
Shows all un-permed skills from the tier list, grouped by category in priority order.

---

## Example Output

```
=============================================================
  Hardcore Skill Perm Advisor  --  5. +Item%
=============================================================

WARNING: Higher-priority ascension skills still un-permed:
  #7  Smooth Movements  [1. Essentials]
  #11 Expert Corner-Cutter  [1. Essentials]
  Consider tackling those first before this category.

Top 3 un-permed in this category (7 remaining):

#1  Mad Looting Skillz  [5. +Item%]
   HOW TO GET : Play a Disco Bandit (DB) run. Skill unlocks at Level 8.
   WHY        : +20% item drops (passive). The highest passive +item% in the game.

#2  Fat Leon's Phat Loot Lyric  [5. +Item%]
   HOW TO GET : Play an Accordion Thief (AT) run. Skill unlocks at Level 7.
   WHY        : +20% item drops as an AT Song. Stack with Mad Looting Skillz for a large total item bonus.
...
```

---

## File Structure

| File | Purpose |
|------|---------|
| `HC_Perm_Advisor.ash` | Main script — all logic, display, and perm detection. ~383 lines. |
| `HC_Perm_Advisor_data.ash` | Skill database — all 283 skills with priority, source, and notes. ~1,547 lines. Edit this file to add or change skills. |

---

## Skill Coverage

The script covers **283 skills** across all 13 tier categories, including:

**Standard-legal skills:**
- **Class run skills** — all six classes (SC, DB, AT, PM, TT, SA) with the level required
- **Dread Machine skills** — class combos needed and Skull Capacitor cost (~3,500,000 meat)
- **PvP swagger skills** — which skillbook and approximate grind time
- **Mall purchase skills** — Hodgman's journals, approximate meat cost
- **Dungeoneer's Association** — fat loot token costs
- **Bounty Hunter Hunter** — filthy lucre cost and grind time estimate
- **Slime Tube farming** — Mother Slime drop notes
- **Gnome Moon Sign / Melvign quest** — Torso Awareness acquisition paths
- **Spookyraven Manor skills** — which manor area drops them

**Unrestricted path highlights (Category 12):**
- LT&T skillbooks (Steely-Eyed Squint, Bend Hell, Bow-Legged Swagger)
- IOTM skills under 200M meat (Emotion Chip, Comprehensive Cartography, Bird-A-Day Calendar)
- Auto-HC-perming Fortune Teller, Neverending Party, and Crimbo skills
- Free kill and banish skills (Shattering Punch, Snokebomb, Gingerbread Mob Hit)
- Elemental resistance passives (Hypersane, Refusal to Freeze, Olfactory Burnout, etc.)
- Spacegate reward skills

> Skills costing over 200M meat (Sweet Synthesis ~418M, Calculate the Universe ~500M) are noted in the category footer but not listed as recommendations.

**143 of the 283 skills are Out of Standard 2025** and are flagged with `[OUT OF STANDARD 2025]` in their How to Get text. These can still be HC-permed in unrestricted or non-Standard paths.

---

## How Perm Detection Works

The script fetches your character sheet (`charsheet.php`) at startup and parses every skill marked as Hardcore Permanent. This means:

- **Works correctly mid-ascension** — only skills you have actually HC-permed are marked as done, even if you currently have class skills available in-run
- **Requires an active KoLmafia session** — if KoLmafia is busy auto-adventuring, wait for it to finish or stop automation before running
- **Detects Standard restrictions** — reads your current path from the KoL API and warns you if you are in a Standard-restricted run
- **Falls back gracefully** — if the character sheet cannot be fetched, the script falls back to `have_skill()` detection and warns you that results may be inaccurate

---

## Contributing

Skill data lives entirely in `HC_Perm_Advisor_data.ash`, kept separate from the logic on purpose — if you want to add a skill, fix a priority, or update a mall price, that is the only file you need to touch.

If you find:
- A skill that is missing or miscategorised
- Wrong priority ordering compared to the tier list
- A How to Get description that is inaccurate or outdated
- Any ASH bugs or KoLmafia compatibility issues
- Skills whose mall prices have changed significantly
- Standard restriction list changes for 2026

Please open an **[Issue](../../issues)** or submit a **Pull Request**.

---

## Credits

- Tier list by **Aenimus (#2273519)** and **Lyft (#3045223)** — [The Ascension Speed Show](https://discord.gg/tbUCRT5)
- Script by **deomcg85**

---

## License

MIT — see [LICENSE](LICENSE) for details.
