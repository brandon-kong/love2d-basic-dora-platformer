platform = {}
player = {}

function love.load()
    platform.width = love.graphics.getWidth()
    platform.height = love.graphics.getHeight()/4

    platform.x = 0
    platform.y = love.graphics.getHeight()-platform.height


    player.x = platform.width/2

    player.speed = 200

    player.sprite = love.graphics.newImage('sprites/dora.png') 

    player.y = platform.y - (player.sprite:getHeight()/1.5)
    player.ground = player.y

    player.y_velocity = 0
    player.jumpheight = -300
    player.gravity = -500
end

function love.update(dt)
    --controls right/left movement
    if love.keyboard.isDown('d') then                   
        if player.x < (love.graphics.getWidth()-player.sprite:getWidth()) then
		    player.x = player.x + (player.speed * dt)   
        end
	elseif love.keyboard.isDown('a') then              
        if player.x > 0 then
		    player.x = player.x - (player.speed * dt)   
        end
	end

    --controls space jump movement
    if love.keyboard.isDown('space') then                    
        if player.y_velocity == 0 then
            player.y_velocity = player.jumpheight  
        end
    end

    --jump physics
    if player.y_velocity ~= 0 then                                 
        player.y = player.y + player.y_velocity * dt             
        player.y_velocity = player.y_velocity - player.gravity * dt 
    end
    
    --ground collisions
    if player.y > player.ground then  
        player.y_velocity = 0   
        player.y = player.ground  
    end
end

function love.draw()
    --draw the platform
   love.graphics.setColor(love.math.colorFromBytes(52, 140, 49))
   love.graphics.rectangle("fill", platform.x, platform.y, platform.width, platform.height)

   --draw the player
   love.graphics.setColor(1, 1, 1)
   love.graphics.draw(player.sprite, player.x, player.y, 0, 1, 1, 0, 270/4)
end