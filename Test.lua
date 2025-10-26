local left = peripheral.wrap("left")
local right = peripheral.wrap("right")

if not left or not right then
    print("Need both chests!")
    return
end

print("Quark chests detected but inventory methods not available")
print("This is normal for some modded chests")
print("")
print("Solutions:")
print("1. Use ME Bridge as intermediary")
print("2. Use Turtle to transfer items") 
print("3. Use different chest types (vanilla or other mods)")
print("4. Check if Quark has compatibility addon for CC:Tweaked")