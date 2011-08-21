opengl_2d = game.add_component(game, 'dokidoki.opengl_2d', {
  width = 512,
  height = 512 
})
keyboard = game.add_component(game, 'dokidoki.keyboard')
exit_handler = game.add_component(game, 'dokidoki.exit_handler', {
  exit_on_esc = true
})

add_component(game, 'terrain_graphics')

camera = game.add_component(game, 'camera')

player = add_component(game, 'player')

camera.target_transform = player.transform
