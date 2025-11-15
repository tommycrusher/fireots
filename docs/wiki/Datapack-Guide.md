# Fireots Datapack Documentation

This guide explains how to create custom content for Fireots using the datapack system.

## Table of Contents

- [Overview](#overview)
- [Datapack Structure](#datapack-structure)
- [Script System](#script-system)
- [Creating Monsters](#creating-monsters)
- [Creating NPCs](#creating-npcs)
- [Creating Items](#creating-items)
- [Creating Spells](#creating-spells)
- [Quest System](#quest-system)
- [Best Practices](#best-practices)

## Overview

Fireots uses a **datapack system** to organize game content. A datapack is a collection of:

- **Scripts** (Lua) - Game logic, events, actions
- **Monsters** (XML) - Monster definitions
- **NPCs** (XML) - NPC definitions and behaviors
- **World Data** (OTBM) - Map files
- **Migrations** (SQL) - Database schema updates

### Active Datapack

The active datapack is configured in `config.lua`:

```lua
dataPackDirectory = "data-fire"  -- Fireots custom content
-- dataPackDirectory = "data-canary"  -- Legacy Canary content
```

### Datapack Locations

- `data/` - **Core framework** (shared across all datapacks, DO NOT MODIFY)
  - `data/libs/` - Core Lua libraries
  - `data/events/` - Event system
  - `data/items/items.xml` - Base item definitions

- `data-fire/` - **Fireots datapack** (your custom content goes here)
  - `data-fire/scripts/` - Custom scripts
  - `data-fire/monster/` - Custom monsters
  - `data-fire/npc/` - Custom NPCs
  - `data-fire/world/` - Map files

---

## Datapack Structure

### Complete data-fire/ Layout

```
data-fire/
├── scripts/
│   ├── actions/          # Use-item scripts (e.g., levers, doors)
│   ├── creaturescripts/  # Player/monster events (login, death, etc.)
│   ├── globalevents/     # Server-wide events (startup, time-based)
│   ├── movements/        # Tile step scripts (teleports, traps)
│   ├── quests/           # Quest-specific scripts
│   ├── spells/           # Spell implementations
│   ├── systems/          # Game systems (guilds, mounts, etc.)
│   ├── weapons/          # Weapon scripts
│   └── custom/           # Your custom scripts
│
├── monster/
│   ├── humanoids/        # Human-like monsters
│   ├── undeads/          # Undead creatures
│   ├── dragons/          # Dragon types
│   └── custom/           # Your custom monsters
│
├── npc/
│   ├── merchants/        # Shop NPCs
│   ├── quest_givers/     # Quest NPCs
│   └── custom/           # Your custom NPCs
│
├── world/
│   └── fire.otbm         # Main world map
│
└── migrations/
    └── *.sql             # Database migrations
```

---

## Script System

### Script Types

Fireots uses different script types for different game events:

| Script Type | Purpose | Example |
|-------------|---------|---------|
| **Actions** | Item usage, lever pull, chest open | Using a key on a door |
| **CreatureScripts** | Player/monster lifecycle events | Player login, monster death |
| **GlobalEvents** | Server-wide timed events | Daily server save, startup tasks |
| **Movements** | Tile-based triggers | Stepping on teleport, walking over trap |
| **TalkActions** | Chat commands | `/!online`, `/!uptime` |
| **Spells** | Magic spells | Exori, Utevo Lux |
| **Weapons** | Weapon attacks | Sword hit effects |

### Creating an Action Script

**Example: Lever that teleports player**

**File**: `data-fire/scripts/actions/custom/teleport_lever.lua`

```lua
local lever = Action()

function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Check if lever is in correct position
    if item.itemid ~= 1945 then
        return false
    end

    -- Define teleport destination
    local destination = Position(100, 100, 7)

    -- Teleport player
    player:teleportTo(destination)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been teleported!")

    -- Toggle lever
    item:transform(1946)  -- Change to "used" lever graphic
    item:decay()  -- Auto-reset after some time

    return true
end

-- Register the lever (action ID)
lever:aid(5000)
lever:register()
```

**How to use**:
1. Place lever in map editor
2. Set Action ID = 5000
3. Script will trigger when lever is used

### Registering Scripts

Scripts must be registered in `data-fire/scripts/scripts.lua` (if auto-loading is disabled):

```lua
-- Load custom scripts
dofile("data-fire/scripts/actions/custom/teleport_lever.lua")
```

Or use auto-discovery by directory structure (recommended).

---

## Creating Monsters

### Monster XML Format

**File**: `data-fire/monster/custom/fire_demon.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<monster name="Fire Demon" nameDescription="a fire demon" race="fire" experience="8500" speed="220" manacost="0">
    <!-- Health and combat -->
    <health now="7200" max="7200"/>
    <look type="35" head="0" body="0" legs="0" feet="0" corpse="5995"/>

    <!-- Loot -->
    <loot>
        <item name="gold coin" countmax="198" chance="100000"/>
        <item name="platinum coin" countmax="5" chance="100000"/>
        <item name="great health potion" countmax="2" chance="15000"/>
        <item name="small ruby" countmax="3" chance="9000"/>
        <item name="fire sword" chance="7500"/>
        <item name="molten plate" chance="5000"/>
    </loot>

    <!-- Abilities and attacks -->
    <attacks>
        <attack name="melee" interval="2000" min="-250" max="-450"/>
        <attack name="fire" interval="2000" chance="15" range="7" radius="3" target="1" min="-150" max="-250">
            <attribute key="shootEffect" value="fire"/>
            <attribute key="areaEffect" value="firearea"/>
        </attack>
        <attack name="firefield" interval="2000" chance="10" range="7" radius="2" target="1">
            <attribute key="shootEffect" value="fire"/>
        </attack>
    </attacks>

    <!-- Defenses -->
    <defenses armor="45" defense="60">
        <defense name="healing" interval="2000" chance="15" min="150" max="250">
            <attribute key="areaEffect" value="blueshimmer"/>
        </defense>
        <defense name="speed" interval="2000" chance="10" speedchange="320" duration="6000">
            <attribute key="areaEffect" value="redshimmer"/>
        </defense>
    </defenses>

    <!-- Immunities -->
    <immunities>
        <immunity fire="1"/>
        <immunity paralyze="1"/>
        <immunity invisible="1"/>
    </immunities>

    <!-- Behavior -->
    <voices interval="5000" chance="10">
        <voice sentence="BURN!"/>
        <voice sentence="Feel my wrath!"/>
    </voices>

    <summons maxSummons="2">
        <summon name="fire elemental" interval="2000" chance="15"/>
    </summons>

    <!-- Flags -->
    <flags>
        <flag summonable="0"/>
        <flag attackable="1"/>
        <flag hostile="1"/>
        <flag illusionable="0"/>
        <flag convinceable="0"/>
        <flag pushable="0"/>
        <flag canpushitems="1"/>
        <flag canpushcreatures="1"/>
        <flag targetdistance="1"/>
        <flag staticattack="90"/>
        <flag runonhealth="500"/>
    </flags>
</monster>
```

### Monster Properties Explained

- **name**: Display name
- **experience**: XP rewarded on kill
- **speed**: Movement speed (higher = faster)
- **health**: Hit points
- **look**: Outfit/sprite (type = creature ID)
- **race**: Element type (affects resistances)

### Adding Monster to Spawn

Edit spawn file or create new one in `data-fire/world/`:

```xml
<spawn centerx="100" centery="100" centerz="7" radius="5">
    <monster name="Fire Demon" x="-2" y="3" z="0" spawntime="300"/>
</spawn>
```

---

## Creating NPCs

### NPC XML Format

**File**: `data-fire/npc/custom/blacksmith.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<npc name="Blacksmith Tom" script="blacksmith.lua" walkinterval="2000" floorchange="0" speed="150">
    <health now="100" max="100"/>
    <look type="128" head="0" body="87" legs="88" feet="88" addons="0"/>
</npc>
```

### NPC Lua Script

**File**: `data-fire/npc/scripts/blacksmith.lua`

```lua
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

-- Shop items
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem(
    {'sword'}, 2376, 85, 'sword'
)
shopModule:addBuyableItem(
    {'club'}, 2382, 5, 'club'
)
shopModule:addBuyableItem(
    {'axe'}, 2386, 7, 'axe'
)

shopModule:addSellableItem(
    {'sword'}, 2376, 35, 'sword'
)

-- Greeting
npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|! I sell weapons. Ask me for a {trade} to see my wares.")

npcHandler:addModule(FocusModule:new())
```

### Advanced NPC: Quest Giver

```lua
local function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)

    if msgcontains(msg, "quest") then
        if player:getStorageValue(1000) < 1 then
            npcHandler:say("I need you to retrieve a {magic sword} from the dragon cave. Will you help me?", cid)
            npcHandler.topic[cid] = 1
        else
            npcHandler:say("You already completed my quest!", cid)
        end
    elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 1 then
        player:setStorageValue(1000, 1)  -- Mark quest as started
        player:addItem(2111, 1)  -- Give quest item (map)
        npcHandler:say("Thank you! Take this map. It shows the cave location.", cid)
        npcHandler.topic[cid] = 0
    end

    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
```

---

## Creating Items

Items are defined in `data/items/items.xml` (core) or can be extended in custom XML.

### Custom Item Example

```xml
<item id="10000" name="fire blade">
    <attribute key="description" value="A blade forged in dragon fire."/>
    <attribute key="weight" value="5000"/>  <!-- 50.00 oz -->
    <attribute key="attack" value="50"/>
    <attribute key="defense" value="30"/>
    <attribute key="weaponType" value="sword"/>
    <attribute key="slotType" value="two-handed"/>
</item>
```

### Item Script (Actions)

```lua
local fireBlade = Action()

function fireBlade.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not target:isCreature() then
        return false
    end

    -- Fire damage on hit
    doTargetCombatHealth(0, target, COMBAT_FIREDAMAGE, -100, -200, CONST_ME_FIREATTACK)

    return true
end

fireBlade:id(10000)  -- Item ID
fireBlade:register()
```

---

## Creating Spells

### Spell XML Registration

**File**: `data/spells/spells.xml` (or data-fire override)

```xml
<instant group="attack" spellid="100" name="Fire Wave" words="exevo gran mas flam" level="50" mana="500" premium="1" selftarget="1" cooldown="4000" groupcooldown="2000" needlearn="0" script="attack/fire_wave.lua">
    <vocation name="Sorcerer"/>
    <vocation name="Master Sorcerer"/>
</instant>
```

### Spell Lua Script

**File**: `data-fire/scripts/spells/attack/fire_wave.lua`

```lua
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)

-- Damage formula
function onGetFormulaValues(player, level, magicLevel)
    local min = (level / 5) + (magicLevel * 4.5) + 25
    local max = (level / 5) + (magicLevel * 7.5) + 45
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

-- Area (3x3 cross pattern)
local area = createCombatArea({
    {0, 1, 0},
    {1, 3, 1},  -- 3 = center (caster)
    {0, 1, 0}
})
combat:setArea(area)

function onCastSpell(creature, variant)
    return combat:execute(creature, variant)
end
```

### Spell Area Patterns

```lua
-- Line (5 tiles)
{
    {0, 0, 1, 0, 0},
    {0, 0, 1, 0, 0},
    {0, 0, 3, 0, 0},
    {0, 0, 0, 0, 0},
}

-- Circle (radius 2)
{
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
}

-- Diagonal
{
    {1, 0, 0},
    {0, 3, 0},
    {0, 0, 1},
}
```

---

## Quest System

### Using Storage Values

Player storage is used to track quest progress:

```lua
-- Check quest state
local questState = player:getStorageValue(1000)

if questState < 1 then
    -- Quest not started
    player:setStorageValue(1000, 1)  -- Mark as started
elseif questState == 1 then
    -- Quest in progress
    player:setStorageValue(1000, 2)  -- Mark next stage
elseif questState >= 10 then
    -- Quest completed
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Quest already completed!")
end
```

### Quest Chest Example

```lua
local questChest = Action()

function questChest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local questStorage = 5000
    local rewardItem = 2160  -- Crystal coin

    if player:getStorageValue(questStorage) == 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
        return true
    end

    -- Give reward
    player:addItem(rewardItem, 1)
    player:setStorageValue(questStorage, 1)  -- Mark as looted
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a crystal coin!")

    return true
end

questChest:uid(50000)  -- Unique ID in map editor
questChest:register()
```

### Multi-Stage Quest

```lua
-- Stage 1: Talk to NPC
if player:getStorageValue(1000) < 1 then
    player:setStorageValue(1000, 1)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Quest started: Find 5 dragon scales")
end

-- Stage 2: Collect items
if player:getItemCount(2516) >= 5 then  -- Dragon scale ID
    player:removeItem(2516, 5)
    player:setStorageValue(1000, 2)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Quest progress: Return to NPC")
end

-- Stage 3: Complete
if player:getStorageValue(1000) == 2 then
    player:addItem(2160, 10)  -- Reward
    player:setStorageValue(1000, 10)  -- Mark complete
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Quest completed!")
end
```

---

## Best Practices

### Script Organization

```
data-fire/scripts/
├── actions/
│   ├── quests/
│   │   └── dragon_quest_lever.lua
│   ├── items/
│   │   └── magic_rope.lua
│   └── custom/
│       └── my_custom_action.lua
```

### Naming Conventions

- **Files**: lowercase, underscores: `fire_demon.xml`
- **Monsters**: Title Case: "Fire Demon"
- **Items**: lowercase: "magic sword"
- **Storage IDs**: Use ranges to organize:
  - 1000-1999: Quest A
  - 2000-2999: Quest B
  - 10000+: Custom features

### Performance Tips

1. **Cache lookups**: Don't repeatedly get the same data
   ```lua
   -- Bad
   if player:getStorageValue(1000) == 1 and player:getStorageValue(1000) == 1 then

   -- Good
   local questState = player:getStorageValue(1000)
   if questState == 1 and questState == 1 then
   ```

2. **Use intervals wisely**: Don't spam effects
   ```xml
   <attack interval="2000" ...>  <!-- Wait 2 seconds between attacks -->
   ```

3. **Limit monster summons**: Avoid lag
   ```xml
   <summons maxSummons="2">  <!-- Max 2 summons per monster -->
   ```

### Testing

1. **Use test characters**: Create GM character for testing
2. **Use console commands**: `/reload scripts` to reload without restart
3. **Check logs**: Look in `logs/` for Lua errors
4. **Start small**: Test one feature at a time

---

## Additional Resources

- **Lua API Reference**: See [Doxygen docs](../doxygen/html/index.html)
- **Examples**: Browse `data/scripts/` for official examples
- **Community**: [GitHub Discussions](https://github.com/tommycrusher/fireots/discussions)

---

**Last Updated**: November 15, 2025
**Fireots Version**: 1.5.0-rebrand
