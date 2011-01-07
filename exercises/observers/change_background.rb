Do.on(:run_update) do |options|
  failed_count = options[:failed_count]
  scene = options[:scene]

  tests_prop = scene.find("tests")
  if failed_count == 0
    tests_prop.style.background_color = "335003"
    tests_prop.style.secondary_background_color = "618108"
  else
    tests_prop.style.background_color = "ff0300"
    tests_prop.style.secondary_background_color = "b1212b"
  end
end