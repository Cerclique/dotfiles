-- Default applications. Binds read from this table.
return {
  terminal    = "kitty",
  fileManager = "thunar",
  menu        = "wofi --show drun",
  lock        = "hyprlock",
  screenshot  = "hyprshot -m region -o " .. os.getenv("HOME") .. "/screenshots",
}
