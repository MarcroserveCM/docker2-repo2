require 'rake/clean'
require 'rake/gempackagetask'
require 'rake/extensiontask'
# get the texplay version
require 'lib/texplay/version'
$dlext = Config::CONFIG['DLEXT']
CLEAN.include("ext/**/*.#{$dlext}", "ext/**/*.log", "ext/**/*.o", "ext/**/*~", "ext/**/*#*", "ext/**/*.obj", "ext/**/*.def", "ext/**/*.pdb")
CLOBBER.include("**/*.#{$dlext}", "**/*~", "**/*#*", "**/*.log", "**/*.o")

   
["lib/texplay.rb"; "lib/texplay-contrib.rb"; "lib/texplay/version.rb"] +
FileList["ext/**/extconf.rb", "ext/**/*.h", "ext/**/*.c", "examples/*.rb",
"examples/media/*"].to_a 
end
Rake::GemPackageTask.new(specification) do |package|
    package.need_zip = false
    package.need_tar = false
end
Rake::ExtensionTask.new('texplay', specification)  do |ext|
#    ext.config_script = 'extconf.rb' 
#    ext.cross_compile = true                
#    ext.cross_platform = 'i386-mswin32'
end
