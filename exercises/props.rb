teaching(:id => "teaching"){
  button :players => "load_lesson", :id => "load_lesson_button", :text => "Load Lesson", :width => 150
}
editor(:id => "editor") {
  editor_input :players => "text_area", :id => "editor_input"
  button :players => 'save', :text => 'Save', :id => "save_button"
}
tests(:id => "tests"){
  tests_options {
    button :players => 'run', :text => 'Run Tests', :id => "run_button"
  }
  text_section :id => "output"
  text_section :id => "test_source"
}
