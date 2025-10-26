local left = peripheral.wrap("left")
local right = peripheral.wrap("right")

if not left then
    print("Left chest not found!")
else
    print("Left chest: " .. peripheral.getName(left))
    print("Available methods:")
    local methods = peripheral.getMethods("left")
    for i, method in ipairs(methods) do
        print("  " .. method)
    end
end

if not right then
    print("Right chest not found!")
else
    print("Right chest: " .. peripheral.getName(right))
    print("Available methods:")
    local methods = peripheral.getMethods("right")
    for i, method in ipairs(methods) do
        print("  " .. method)
    end
end