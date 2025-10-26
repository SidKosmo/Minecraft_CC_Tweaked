print("=== Adjacent Blocks Check ===")

local sides = {"left", "right", "front", "back", "top", "bottom"}
local foundInventories = {}

for i, side in ipairs(sides) do
    if peripheral.isPresent(side) then
        local pType = peripheral.getType(side)
        print(side .. ": " .. pType)
        
        if pType == "inventory" then
            table.insert(foundInventories, side)
            local chest = peripheral.wrap(side)
            
            -- Пробуем получить список предметов
            local success, items = pcall(function() return chest.list() end)
            if success and items then
                local itemCount = 0
                for slot, item in pairs(items) do
                    if item then itemCount = itemCount + 1 end
                end
                print("  Items: " .. itemCount)
            else
                print("  Cannot access items")
            end
        end
    else
        print(side .. ": empty")
    end
end

print("\nFound inventories: " .. #foundInventories)
for i, side in ipairs(foundInventories) do
    print("  " .. side)
end