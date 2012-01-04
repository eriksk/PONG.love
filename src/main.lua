function love.load()
	ball = love.graphics.newImage('gfx/ball.png')
	ballq = love.graphics.newQuad(0,0,16,16,16,16)
	ballx = 800 / 2
	bally = 600 / 2
	ballVelx = 100
	ballVely = 100
	fps = 0
end

function love.update(dt)
	fps = (60 * dt) * 100
	
	ballx = ballx + ballVelx * dt
	bally = bally + ballVely * dt
	
	hit = false
	--boundaries	
	if ballx > 800 then
		ballx = 800
		ballVelx = ballVelx * -1
		hit = true
	end	
	if ballx < 0 then
		ballx = 0
		ballVelx = ballVelx * -1
		hit = true
	end		
	if bally > 600 then
		bally = 600
		ballVely = ballVely * -1
		hit = true
	end	
	if bally < 0 then
		bally = 0
		ballVely = ballVely * -1
		hit = true
	end
	
	if hit then
		ballVelx = ballVelx * 1.1
		ballVely = ballVely * 1.1
	end
	
end

function love.draw()
	love.graphics.print(fps, 15, 15)	
	love.graphics.drawq(ball, ballq, ballx, bally)
end