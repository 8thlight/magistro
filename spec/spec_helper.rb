require 'rubygems'
require 'spec'
require 'limelight/specs/spec_helper'
require "limelight/mouse"

# Set the Gem home to the frozen gems
$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../")
Gem.use_paths(File.join($PRODUCTION_PATH , "__resources", "gems"), Gem.default_path)

$: << File.expand_path(File.dirname(__FILE__) + "/../lib")
$: << File.expand_path(File.dirname(__FILE__) + "/../components")
Dir.glob(File.join("__resources", "gems", "gems", "**", "lib")).each do |dir|
  $: << dir
end

def click(scene_id)
  @mouse = Limelight::Mouse.new
  @mouse.click(scene.find(scene_id))
end

class MockStep
  attr_accessor :source, :output_stream, :error_stream

  def save_source(source)
    @source = source
  end

  def spec_filename
    return "test_spec.rb"
  end

end