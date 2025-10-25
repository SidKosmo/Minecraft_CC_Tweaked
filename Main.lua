local bridge = peripheral.find("meBridge")
if not bridge then
    print("ME Bridge not found!")
    return
end

print("ME Bridge connected!")
print("Testing getItems...")

local items = bridge.getItems()
print("Total items in system: " .. #items)

-- Show first 5 items
for i = 1, math.min(5, #items) do
    local item = items[i]
    print(i .. ": " .. item.name .. " - " .. item.amount .. "x")
end