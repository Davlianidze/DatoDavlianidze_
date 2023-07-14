Apple = {}

function Apple:init()
    self.x = 0
    self.y = 0
    self.width = 15
    self.height = 15
end

function Apple:render()
    love.graphics.setColor(1.0, 0.35, 0.4, 1.0)
    love.graphics.rectangle('fill', self.x * SIZE, self.y * SIZE, SIZE, SIZE, 15, 15)
end

function Add_apple()
    math.randomseed(os.time())
  
    Apple.x = math.random(Apple.width-1)
    Apple.y = math.random(Apple.height-1)
end
  