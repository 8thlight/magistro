main do
  teaching(:id => "teaching") do
    
    top_nav do
      top_nav_item :players => "button load_lesson", :id => "load_lesson_button", :text => "Load Lesson", :width => 150
      top_nav_item :players => "button load_chapter", :id => "load_chapter_button", :text => "Chapter"
    end

    instructions :id => "instructions"
  end

  editor(:id => "editor") do
    editor_input :players => "text_area", :id => "editor_input"
  end

  tests(:id => "tests") do
    tests_navigation(:id => "tests_navigation") do
      button :players => 'run', :text => 'Run Tests', :id => "run_button"
      button :players => 'run_all', :text => 'Run All', :id => "run_all_button"
      previous_container(:id => "previous_container")
      next_container(:id => "next_container")
    end

    test_section(:id => "output_area") do
      failure_count :id => "failure_count"
      out :id => "output"
    end
    test_section :id => "test_source"
  end
end