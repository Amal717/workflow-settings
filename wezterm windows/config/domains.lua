local platform = require('utils.platform')

local options = {
   -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
   ssh_domains = {},

   -- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
   unix_domains = {},

   -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
   wsl_domains = {},
}

if platform.is_win then
  options.ssh_domains = {
    {
      name = 'ssh:wsl',
      remote_address = 'localhost',
      multiplexing = 'None',
      default_prog = { 'bash', '-l' },
      assume_shell = 'Posix',
    },
  }

  options.wsl_domains = {
    {
      name = 'WSL:Ubuntu',
      distribution = 'Ubuntu',
      username = 'amal',
      default_cwd = '/home/amal',
      default_prog = { 'bash', '-l' },
    },
  }
end

return options
