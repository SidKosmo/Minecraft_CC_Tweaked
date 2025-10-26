local left = peripheral.wrap("left")
local right = peripheral.wrap("right")

if not left or not right then
    print("Chests not found!")
    return
end

function transferWithPull()
    local totalMoved = 0
    local fromName = peripheral.getName(left)
    
    local items = left.list()
    print("Found " .. getTableSize(items) .. " item stacks:")
    
    for slot, item in pairs(items) do
        if item then
            print("Trying to pull " .. item.name + " from slot " .. slot)
            -- Правый сундук тянет предметы из левого
            local movedCount = right.pullItems(fromName, slot, item.count)
            print("Pulled: " .. movedCount .. " " .. item.name)
            totalMoved = totalMoved + movedCount
        end
    end
    
    return totalMoved
end

function getTableSize(t)
    local count = 0
    for k, v in pairs(t) do count = count + 1 end
    return count
end

print("Starting PULL transfer...")
local result = transferWithPull()
print("Pull transfer completed! Moved " .. result + " items")