local plugin_label = "AUTO_ELIXIRS_"
local menu = require("menu")

local function use_item(item_data)
    local consumables = get_local_player():get_consumable_items()
    for _, consumable in ipairs(consumables) do
        local consumable_sno_id = consumable:get_sno_id()
        if consumable.name == item_data.name or consumable_sno_id == item_data.id then
            consumable:use()
            return true
        end
    end
    return false
end

local function check_and_use_consumables(table_name, interval)
    if menu.is_table_enabled(table_name) then
        local last_use = menu.get_last_use(table_name)
        local current_time = os.time()

        if current_time - last_use >= interval then
            local selected_items = menu.get_selected_items(table_name)
            for _, item in ipairs(selected_items) do
                if use_item(item) then
                    menu.set_last_use(table_name, current_time)
                    console.print(string.format("Used %s from %s", item.name, table_name))
                    break
                end
            end
        end
    end
end

on_update(function ()
    if menu.is_enabled() then
        check_and_use_consumables("Elixir", 20 * 60)  -- 20 minutes
        check_and_use_consumables("Incense I", 20 * 60)
        check_and_use_consumables("Incense II", 20 * 60)
        check_and_use_consumables("Incense III", 20 * 60)
        check_and_use_consumables("Helltide", 60 * 60)  -- 60 minutes
    end
end)

on_render_menu(function ()
    menu.render_menu()
end)

console.print("Auto Elixirs script loaded!")