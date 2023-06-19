 -- Install clink via "scoop install Clink".
-- Then, create oh-my-posh.lua file in the "%localappdata%\clink\oh-my-posh.lua".
-- Note: Clink version does not support auto-completion feature.

load(io.popen('oh-my-posh init cmd --config '
 .. os.getenv("localappdata")
 .. '\\Programs\\oh-my-posh\\themes\\clean-detailed.omp.json'):read("*a"))()
