local menu = {}

local plugin_label = "AUTO_ELIXIRS_"

local menu_elements = {
    main_enabled = checkbox:new(false, get_hash(plugin_label .. "main_enabled")),
    elixir_enabled = checkbox:new(false, get_hash(plugin_label .. "elixir_enabled")),
    incense_i_enabled = checkbox:new(false, get_hash(plugin_label .. "incense_i_enabled")),
    incense_ii_enabled = checkbox:new(false, get_hash(plugin_label .. "incense_ii_enabled")),
    incense_iii_enabled = checkbox:new(false, get_hash(plugin_label .. "incense_iii_enabled")),
    helltide_enabled = checkbox:new(false, get_hash(plugin_label .. "helltide_enabled")),
    main_tree = tree_node:new(0),
}

local consumables = {
    ["Elixir"] = {
        {name = "Elixir of Advantage II", id = 1841197},
        {name = "Elixir of Precision II", id = 1066737},
        {name = "Elixir of Curative", id = 1241387}
    },
    ["Incense I"] = {
        {name = "Sage's Whisper", id = 732722}
    },
    ["Incense II"] = {
        {name = "Soothing Spices", id = 731614},
        {name = "Spiral Morning", id = 732758}
    },
    ["Incense III"] = {
        {name = "Chorus of War", id = 731872},
        {name = "Elixir of Antivenin", id = 1241387}
    },
    ["Helltide"] = {
        {name = "Profane Mindcage", id = 1882910}
    }
}

local selected_items = {}
local last_use = {}

for table_name, items in pairs(consumables) do
    selected_items[table_name] = {}
    for _, item in ipairs(items) do
        selected_items[table_name][item.name] = checkbox:new(false, get_hash(plugin_label .. table_name .. "_" .. item.name))
    end
    last_use[table_name] = 0
end

function menu.is_enabled()
    return menu_elements.main_enabled:get()
end

function menu.is_table_enabled(table_name)
    return menu_elements[string.lower(table_name) .. "_enabled"]:get()
end

function menu.get_selected_items(table_name)
    local items = {}
    for _, item in ipairs(consumables[table_name]) do
        if selected_items[table_name][item.name]:get() then
            table.insert(items, item)
        end
    end
    return items
end

function menu.get_last_use(table_name)
    return last_use[table_name]
end

function menu.set_last_use(table_name, time)
    last_use[table_name] = time
end

function menu.render_menu()
    if menu_elements.main_tree:push("Auto Elixirs") then
        menu_elements.main_enabled:render("Enable Auto Elixirs", "Toggle to enable/disable the Auto Elixirs plugin")

        if menu_elements.main_enabled:get() then
            menu_elements.elixir_enabled:render("Enable Elixirs", "Toggle to enable/disable automatic Elixir use")
            menu_elements.incense_i_enabled:render("Enable Incense I", "Toggle to enable/disable automatic Incense I use")
            menu_elements.incense_ii_enabled:render("Enable Incense II", "Toggle to enable/disable automatic Incense II use")
            menu_elements.incense_iii_enabled:render("Enable Incense III", "Toggle to enable/disable automatic Incense III use")
            menu_elements.helltide_enabled:render("Enable Helltide", "Toggle to enable/disable automatic Helltide consumable use")

            for table_name, items in pairs(consumables) do
                if menu.is_table_enabled(table_name) then
                    if menu_elements.main_tree:push(table_name) then
                        for _, item in ipairs(items) do
                            selected_items[table_name][item.name]:render(item.name, "Toggle to enable/disable automatic use of " .. item.name)
                        end
                        menu_elements.main_tree:pop()
                    end
                end
            end
        end

        menu_elements.main_tree:pop()
    end
end

return menu



