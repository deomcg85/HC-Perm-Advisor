# Hardcore Skill Perm Advisor

A [KoLmafia](https://wiki.kolmafia.us/index.php/KoLmafia) ASH script for [Kingdom of Loathing](https://www.kingdomofloathing.com/) that compares your character's permanently HC-permed skills against a curated priority list and advises what to perm next — including exactly how to get each skill.

Based on **[The Ascension Speed Show's Hardcore (and Softcore) Standard Perm Tier List](https://docs.google.com/spreadsheets/d/1UG68Vl_5V-EqQXdyF2QMehdZ43Gh78pwD3R0UC_bky4/)** by Aenimus (#2273519) & Lyft (#3045223).

---

## Features

- **Accurate HC perm detection** — fetches your character sheet directly to identify only truly HC-permed skills, not just skills you currently have access to in-run
- **Category menu** — organises skills by what is bottlenecking your runs (essentials, turn gen, survivability, +item%, unrestricted highlights, and more)
- **Priority order** — follows the tier list's ascension order exactly, so you always work on the most impactful skill first
- **Detailed advice** — tells you *how* to get each skill (which class run and level, Dread Machine combo, PvP swagger cost, mall item price, IOTM cost, etc.)
- **Cross-reference warnings** — if you browse a specific category, the script warns you if there are higher-priority core ascension skills you have not done yet
- **Full list mode** — see every un-permed skill grouped by category

---

## Requirements

- [KoLmafia](https://github.com/kolmafia/kolmafia/releases) (any recent version)

---

## Installation

1. Download `HC_Perm_Advisor.ash`
2. Place it in your KoLmafia `scripts/` folder
   - The exact path can be found in KoLmafia under **General → Preferences → Script location**

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

## Skill Coverage

The script covers **154 skills** across all 13 tier categories, including:

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

---

## How Perm Detection Works

The script fetches your character sheet (`charsheet.php`) at startup and parses every skill marked as Hardcore Permanent (`HP`). This means:

- **Works correctly mid-ascension** — only skills you have actually HC-permed are marked as done, even if you currently have class skills available in-run
- **Requires an active KoLmafia session** — the script needs to be able to reach the KoL game server. If KoLmafia is busy auto-adventuring, wait for it to finish or stop automation before running
- **Falls back gracefully** — if the character sheet cannot be fetched, the script falls back to `have_skill()` detection and warns you that results may be inaccurate

---

## Feedback & Contributing

This is a community tool and feedback from experienced ascenders is very welcome! If you find:

- A skill that is missing or miscategorised
- Wrong priority ordering compared to the tier list
- A "how to get" description that is inaccurate or outdated
- Any ASH bugs or KoLmafia compatibility issues
- Skills whose mall prices have changed significantly

Please open an **[Issue](../../issues)** or submit a **Pull Request**.

---

## Credits

- Tier list by **Aenimus (#2273519)** and **Lyft (#3045223)** — [The Ascension Speed Show](https://discord.gg/tbUCRT5)
- Script by **deomcg85**

---

## License

MIT — see [LICENSE](LICENSE) for details.
