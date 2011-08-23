local vect = require 'dokidoki.vect'
local gl = require 'gl'

local hex = {}
for i = 1, 6 do
  local a = i/6*2*math.pi
  hex[i] = vect(math.cos(a), math.sin(a))
end

local dodec = {}
for i = 1, 12 do
	local a = i/12*2*math.pi
	dodec[i] = vect(math.cos(a), math.sin(a))
end

local function draw_hex(radius, depth)
  depth = depth or 1
  if depth > 4 then
    return
  end
  local color = 0.5 - depth * 0.1

  gl.glColor3d(color, color, color)
  gl.glBegin(gl.GL_LINE_LOOP)
  for i = 1, #hex do
    gl.glVertex2d(hex[i][1] * radius, hex[i][2] * radius)
  end
  gl.glEnd()

  draw_hex(radius -3, depth + 1)
end

local function draw_lines(size, depth)
  depth = depth or 1
	if depth > 4 then
		return
	end
	local color = 0.5 - depth * 0.1

	gl.glColor3d(color, color, color)
	gl.glBegin(gl.GL_LINES)
	local a = true
	for i = 1, #dodec do
		if a then
			gl.glVertex2d(dodec[i][1] * 173, dodec[i][2] * 173)
			gl.glVertex2d(dodec[i][1] * (size-268), dodec[i][2] * (size-268))
			a = false
		else
			gl.glVertex2d(dodec[i][1] * 200, dodec[i][2] * 200)
			gl.glVertex2d(dodec[i][1] * size, dodec[i][2] * size)
			a = true
		end
	end
	gl.glEnd()
end

function draw()
  draw_hex(200)
  draw_hex(400)
  draw_hex(600)
  draw_hex(800)
  draw_hex(1000)
  draw_hex(1200)
  draw_hex(1400)
  draw_hex(1600)
  draw_hex(1800)
  draw_hex(2000)
	draw_lines(2000)
end
