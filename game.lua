opengl_2d = game.add_component(game, 'dokidoki.opengl_2d', {
  width = 800,
  height = 600
})
keyboard = game.add_component(game, 'dokidoki.keyboard')
exit_handler = game.add_component(game, 'dokidoki.exit_handler', {
  exit_on_esc = true
})

add_component(game, 'player')
