on_mouse_clicked do
  chapter_stage = production.theater.add_stage("chapter")
  chapter_stage.size = [600, 400]
  chapter_stage.title = "Chapter"
  production.producer.open_scene("chapters", chapter_stage)
end