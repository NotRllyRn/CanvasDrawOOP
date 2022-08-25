local CanvasDraw = script.CanvasDraw

return {
    new = function()
        local Clone = CanvasDraw:Clone()
        local Canvas = require(Clone)
        Clone:Destroy()
        return Canvas
    end
}