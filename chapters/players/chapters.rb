on_scene_opened do
  scene.find("title").text = production.current_lesson.chapter.title
  scene.find("contents").text = production.current_lesson.chapter.contents
  resources = production.current_lesson.chapter.resources
  resources_prop = scene.find("resources")
  resources.each do |resource|
    link_prop = Limelight::Prop.new(:name => "link", :players => "link", :text => resource, :id => resource)
    resources_prop.add(link_prop)
  end
end