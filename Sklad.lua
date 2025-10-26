-- Простейшая проверка
local left = peripheral.wrap("left")
local right = peripheral.wrap("right")

print("Left: " .. (left and "connected" or "disconnected"))
print("Right: " .. (right and "connected" or "disconnected"))

if left and right then
    print("Both chests connected, but methods not compatible")
    print("Try using turtle or ME Bridge instead")
end