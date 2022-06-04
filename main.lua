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
    if love.keyboard.isDown('d') then                    -- When the player presses and holds down the "D" button:
        if player.x < (love.graphics.getWidth()-player.sprite:getWidth()) then
		    player.x = player.x + (player.speed * dt)    -- The player moves to the right
        end
	elseif love.keyboard.isDown('a') then                -- When the player presses and holds down the "A" button:
        if player.x > 0 then
		    player.x = player.x - (player.speed * dt)    -- The player moves to the left.
        end
	end

    if love.keyboard.isDown('space') then                     -- Whenever the player presses or holds down the Spacebar:
        if player.y_velocity == 0 then
            player.y_velocity = player.jumpheight    -- The player's Y-Axis Velocity is set to it's Jump Height.
        end
    end

    -- This is in charge of the jump physics.
    if player.y_velocity ~= 0 then                                     -- The game checks if player has "jumped" and left the ground.
        player.y = player.y + player.y_velocity * dt                -- This makes the character ascend/jump.
        player.y_velocity = player.y_velocity - player.gravity * dt -- This applies the gravity to the character.
    end
        
        -- This is in charge of collision, making sure that the character lands on the ground.
    if player.y > player.ground then    -- The game checks if the player has jumped.
        player.y_velocity = 0       -- The Y-Axis Velocity is set back to 0 meaning the character is on the ground again.
        player.y = player.ground    -- The Y-Axis Velocity is set back to 0 meaning the character is on the ground again.
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