require "rake/testtask"

Rake::TestTask.new do |test|
  test.pattern = "test/**/*_test.rb"
end

task :watch do
  require "filewatcher"
  Filewatcher.new(["test/**/*_test.rb","lib/**/*.rb"]).watch do |filename,event|
    relative = filename.split(Dir.pwd).last

    if relative.start_with?("/lib/")
      filename = File.join [Dir.pwd, relative.gsub(%r{^/lib/},"test/").gsub(%r{\.rb},"_test.rb")]
    end

    if File.exist?(filename)
      begin
        ruby "-Ilib:test #{filename}"
      rescue
      end
    end
  end
end
