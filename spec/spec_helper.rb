require 'rubygems'
require 'rspec'
require 'limelight/specs/spec_helper'
require "limelight/mouse"

# Set the Gem home to the frozen gems
$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../")

$: << File.expand_path(File.dirname(__FILE__) + "/../lib")
$: << File.expand_path(File.dirname(__FILE__) + "/../components")
$: << File.expand_path(File.dirname(__FILE__) + "/")

Dir.glob(File.join( "**", "lib")).each do |dir|
  $: << dir
end

def click(scene_id)
  @mouse = Limelight::Mouse.new
  @mouse.click(scene.find(scene_id))
end


def on_first_step
  require "lesson"
  @lesson = Lesson.new(File.join(File.dirname(__FILE__), "/../etc/template_method"))
  @exercise = @lesson.exercises.first
  @step = @exercise.steps.first
  production.current_lesson = @lesson
  production.current_exercise = @exercise
  production.current_step = @step
end