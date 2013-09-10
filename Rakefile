require 'bundler/setup'
require 'xcode_build'
require 'xcode_build/tasks/build_task'


desc 'Run the tests'
task :test do
  exec('xctool/xctool.sh -project Sample/mintKitSample.xcodeproj -scheme MintKitUnitTest test -test-sdk iphonesimulator -configuration Debug')
end

task :default => :test
