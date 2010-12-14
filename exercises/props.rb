teaching(:id => "teaching"){
  button :players => "load_lesson", :id => "load_lesson_button", :text => "Load Lesson", :width => 150
  instructions :id => "instructions"
}
editor(:id => "editor") {
  editor_input :players => "text_area", :id => "editor_input"
  button :players => 'save', :text => 'Save', :id => "save_button"
}
tests(:id => "tests"){
  tests_options {
    button :players => 'run', :text => 'Run Tests', :id => "run_button"
  }
  test_section :id => "output"
  test_section  :vertical_scrollbar => 'on', :horizontal_scrollbar => 'off', :id => "test_source"
}
