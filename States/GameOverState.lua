GameOverState = Class{__includes = BaseState}

function GameOverState:render()
  love.graphics.setFont(mediumFont)
  love.graphics.print('Restart', 160, 130)
  love.graphics.print('Exit', 160, 180)


  love.graphics.setFont(miniFont)
  love.graphics.print('Press R _', 95, 145)
  love.graphics.print('Press E _', 95, 195)

  if love.keyboard.isDown('r') then
    GameRestart()
  elseif love.keyboard.isDown('e') then
    love.event.quit()
  end
end

function GameRestart()
  stateMachine:change('play')
  Snake.x, Snake.y = 15, 15
  direction.x, direction.y = 0, 0
  tail = {}
  Up, Down, Left, Right = false, false, false, false
  Tail_length = 0
  Add_apple()
end