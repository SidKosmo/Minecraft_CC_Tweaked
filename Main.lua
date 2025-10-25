local bridge = peripheral.find("meBridge")

if not bridge then
    print("ME Bridge not found!")
    return
end

print("ME Bridge OK!")

-- Just list available methods to see what we can use
local methods = peripheral.getMethods("meBridge")
print("Available methods:")
for i, method in ipairs(methods) do
    print("  " .. method)
end