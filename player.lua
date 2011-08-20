local vect = require 'dokidoki.vect'
local glfw = require 'glfw'

transform = game.add_component(self, 'dokidoki.transform', {
  pos = vect(100, 100)
})
sprite = game.add_component(self, 'dokidoki.sprite', {
  scale = vect(10, 10)
})

local function wasd_input(w, a, s, d)
  local dir = vect((d and 1 or 0) - (a and 1 or 0),
                   (w and 1 or 0) - (s and 1 or 0))
  return dir ~= vect.zero and vect.norm(dir)*4 or dir
end

function update()
  transform.pos = transform.pos + 2 * wasd_input(
    game.keyboard.key_held(string.byte('W')),
    game.keyboard.key_held(string.byte('A')),
    game.keyboard.key_held(string.byte('S')),
    game.keyboard.key_held(string.byte('D')))
end
