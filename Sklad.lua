local left = peripheral.wrap("left")
local right = peripheral.wrap("right")

if not left or not right then
    print("Chests not found!")
    return
end

local leftName = peripheral.getName(left)
local rightName = peripheral.getName(right)

print("Left: " .. leftName)
print("Right: " .. rightName)

-- Пробуем разные варианты вызова методов
function tryMethods()
    -- Вариант 1: Прямой вызов через peripheral.call
    print("\nTrying peripheral.call:")
    local success, items = pcall(function() 
        return peripheral.call(leftName, "list") 
    end)
    
    if success and items then
        print("SUCCESS! Found items:")
        for slot, item in pairs(items) do
            print("  " .. item.name .. " x" .. item.count)
        end
        return items
    end
    
    -- Вариант 2: Пробуем другие возможные методы
    local methodNames = {"getAllStacks", "getStackInSlot", "getAllItems", "getItems"}
    for i, method in ipairs(methodNames) do
        local success, result = pcall(function() 
            return peripheral.call(leftName, method) 
        end)
        if success and result then
            print("Method " .. method .. " works!")
            return result
        end
    end
    
    print("No standard inventory methods work with Quark chests")
    return nil
end

local items = tryMethods()