local chestFrom = peripheral.wrap("left")   -- quark:variant_chest_1
local chestTo = peripheral.wrap("right")    -- quark:variant_chest_3

if not chestFrom then
    print("Left chest (quark:variant_chest_1) not found!")
end

if not chestTo then
    print("Right chest (quark:variant_chest_3) not found!")
end

if not chestFrom or not chestTo then
    return
end

print("Left chest: " .. peripheral.getName(chestFrom))
print("Right chest: " .. peripheral.getName(chestTo))

function transferAllItems()
    local totalMoved = 0
    local fromName = peripheral.getName(chestFrom)
    
    for slot = 1, chestFrom.size() do
        local item = chestFrom.getItemDetail(slot)
        if item then
            -- Переносим предмет из слота в целевой сундук
            local remaining = chestTo.pushItems(fromName, slot, item.count)
            local moved = item.count - remaining
            if moved > 0 then
                print("Moved " .. moved .. " " .. item.name)
                totalMoved = totalMoved + moved
            end
        end
    end
    
    return totalMoved
end

local moved = transferAllItems()
print("Total items moved: " .. moved)