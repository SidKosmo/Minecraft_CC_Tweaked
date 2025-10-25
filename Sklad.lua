local mon = peripheral.find("monitor")
local meBridge = peripheral.find("meBridge")

if not mon or not meBridge then
    print("Mon or Bridge bad!")
    return
end

mon.setTextScale(0.5)
mon.clear()

while true do
    mon.setCursorPos(1, 1)
    mon.write("=== Sklad report ===")

    local importantItems = {
        "minecraft:iron_ingot",
        "minecraft:gold_ingot", 
        "minecraft:diamond",
        "mekanism:osmium_ingot"
    }

    local yPos = 3
    for i, itemName in ipairs(importantItems) do
        -- getItem возвращает ТАБЛИЦУ, даже если предмет один
        local items = meBridge.getItem(itemName)
        local count = 0
        
        if items then
            -- Суммируем количество из всех найденных вариантов предмета
            for _, item in ipairs(items) do
                count = count + (item.amount or 0)
            end
        end
        
        -- Красивое отображение имени (убираем namespace)
        local displayName = string.gsub(itemName, "minecraft:", "")
        displayName = string.gsub(displayName, "mekanism:", "")
        displayName = string.gsub(displayName, "ingot", "") -- Убираем "ingot"
        displayName = string.gsub(displayName, "_", " ") -- Заменяем _ на пробелы
        displayName = string.upper(string.sub(displayName, 1, 1)) .. string.sub(displayName, 2) -- Первая буква заглавная
        
        mon.setCursorPos(2, yPos)
        mon.write(displayName .. ": " .. count)
        yPos = yPos + 1
    end

    -- Добавляем общее количество типов предметов в системе
    local allItems = meBridge.getItems() or {}
    mon.setCursorPos(2, yPos + 1)
    mon.write("Total items: " .. #allItems)
    
    os.sleep(5)
end