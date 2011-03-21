local v2 = require 'dokidoki.v2'

transform = game.add_component(self, 'dokidoki.transform', {
  pos = v2(100, 100)
})
sprite = game.add_component(self, 'dokidoki.sprite', {
  scale = v2(10, 10)
})

local function wasd_input(w, a, s, d)
  local dir = v2((d and 1 or 0) - (a and 1 or 0),
                 (w and 1 or 0) - (s and 1 or 0))
  return dir ~= v2.zero and v2.norm(dir) or dir
end

function update()
  transform.pos = transform.pos + 2 * wasd_input(
    game.keyboard.key_held(string.byte('W')),
    game.keyboard.key_held(string.byte('A')),
    game.keyboard.key_held(string.byte('S')),
    game.keyboard.key_held(string.byte('D')))
end
