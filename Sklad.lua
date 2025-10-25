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
        "minecraft:iron_ingot",
        "minecraft:gold_ingot",
        "minecraft:diamond",
        "mekanism:osmium_ingot"
    }

    local yPos = 3
    for i, itemName in ipairs(importantItems) do
        -- Правильное использование getItem
        local items = meBridge.getItem(itemName)
        local count = 0
        
        if items then
            for _, item in ipairs(items) do
                count = count + item.amount
            end
        end
        
        -- Форматирование имени
        local displayName = string.gsub(itemName, "minecraft:", "")
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