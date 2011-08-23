local gl = require 'gl'
local graphics = require 'dokidoki.graphics'

local transform = parent.transform

function draw()
  gl.glPushMatrix()
  graphics.apply_transform(transform.pos, transform.orientation)
  gl.glColor3d(1, 1, 1)
  gl.glBegin(gl.GL_LINE_LOOP)
  gl.glVertex2d(-15, -10);
  gl.glVertex2d(  8, -10);
  gl.glVertex2d( 15,  -7);
  gl.glVertex2d( 15,   7);
  gl.glVertex2d(  8,  10);
  gl.glVertex2d(-15,  10);
  gl.glVertex2d(-12,   4);
  gl.glVertex2d(-12,  -4);
  gl.glEnd()
  gl.glPopMatrix()
end
