print("Hello! I'm work!")
local bridge = peripheral.find("meBridge")
if bridge then
  print("ME Bridge good!")
else
  print("ME Bridge bad")
end