teaching(:id => "teaching"){
  button :players => "load_lesson", :id => "load_lesson_button", :text => "Load Lesson", :width => 150
  instructions :id => "instructions"
}

editor(:id => "editor") {
  editor_input :players => "text_area", :id => "editor_input"
  button :players => 'save', :text => 'Save', :id => "save_button"
}

tests(:id => "tests"){
  tests_navigation(:id => "tests_navigation") {
    button :players => 'run', :text => 'Run Tests', :id => "run_button"
    previous_container(:id => "previous_container")
    next_container(:id => "next_container")
    }

  test_section(:id => "output_area") {
    failure_count :id => "failure_count"
    out :id => "output"
  }
  test_section :id => "test_source"

}
