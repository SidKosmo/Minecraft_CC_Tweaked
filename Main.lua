local left = peripheral.wrap("left")
local right = peripheral.wrap("right")

if not left or not right then
    print("Chests not found!")
    return
end

print("Left chest size: " .. left.size())
print("Right chest size: " .. right.size())

function transferWithDebug()
    local totalMoved = 0
    local fromName = peripheral.getName(left)
    
    -- Получаем список предметов из левого сундука
    local items = left.list()
    
    print("Found " .. getTableSize(items) .. " item stacks in left chest:")
    
    -- Выводим что именно нашли
    for slot, item in pairs(items) do
        if item then
            print("  Slot " .. slot .. ": " .. item.name .. " x" .. item.count)
            
            -- Проверяем лимит предметов в целевом сундуке
            local canAccept = true
            for targetSlot = 1, right.size() do
                local targetItem = right.getItemDetail(targetSlot)
                if not targetItem then
                    -- Пустой слот - можно положить
                    break
                elseif targetItem.name == item.name then
                    -- Есть такой же предмет, проверяем можно ли добавить
                    local spaceLeft = right.getItemLimit(targetSlot) - targetItem.count
                    if spaceLeft > 0 then
                        break
                    end
                end
                if targetSlot == right.size() then
                    canAccept = false
                end
            end
            
            if not canAccept then
                print("  RIGHT CHEST FULL for " .. item.name)
            else
                -- Пробуем перенести
                local movedCount = right.pushItems(fromName, slot, item.count)
                print("  Attempted to move " .. item.count .. " " .. item.name .. ", result: " .. movedCount)
                if movedCount > 0 then
                    totalMoved = totalMoved + movedCount
                end
            end
        end
    end
    
    return totalMoved
end

function getTableSize(t)
    local count = 0
    for k, v in pairs(t) do count = count + 1 end
    return count
end

print("Starting transfer with debug...")
local result = transferWithDebug()
print("Transfer completed! Moved " .. result .. " items total")

-- Проверяем результат
print("\nChecking left chest after transfer:")
local itemsLeft = left.list()
print("Items remaining in left: " .. getTableSize(itemsLeft))

print("Checking right chest after transfer:")
local itemsRight = right.list() 
print("Items now in right: " .. getTableSize(itemsRight))