local vect = require 'dokidoki.vect'
local gl = require 'gl'

target_transform = false
pos = vect.zero


function postupdate()
  if(target_transform) then
    pos = target_transform.pos
  end
end

function predraw()
  gl.glTranslated(
    game.opengl_2d.width/2 - pos[1],
    game.opengl_2d.height/2 - pos[2],
    0)
end
