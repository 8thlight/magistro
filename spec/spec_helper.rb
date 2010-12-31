require 'rubygems'
require 'rspec'
gem 'limelight'
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
  reader = DirectoryReader.new(File.join(File.dirname(__FILE__), "/../etc/template_method"))
  magistro_root = File.expand_path(File.dirname(__FILE__) + "/test_space")
  @lesson = Lesson.new(reader.lesson_path, {:magistro_root => magistro_root, :reader => reader})
  @exercise = @lesson.exercises.first
  @step = @exercise.steps.first
  production.current_lesson = @lesson
  production.current_exercise = @exercise
  production.current_step = @step
end