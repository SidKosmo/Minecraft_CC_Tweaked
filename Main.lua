local left = peripheral.wrap("left")
local right = peripheral.wrap("right")

if not left or not right then
    print("Chests not found!")
    return
end

print("Left chest: " .. peripheral.getName(left))
print("Right chest: " .. peripheral.getName(right))

-- Проверяем методы которые точно должны работать
function testMethods()
    print("\nTesting left chest methods:")
    
    -- Проверяем list()
    local success, items = pcall(function() return left.list() end)
    if success and items then
        print("list() - WORKS")
        local itemCount = 0
        for slot, item in pairs(items) do
            if item then
                itemCount = itemCount + 1
                print("  Slot " .. slot .. ": " .. item.name .. " x" .. item.count)
            end
        end
        print("Total items: " .. itemCount)
    else
        print("list() - FAILED")
    end
    
    -- Проверяем pushItems()
    print("\nTesting pushItems...")
    local fromName = peripheral.getName(left)
    success, result = pcall(function() 
        return right.pushItems(fromName, 1, 1)
    end)
    if success then
        print("pushItems - WORKS, moved: " .. (result or 0))
    else
        print("pushItems - FAILED")
    end
end

testMethods()