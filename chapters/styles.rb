section {
  top_border_width 1
  bottom_border_width 1
  right_border_width 2
  left_border_width 2
  border_color :black  
  width "100%"
  padding 10
}

chapter {
  width "100%"
}

title {
  extends :section
  font_size 16
  height "10%"
  horizontal_alignment :center
}

contents {
  extends :section
  height "70%"
}

resources {
  extends :section  
  height "20%"
}

link {
  width "100%"
  text_color "blue"
  hover {
    text_color "purple"
  }
}