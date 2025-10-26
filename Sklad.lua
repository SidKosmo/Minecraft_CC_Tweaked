-- Простой тест подключения
local left = peripheral.wrap("left")
local right = peripheral.wrap("right")

print("=== Peripheral Check ===")
print("Left side: " .. (left and peripheral.getName(left) or "NOT FOUND"))
print("Right side: " .. (right and peripheral.getName(right) or "NOT FOUND"))

if left then
    print("Left chest size: " .. left.size() .. " slots")
    local items = left.list()
    local itemCount = 0
    for k, v in pairs(items) do if v then itemCount = itemCount + 1 end end
    print("Items in left chest: " .. itemCount)
end

if right then
    print("Right chest size: " .. right.size() .. " slots")
end