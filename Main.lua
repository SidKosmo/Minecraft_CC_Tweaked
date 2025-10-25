local mon = peripheral.find("monitor") -- Автоматически находит монитор
local meBridge = peripheral.find("meBridge") -- Автоматически находит мост

if not mon or not meBridge then
    print("Mon or Bridge bad!")
    return
end

mon.setTextScale(0.5) -- Уменьшаем масштаб текста, чтобы влезло больше
mon.clear()

while true do
    mon.setCursorPos(1, 1)
    mon.write("=== Sklad reprt ===")

    local importantItems = {
        "minecraft:iron_ingot",
        "minecraft:gold_ingot",
        "minecraft:diamond",
        "mekanism:osmium_ingot" -- Пример предмета из другого мода
    }

    local yPos = 3
    for i, itemName in ipairs(importantItems) do
        local item = meBridge.getItem(itemName)
        local count = item and item.amount or 0
        mon.setCursorPos(2, yPos)
        mon.write(string.sub(itemName, 11) .. ": " .. count) -- Обрезаем "minecraft:"
        yPos = yPos + 1
    end

    os.sleep(5) -- Обновлять каждые 5 секунд
end