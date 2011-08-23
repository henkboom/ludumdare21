local vect = require 'dokidoki.vect'
local quaternion = require 'dokidoki.quaternion'
local glfw = require 'glfw'

local vel = vect.zero

transform = game.add_component(self, 'dokidoki.transform')
graphics = game.add_component(self, 'player_graphics')

function update()

  ---- rotation ----
  local turning = (game.keyboard.key_held(glfw.KEY_LEFT)  and 1 or 0) -
                  (game.keyboard.key_held(glfw.KEY_RIGHT) and 1 or 0)
  transform.orientation = transform.orientation *
    quaternion.from_rotation(vect.k, turning * math.pi * 0.03)

  ---- acceleration ----
  local forward = quaternion.rotated_i(transform.orientation)
  local left = quaternion.rotated_j(transform.orientation)

  if game.keyboard.key_held(string.byte('X')) then
    vel = vel + forward * 0.5
  end

  ---- damping ----
  vel = vel - vect.project(vel, left) * 0.03;
  vel = vel * 0.98

  ---- movement ----
  transform.pos = transform.pos + vel
end
