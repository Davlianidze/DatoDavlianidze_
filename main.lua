Class = require 'Lib/class'

require 'StateMachine'

require 'States/BaseState'
require 'States/StartState'
require 'States/PlayState'
require 'States/GameOverState'

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')

  love.window.setTitle('Nokia Snake')

  miniFont = love.graphics.newFont('Fonts/font.ttf', 7)
  normalFont = love.graphics.newFont('Fonts/abc.ttf', 20)
  mediumFont = love.graphics.newFont('Fonts/abc.ttf', 32)

  love.graphics.setBackgroundColor(0.0, 0.5, 0.0)
  love.graphics.setColor(0.8, 0.9, 0.0, 1.0)
    
  stateMachine = StateMachine {
		['start'] = function() return StartState() end,
    ['play'] = function() return PlayState() end,
    ['over'] = function() return GameOverState() end
	}

  stateMachine:change('start')
end

function love.update(dt)
  stateMachine:update(dt)
end

function love.draw()
  stateMachine:render()
end


function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  elseif key == 'left' then
    Left, Right, Up, Down = true, false, false, false
  elseif key == 'right' then
    Left, Right, Up, Down = false, true, false, false
  elseif key == 'up' then
    Left, Right, Up, Down = false, false, true, false
  elseif key == 'down' then
    Left, Right, Up, Down = false, false, false, true
  end
end
