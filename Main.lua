-- Тест подключения с проверкой методов
local left = peripheral.wrap("left")
local right = peripheral.wrap("right")

print("=== Peripheral Check ===")
print("Left side: " .. (left and peripheral.getName(left) or "NOT FOUND"))
print("Right side: " .. (right and peripheral.getName(right) or "NOT FOUND"))

-- Проверяем какие методы доступны у левого сундука
if left then
    print("\nLeft chest methods:")
    local methods = peripheral.getMethods("left")
    for i, method in ipairs(methods) do
        print("  " .. method)
    end
    
    -- Пробуем получить список предметов
    print("\nTrying to list items...")
    local items = left.list()
    if items then
        local itemCount = 0
        for slot, item in pairs(items) do
            if item then
                itemCount = itemCount + 1
                print("Slot " .. slot .. ": " .. item.name .. " x" .. item.count)
            end
        end
        print("Total items in left chest: " .. itemCount)
    else
        print("Cannot list items from left chest")
    end
end

if right then
    print("\nRight chest methods:")
    local methods = peripheral.getMethods("right")
    for i, method in ipairs(methods) do
        print("  " .. method)
    end
end