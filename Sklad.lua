local mon = peripheral.find("monitor")
local meBridge = peripheral.find("meBridge")

if not mon or not meBridge then
    print("Monitor or ME Bridge not found!")
    return
end

if not meBridge.isConnected() then
    print("ME Bridge not connected to AE2!")
    return
end

mon.setTextScale(0.5)
mon.clear()

while true do
    mon.setCursorPos(1, 1)
    mon.write("=== Storage Report ===")

    local importantItems = {
        {name = "minecraft:iron_ingot"},
        {name = "minecraft:gold_ingot"},
        {name = "minecraft:diamond"},
        {name = "mekanism:osmium_ingot"}
    }

    local yPos = 3
    for i, itemQuery in ipairs(importantItems) do
        -- ПРАВИЛЬНО: передаем таблицу, а не строку
        local items = meBridge.getItem(itemQuery)
        local count = 0
        
        if items then
            for _, item in ipairs(items) do
                count = count + item.amount
            end
        end
        
        -- Форматирование имени
        local displayName = string.gsub(itemQuery.name, "minecraft:", "")
        displayName = string.gsub(displayName, "mekanism:", "")
        displayName = string.gsub(displayName, "_", " ")
        
        mon.setCursorPos(2, yPos)
        mon.write(displayName .. ": " .. count)
        yPos = yPos + 1
    end

    local allItems = meBridge.listItems()
    mon.setCursorPos(2, yPos + 1)
    mon.write("Total types: " .. #allItems)
    
    os.sleep(5)
end