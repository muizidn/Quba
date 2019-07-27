require 'fileutils'

task :bootstrap do
  puts "Nothing to do yet. Sorry 🙇🏼‍♂️"
end

task :lint do
  swiftlint autocorrect
end

task :install_xctemplate do
  TEMPLATE = "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Xcode/Templates/File Templates"
  CUSTOM_DIR = TEMPLATE + "/Custom"
  RX_MVVM_DIR = "MVVM.xctemplate"
  puts "Prepare directory #{CUSTOM_DIR}"
  FileUtils.mkdir_p CUSTOM_DIR unless File.directory?(CUSTOM_DIR)
  puts "Done!"
  puts "Copy '#{RX_MVVM_DIR}' to '#{CUSTOM_DIR}'"
  FileUtils.cp_r RX_MVVM_DIR, CUSTOM_DIR
  puts "Done!"
  puts "Happy coding!"
  puts "Ahh, you may find the template in iOS section. So, please bear with us! 😇"
end
