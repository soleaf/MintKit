desc 'Run the tests'
task :test do
  exec('xctool/xctool.sh -project mintKit/mintKit.xcodeproj -scheme mintKit-Simulator test -sdk iphonesimulator')
end

task :default => :test
