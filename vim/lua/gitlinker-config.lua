require"gitlinker".setup({
  opts = {
    remote = nil, -- force the use of a specific remote
    -- adds current line nr in the url for normal mode
    add_current_line_on_normal_mode = true,
    -- callback for what to do with the url
    action_callback = require"gitlinker.actions".copy_to_clipboard,
    -- print the url after performing the action
    print_url = true,
  },
  callbacks = {
    ["github.com"] = require"gitlinker.hosts".get_github_type_url,
    ["gitlab.com"] = require"gitlinker.hosts".get_gitlab_type_url,
    ["bitbucket.org"] = require"gitlinker.hosts".get_bitbucket_type_url,
    [os.getenv("BITBUCKET_HOST") or ""] = function(url_data)
      local url = "https://" .. url_data.host .. "/bitbucket/projects/" .. url_data.repo:gsub("/", "/repos/")
      if not url_data.file or not url_data.rev then
        return url
      end
      url = url .. "/browse/" .. url_data.file
      if not url_data.lstart then
        return url
      end
      url = url .. "#" .. url_data.lstart
      if url_data.lend then
        url = url .. "-" .. url_data.lend
      end
      return url
    end
  },
-- default mapping to call url generation with action_callback
  mappings = "<leader>gy"
})
