local left = peripheral.wrap("left")
local right = peripheral.wrap("right")

if not left or not right then
    print("Chests not connected!")
    return
end

function continuousTransfer()
    while true do
        local moved = 0
        local fromName = peripheral.getName(left)
        local items = left.list()
        
        for slot, item in pairs(items) do
            if item then
                local movedCount = right.pushItems(fromName, slot, item.count)
                if movedCount > 0 then
                    print("[" .. os.time() .. "] Moved " .. movedCount .. " " .. item.name)
                    moved = moved + movedCount
                end
            end
        end
        
        if moved == 0 then
            print("[" .. os.time() .. "] No items to transfer")
        end
        
        os.sleep(5) -- Проверяем каждые 5 секунд
    end
end

continuousTransfer()