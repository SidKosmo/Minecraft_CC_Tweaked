-- Простой тест
local left = peripheral.wrap("left")
local right = peripheral.wrap("right")

print("Connected peripherals:")
local peripherals = peripheral.getNames()
for i, name in ipairs(peripherals) do
    print("  " .. name)
end

if left then
    print("\nLeft chest items:")
    local success, items = pcall(function() return left.list() end)
    if success and items then
        for slot, item in pairs(items) do
            if item then
                print("  " .. item.name .. " x" .. item.count)
            end
        end
    else
        print("  Cannot access left chest")
    end
end