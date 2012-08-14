{exec} = require 'child_process'
util   = require 'util'

DEFAULT_OUTPUT_FILE = "lib/svg.js"

SOURCE_DIR = "src"
COFFEE_FILES = [
  "svg", 
  "svg_container",
  "svg_dispatcher",
  "svg_draggable",
  "svg_object",
  "svg_element",
  "svg_document",
  "svg_defs",
  "svg_group",
  "svg_svg",
  "svg_clip_path",
  "svg_shape",
  "svg_image"
]

option "-o", "--output [DIR]", "The location of the compile JS, defaults to #{DEFAULT_OUTPUT_FILE}"
option "-w", "--watch", "Recompile whenever a source file changes"

task "compile", "Compile sources into one JS file", (options) ->
  console.log "Compiling with: #{command(options)}"
  exec command(options), (err, stdout, stderr) ->
    util.log err if err

command = (options) ->
  o = 
    watch: options.watch
    join: options.output || DEFAULT_OUTPUT_FILE
    compile: ("#{SOURCE_DIR}/#{file}.coffee" for file in COFFEE_FILES).join(" ")
  
  c = "coffee"
  for key, value of o
    c += " --#{key}"
    c += " #{value}" if value isnt true
  c