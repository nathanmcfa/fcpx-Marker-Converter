require "rexml/document"
include REXML

if !ARGV[0] || !File.exists?(ARGV[0])
  puts "error opening file: #{ARGV[0]}"
  exit 1
end

# Compressor error constant for importing markers. Offset/second
COMPRESSOR_ERROR = ARGV[1] == "Yes" ? 0.001 : 0

doc = ( Document.new File.new ARGV[0] ).root

# @param duration: a timestamp in fcpxml format like "2002/60000s"
# @returns an integer of milliseconds
def parseTime(duration)
  if(duration.nil? or !duration.to_s.include? '/')
    return 0
  end
  duration = duration.to_s.sub( "s", "" )
  duration = duration.split('/')
  return duration[0].to_f / duration[1].to_f
end

# @param element: a rexml element with "start" and "offset" attributes
# @returns an integer of milliseconds
def calulateOffset(element)
  return parseTime(element.attribute("start")) - parseTime(element.attribute("offset"))
end

def calulateEndOffset(element)
  return parseTime(element.attribute("posterOffset")) - parseTime(element.attribute("offset"))
end

# get the framerate in milliseconds
framerate = parseTime(doc.elements["project/resources/format"].attribute("frameDuration"))

puts '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<points>'

# loop through all "marker" elements
doc.elements.to_a("//chapter-marker").each_with_index do |marker, i| 
  uncompensatedTotal = parseTime(marker.attribute("start")) - calulateOffset(marker.parent)
  total = uncompensatedTotal - ( uncompensatedTotal * COMPRESSOR_ERROR )
  uncompensatedEnd = parseTime(marker.attribute("posterOffset")) - calulateEndOffset(marker.parent)
  chapterEnd = uncompensatedEnd - ( uncompensatedEnd * COMPRESSOR_ERROR )
  timecode = []
  timecode.push '%02d' % (total / 60 / 60 % 60) #hours
  timecode.push '%02d' % (total / 60 % 60).floor #Minutes
  timecode.push '%02d' % (total % 60).floor #seconds
  timecode.push '%02d' % (total % 1 / framerate).floor #frames
  puts  '  <marker start="' + (total % 60).floor.to_s + '" end="' + ((total % 60).floor + (chapterEnd % 60).floor).to_s + '" value="' + marker.attribute('value').to_s + '" />' #print that shiz
end

puts '</points>'
