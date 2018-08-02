local track = nil

function love.load()
    track = love.audio.newSource('assets/nightswinger.ogg', 'stream')
    track:play()
end

function love.update(dt)
    if not track:isPlaying() then
        track:play()
    end
end

function love.draw()
end

