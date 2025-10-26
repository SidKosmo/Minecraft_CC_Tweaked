local left = peripheral.wrap("left")
local right = peripheral.wrap("right")

if not left or not right then
    print("Chests not found!")
    return
end

print("Left chest size: " .. left.size())
print("Right chest size: " .. right.size())

function transferAllItems()
    local totalMoved = 0
    local fromName = peripheral.getName(left)
    
    -- Получаем список предметов из левого сундука
    local items = left.list()
    
    print("Found " .. getTableSize(items) .. " item stacks in left chest")
    
    for slot, item in pairs(items) do
        if item then
            -- Переносим весь стек
            local movedCount = right.pushItems(fromName, slot, item.count)
            if movedCount > 0 then
                print("Moved " .. movedCount .. " " .. item.name .. " from slot " .. slot)
                totalMoved = totalMoved + movedCount
            end
        end
    end
    
    return totalMoved
end

-- Вспомогательная функция для подсчета элементов в таблице
function getTableSize(t)
    local count = 0
    for k, v in pairs(t) do count = count + 1 end
    return count
end

print("Starting transfer...")
local result = transferAllItems()
print("Transfer completed! Moved " .. result .. " items total")