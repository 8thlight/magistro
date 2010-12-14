require 'rubygems'
require 'rspec'
require 'limelight/specs/spec_helper'
require "limelight/mouse"

# Set the Gem home to the frozen gems
$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../")

$: << File.expand_path(File.dirname(__FILE__) + "/../lib")
$: << File.expand_path(File.dirname(__FILE__) + "/../components")
Dir.glob(File.join( "**", "lib")).each do |dir|
  $: << dir
end

def click(scene_id)
  @mouse = Limelight::Mouse.new
  @mouse.click(scene.find(scene_id))
end
