puts "#Report"
puts "|module|message|status|output_html|"
puts "|------|-------|------|-----------|"
require 'json'
for file in ARGV
  report = JSON.parse File.read(file)
  module_name = File.basename(file,'.json')
  puts "|#{module_name}|#{report['message']}|#{report['run_status']['status']}|<div>#{report['run_status']['output_html']}</div>|"
end