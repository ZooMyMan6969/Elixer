---@diagnostic disable: undefined-global, missing-return

--- @class ImVec4

--- @class game.item_data
--- @field public get_skin_name fun(self:game.item_data):string Retrieve the skin name of the item
--- @field public get_name fun(self:game.item_data):string Retrieve the name of the item
--- @field public get_display_name fun(self:game.item_data):string Retrieve the display name of the item
--- @field public is_sacred fun(self:game.item_data):boolean Check if the item is sacred
--- @field public is_ancestral fun(self:game.item_data):boolean Check if the item is ancestral
--- @field public get_rarity fun(self:game.item_data):number Retrieve the rarity of the item
--- @field public is_junk fun(self:game.item_data):boolean Check if the item is considered junk
--- @field public is_locked fun(self:game.item_data):boolean Check if the item is locked
--- @field public get_affixes fun(self:game.item_data):table Retrieve affixes of the item
--- @field public get_durability fun(self:game.item_data):number Retrieve the durability of the item
--- @field public get_acd fun(self:game.item_data):number Retrieve the ACD of the item
--- @field public get_sno_id fun(self:game.item_data):number Retrieve the SNO ID of the item
--- @field public get_balance_offset fun(self:game.item_data):number Retrieve the balance offset of the item
--- @field public get_secondary_id fun(self:game.item_data):number Retrieve the secondary ID of the item
--- @field public get_inventory_row fun(self:game.item_data):number Retrieve the inventory row where the item is located
--- @field public get_inventory_column fun(self:game.item_data):number Retrieve the inventory column where the item is located
--- @field public is_valid fun(self:game.item_data):boolean Check if the item data is valid
--- @constructor fun(self:game.item_data, sno_id:uint32_t, context:void*):game.item_data

--- @class game.world
--- @field public get_name fun(self:game.world):string
--- @field public get_current_zone_name fun(self:game.world):string
--- @field public get_world_id fun(self:game.world):number

---@class game.buff
game.buff = {}

---@class game.buff
--- Get the instance of the buff
--- @field instance number
--- @field type number
--- @field name_hash number
--- @field stacks number
--- @field name fun(self:game.buff):string Get the name of the buff
--- @field get_end_time fun(self:game.buff):number Get the end time of the buff

---@class game.object
game.object = {}

--- Get the buffs of the object
--- @param self game.object
--- @return game.buff[] @Table of buffs
function game.object:get_buffs() end

-- Example usage:
-- local local_player_buffs = local_player:get_buffs()
-- for _, buff in ipairs(local_player_buffs) do
--     local instance = buff.instance
--     local buff_type = buff.type
--     local name_hash = buff.name_hash
--     local name = buff:get_name()
--     local end_time = buff:get_end_time()
-- end

--- @class game.object
--- @field get_id fun(self:game.object):number
--- @field get_secondary_data_id fun(self:game.object):number
--- @field get_type_id fun(self:game.object):number
--- @field get_world fun(self:game.object):game.world
--- @field get_position fun(self:game.object):vec3
--- @field get_velocity fun(self:game.object):vec3
--- @field is_moving fun(self:game.object):boolean
--- @field is_dashing fun(self:game.object):boolean
--- @field get_active_spell_id fun(self:game.object):number
--- @field get_active_spell_origin fun(self:game.object):vec3
--- @field get_active_spell_destination fun(self:game.object):vec3
--- @field get_dash_destination fun(self:game.object):vec3
--- @field get_move_destination fun(self:game.object):vec3
--- @field get_move_destination_2 fun(self:game.object):vec3
--- @field get_direction fun(self:game.object):vec3
--- @field get_current_speed fun(self:game.object):number
--- @field get_total_movement_speed fun(self:game.object):number
--- @field get_base_movement_speed fun(self:game.object):number
--- @field get_movement_speed_multiplier fun(self:game.object):number
--- @field get_skin_name fun(self:game.object):string
--- @field get_type fun(self:game.object):string
--- @field get_type_2 fun(self:game.object):string
--- @field is_basic_particle fun(self:game.object):boolean
--- @field is_elite fun(self:game.object):boolean
--- @field is_champion fun(self:game.object):boolean
--- @field is_minion fun(self:game.object):boolean
--- @field is_boss fun(self:game.object):boolean
--- @field is_immune fun(self:game.object):boolean
--- @field is_vulnerable fun(self:game.object):boolean
--- @field is_untargetable fun(self:game.object):boolean
--- @field is_item fun(self:game.object):boolean
--- @field can_not_interact fun(self:game.object):boolean
--- @field get_base_health fun(self:game.object):number
--- @field get_bonus_health_modifier fun(self:game.object):number
--- @field get_current_health fun(self:game.object):number
--- @field get_base_attack_speed fun(self:game.object):number
--- @field get_bonus_attack_speed fun(self:game.object):number
--- @field get_weapon_damage fun(self:game.object):number
--- @field get_max_health fun(self:game.object):number
--- @field get_level fun(self:game.object):number
--- @field get_current_experience fun(self:game.object):number
--- @field get_experience_total_next_level fun(self:game.object):number
--- @field get_experience_remaining_next_level fun(self:game.object):number
--- @field get_character_class_id fun(self:game.object):number
--- @field get_health_potion_max_count fun(self:game.object):number
--- @field get_health_potion_count fun(self:game.object):number
--- @field get_health_potion_tier fun(self:game.object):number
--- @field get_primary_resource_current fun(self:game.object):number
--- @field get_primary_resource_max fun(self:game.object):number
--- @field is_dead fun(self:game.object):boolean
--- @field is_enemy fun(self:game.object):boolean
--- @field is_enemy_with fun(self:game.object, other:game.object):boolean
--- @field get_debug_int fun(self:game.object):number
--- @field get_debug_int_2 fun(self:game.object):number
--- @field get_debug_float fun(self:game.object):number
--- @field get_item_count fun(self:game.object):number
--- @field get_consumable_count fun(self:game.object):number
--- @field get_quest_item_count fun(self:game.object):number
--- @field get_aspect_count fun(self:game.object):number
--- @field get_item_ids_for_bag fun(self:game.object, bag_id:number):table
--- @field get_inventory_item_secondary_ids fun(self:game.object):table
--- @field get_consumables_ids fun(self:game.object):table
--- @field get_consumables_names fun(self:game.object):table
--- @field is_spell_ready fun(self:game.object, spell_id:number):boolean
--- @field has_enough_resources_for_spell fun(self:game.object, spell_id:number):boolean
--- @field get_equipped_items fun(self:game.object):table
--- @field get_inventory_items fun(self:game.object):table
--- @field get_consumable_items fun(self:game.object):table
--- @field get_item_slot_index fun(self:game.object, item:game.item_data, bag_id:number):number
--- @field get_item_info fun(self:game.object, item:game.item_data):game.item_data
--- @field get_gold fun(self:game.object):number
--- @field get_obols fun(self:game.object):number
--- @field get_active_spell_target fun(self:game.object):game.object
--- @field get_spell_charges fun(self:game.object, spell_id:number):number
--- @field get_class_specialization_id fun(self:game.object):number
--- @field get_rogue_combo_points fun(self:game.object):number
--- @field debug_print fun(self:game.object):nil
