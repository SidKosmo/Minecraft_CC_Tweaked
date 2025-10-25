local meBridge = peripheral.find("meBridge")

if not meBridge then
    print("ERROR: ME Bridge not found!")
    print("Check:")
    print("1. ME Bridge block placed")
    print("2. Connected to AE2 network") 
    print("3. Computer connected to bridge")
    return
end

print("SUCCESS: ME Bridge found!")
print("Testing methods...")

-- Проверяем какие методы доступны у ME Bridge
local methods = peripheral.getMethods("meBridge")
print("Available methods:")
for i, method in ipairs(methods) do
    print("  " .. i .. ": " .. method)
end

-- Пробуем получить все предметы из системы
print("\nTesting getItems()...")
local allItems = meBridge.getItems()
if allItems then
    print("SUCCESS: getItems() works!")
    print("Total items in system: " .. #allItems)
    
    if #allItems > 0 then
        print("First 3 items:")
        for i = 1, math.min(3, #allItems) do
            local item = allItems[i]
            print("  " .. item.name .. " - " .. item.amount .. "x")
        end
    end
else
    print("ERROR: getItems() failed!")
end

-- Тестируем поиск конкретного предмета
print("\nTesting getItem()...")
local testItem = "minecraft:iron_ingot"
local result = meBridge.getItem(testItem)

print("Result of getItem('" .. testItem .. "'):")
print("Type: " .. type(result))

if type(result) == "table" then
    print("Table size: " .. #result)
    if #result > 0 then
        for i, item in ipairs(result) do
            print("  Variant " .. i .. ": " .. item.amount .. "x")
        end
    else
        print("  Empty table - item not found")
    end
else
    print("  Result: " .. tostring(result))
end