desc 'Run the tests'
task :test do
  exec('xctool/xctool.sh -project mintKit/mintKit.xcodeproj -scheme mintKit-Simulator test GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES -sdk iphonesimulator')
end

task :default => :test
