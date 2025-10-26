local left = peripheral.wrap("left")
local right = peripheral.wrap("right")

if not left or not right then
    print("Chests not found!")
    return
end

print("Testing LEFT chest methods:")
local leftMethods = peripheral.getMethods("left")
for i, method in ipairs(leftMethods) do
    print("Testing: " .. method)
    local success, result = pcall(function() 
        if method == "list" or method == "size" then
            return left[method]()
        else
            return "method exists"
        end
    end)
    print("  " .. method .. ": " .. (success and "SUCCESS" or "FAILED"))
end

print("\nTesting RIGHT chest methods:")
local rightMethods = peripheral.getMethods("right")
for i, method in ipairs(rightMethods) do
    print("Testing: " .. method)
    local success, result = pcall(function() 
        if method == "list" or method == "size" then
            return right[method]()
        else
            return "method exists"
        end
    end)
    print("  " .. method .. ": " .. (success and "SUCCESS" or "FAILED"))
end