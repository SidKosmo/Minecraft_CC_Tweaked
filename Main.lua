-- Поставь компьютера между сундуками
-- Подключи модемы к сундукам

local chestFrom = peripheral.wrap("left")   -- Левый сундук
local chestTo = peripheral.wrap("right")    -- Правый сундук

if not chestFrom or not chestTo then
    print("Check chest connections!")
    return
end

function transferItems()
    local itemsMoved = 0
    
    -- Получаем список предметов в исходном сундуке
    local items = chestFrom.list()
    
    for slot, item in pairs(items) do
        if item then
            -- Переносим предмет из слота в слота
            local itemStack = chestFrom.getItemDetail(slot)
            if itemStack then
                -- Пытаемся добавить в целевой сундук
                local remaining = chestTo.pushItems(peripheral.getName(chestFrom), slot, itemStack.count)
                if remaining < itemStack.count then
                    itemsMoved = itemsMoved + (itemStack.count - remaining)
                    print("Moved " .. (itemStack.count - remaining) .. " " .. itemStack.name)
                end
            end
        end
    end
    
    return itemsMoved
end

print("Total moved: " .. transferItems())