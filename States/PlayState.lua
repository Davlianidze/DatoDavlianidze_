PlayState = Class{__includes = BaseState}

require('Snake')
require('Apple')

SIZE = 20

Up = false
Down = false
Left = false
Right = false

function PlayState:init()
  Interval = 20

  Apple:init()
  Add_apple()

  Snake:init()
end

function PlayState:update(dt)
  Interval = Interval - 1

  if Interval < 0 then
    Snake:update(dt)
    if Length <= 5 then
      Interval = 20
    elseif Length > 5 and Length <= 10 then
      Interval = 15
    elseif Length > 10 and Length <= 20 then
      Interval = 10
    else 
      Interval = 5
    end
  end  
end

function PlayState:render()
  love.graphics.setFont(normalFont)
  love.graphics.print('apples: ' .. Length, 10, 10, 0, 1.5, 1.5, 0, 0, 0, 0)  

  Apple:render()
  Snake:render()
end
