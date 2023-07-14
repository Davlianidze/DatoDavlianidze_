StartState = Class{__includes = BaseState}

function StartState:render()
	love.graphics.setFont(mediumFont)
    love.graphics.print('Play', 160, 130)
    love.graphics.print('Exit', 160, 180)

	love.graphics.setFont(miniFont)
    love.graphics.print('Press Enter _', 70, 145)
    love.graphics.print('Press E _', 95, 195)


	if love.keyboard.isDown('return') then
		stateMachine:change('play')
	elseif love.keyboard.isDown('e') then
		love.event.quit()
	end
end