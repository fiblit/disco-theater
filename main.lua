local maid64 = require "lib/maid64/maid64"

local track = nil

function love.load()
    track = love.audio.newSource('assets/nightswinger.ogg', 'stream')
    track:play()

    -- Required by the premise of LOWREZJAM2018
    maid64.setup(64)

    love.graphics.setBackgroundColor(0, 0, 0)

    rotate = 0
end

local start = love.timer.getTime()
local delay = 0
local END_BEAT_PAUSE = 0.6
function love.update(dt)
    if not track:isPlaying() then
        if delay > END_BEAT_PAUSE then
            track:play()
            delay = 0
        end
        delay = delay + dt
    end
    rotate = rotate + dt
end

function love.draw()
    --starts the maid64 process
    maid64.start()

    --draw images here
    love.graphics.push()
    love.graphics.translate(32, 32)
    love.graphics.rotate(rotate)
    love.graphics.rectangle("fill",0,0,32,32)
    love.graphics.pop()

    --can also draw shapes and get mouse position
    love.graphics.circle("fill", maid64.mouse.getX(),  maid64.mouse.getY(), 2)

    --finishes the maid64 process
    maid64.finish()
end

function love.resize(w, h)
    -- this is used to resize the screen correctly
    maid64.resize(w, h)
end

