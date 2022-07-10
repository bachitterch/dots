local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

colorizer.setup({ "*" }, {
  RGB      = true;
  RRGGBB   = true;
  RRGGBBAA = true;
  rgb_fn   = true;
  hsl_fn   = true;
  names    = false;
  css      = false;
  css_fn   = false;
  mode     = "background",
})
