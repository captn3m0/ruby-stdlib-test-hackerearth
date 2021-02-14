puts "#Report"
puts "|module|status|error"
puts "|------|------|-----"

require 'json'
for file in ARGV
  error=nil
  report = JSON.parse File.read(file)
  status = report['result']['run_status']['status']
  error = report['result']['run_status']['stderr'].split("\n")[0] if status != 'AC'
  puts "|#{report['context']}|#{status}|#{error}"
end