require 'rake/clean'


# get the texplay version

$dlext = RbConfig::CONFIG['DLEXT']
CLEAN.include("ext/**/*.#{$dlext}", "ext/**/*.log", "ext/**/*.o", "ext/**/*~", "ext/**/*#*", "ext/**/*.obj", "ext/**/*.def", "ext/**/*.pdb")
CLOBBER.include("**/*.#{$dlext}", "**/*~", "**/*#*", "**/*.log", "**/*.o")

   
["lib/texplay.rb" "lib/texplay-contrib.rb" "lib/texplay/version.rb"] +
FileList["ext/**/extconf.rb", "ext/**/*.h", "ext/**/*.c", "examples/*.rb",
"examples/media/*"].to_a 


