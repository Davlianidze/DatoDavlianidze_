Snake = {}

function Snake:init()
  self.x = 15
  self.y = 15

  Length = 0

  tail = {}

  direction = {
  x = 0, 
  y = 0 
  }

end

function Snake:update(dt)
  if Up and direction.y == 0 then
    changeDirection(0, -1)
  elseif Down and direction.y == 0 then
    changeDirection(0, 1)
  elseif Left and direction.x == 0 then
    changeDirection(-1, 0)
  elseif Right and direction.x == 0 then
    changeDirection(1, 0)
  end

  old = { x = Snake.x, y = Snake.y }

  Snake.x = Snake.x + direction.x
  Snake.y = Snake.y + direction.y

  apple_captured = Snake.x == Apple.x and Snake.y == Apple.y

  if apple_captured then
    new_apple_and_trail_incement()
  end

  if Snake.x < 0 then
    Snake.x = SIZE - 1
  elseif Snake.x > SIZE - 1 then
    Snake.x = 0
  elseif Snake.y < 0 then
    Snake.y = SIZE - 1
  elseif Snake.y > SIZE - 1 then
    Snake.y = 0
  end

  if Length > 0 then
    for _, segment in ipairs(tail) do
      x, y = segment[1], segment[2]
      segment[1], segment[2] = old.x, old.y
      old.x, old.y = x, y
    end
  end

  for _, segment in ipairs(tail) do
    snake_killed_itself = Snake.x == segment[1] and Snake.y == segment[2]

    if snake_killed_itself then
      stateMachine:change('over')
    end

  end
end

function Snake:render()
  --Head
  love.graphics.setColor(0.8, 0.9, 0.0, 1.0)
  love.graphics.rectangle('fill', self.x * SIZE, self.y * SIZE, SIZE, SIZE)

  --Tail
  love.graphics.setColor(0.6, 0.9, 0.0, 1.0)
  for _, segment in ipairs(tail) do
    love.graphics.rectangle('fill', segment[1] * SIZE, segment[2] * SIZE, SIZE, SIZE)
  end
end

function tail_increment()
  Length = Length + 1
end

function changeDirection(x, y)
    direction.x, direction.y = x, y
end

function new_apple_and_trail_incement()
  Add_apple()
  tail_increment()
  table.insert(tail, {0, 0})
end
