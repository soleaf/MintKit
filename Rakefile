desc 'Run the tests'
task :test do
  exec('xctool/xctool.sh -project Sample/mintKitSample.xcodeproj -scheme mintKitSample test -sdk iphonesimulator')
end

task :default => :test
