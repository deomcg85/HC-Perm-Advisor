# Hardcore Skill Perm Advisor

A [KoLmafia](https://wiki.kolmafia.us/index.php/KoLmafia) ASH script for [Kingdom of Loathing](https://www.kingdomofloathing.com/) that compares your character's permanently permed skills against a curated priority list and advises what to perm next — including exactly how to get each skill.

Based on **[The Ascension Speed Show's Hardcore (and Softcore) Standard Perm Tier List](https://docs.google.com/spreadsheets/d/1UG68Vl_5V-EqQXdyF2QMehdZ43Gh78pwD3R0UC_bky4/)** by Aenimus (#2273519) & Lyft (#3045223).

---

## Features

- **Category menu** — organises skills by what's bottlenecking your runs (turn gen, survivability, +item%, etc.)
- **Priority order** — follows the tier list's ascension order exactly, so you always work on the most impactful skill first
- **Detailed advice** — tells you *how* to get each skill (which class run and level, Dread Machine combo, PvP swagger cost, mall item price, etc.)
- **Cross-reference warnings** — if you browse a specific category, the script warns you if there are higher-priority core ascension skills you haven't done yet
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
Displays all available categories and the full list of commands. Start here if you're not sure what to work on next.

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
| 11 | `marginal` | Expensive or low-gain skills |

**Examples:**
```
call HC_Perm_Advisor.ash 5
call HC_Perm_Advisor.ash item
call HC_Perm_Advisor.ash survive
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

## Known Limitations

### Mid-ascension accuracy
The script uses KoLmafia's `have_skill()` function to detect permed skills. This works perfectly **between ascensions**, but during a run `have_skill()` also returns true for your current class's native skills — which means skills you haven't actually permed yet may appear as done.

**Recommendation: run this script between ascensions for accurate results.** During a run it's still useful for the "how to get" advice, but the count of remaining skills will be lower than reality.

This is a known issue being worked on. If you know of a reliable KoLmafia ASH method to detect *only* permanently permed skills mid-run, please open an issue or pull request!

---

## Skill Coverage

The script covers ~60 skills across all 11 tier categories from the tier list, including:

- **Class run skills** — all six classes (SC, DB, AT, PM, TT, SA), with the level required
- **Dread Machine skills** — class combos needed and Skull Capacitor cost (~3,500,000 meat)
- **PvP swagger skills** — which skillbook, approximate grind time
- **Mall purchase skills** — Hodgman's journals, raffle prizes, approximate meat cost
- **Dungeoneer's Association** — fat loot token costs
- **Bounty Hunter Hunter** — filthy lucre cost and grind time estimate
- **Slime Tube skills** — Mother Slime farming notes
- **Gnome Moon Sign** — which sign and alternatives

---

## Feedback & Contributing

This is an early version and feedback from experienced ascenders is very welcome! If you find:

- A skill that's missing or miscategorised
- Wrong priority ordering
- A "how to get" description that's inaccurate or outdated
- A fix for the mid-ascension `have_skill()` limitation
- Any ASH bugs or KoLmafia compatibility issues

Please open an **[Issue](../../issues)** or submit a **Pull Request**.

---

## Credits

- Tier list by **Aenimus (#2273519)** and **Lyft (#3045223)** — [The Ascension Speed Show](https://discord.gg/tbUCRT5)
- Script by **deomcg85**

---

## License

MIT — see [LICENSE](LICENSE) for details.
