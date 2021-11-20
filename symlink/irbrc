require 'irb/completion'
IRB.conf[:SAVE_HISTORY] = 50
IRB.conf[:PROMPT_MODE] = :SIMPLE

# Load local .irbrc relative to Dir.pwd.
unless Dir.pwd == ENV['HOME']
  local_irbrc = Dir.pwd + '/.irbrc'
  if File.exist?(local_irbrc)
    puts "load #{local_irbrc.inspect}"
    load local_irbrc
  end
end
