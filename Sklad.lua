local bridge = peripheral.find("meBridge")

if not bridge then
    print("ERROR: ME Bridge not found!")
    return
end

print("SUCCESS: ME Bridge found!")

-- List ALL available methods
print("All available methods:")
local methods = peripheral.getMethods("meBridge")
for i, method in ipairs(methods) do
    print("  " .. i .. ": " .. method)
end

-- Test if system is connected
print("\nTesting connection...")
local isConnected = bridge.isConnected()
print("Is connected to AE2: " .. tostring(isConnected))

-- Try to get stored items with correct method name
print("\nTrying to list items...")

-- Check which item methods exist
if bridge.listItems then
    local items = bridge.listItems()
    print("listItems found " .. #items .. " items")
elseif bridge.getStoredItems then
    local items = bridge.getStoredItems()
    print("getStoredItems found " .. #items .. " items")
else
    print("No known item methods found")
end

-- Test getting specific item
print("\nTesting item search...")
if bridge.getItem then
    local iron = bridge.getItem("minecraft:iron_ingot")
    print("getItem result type: " .. type(iron))
else
    print("getItem method not available")
end