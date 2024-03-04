return {
  {
    "numToStr/Comment.nvim",
    event = { "BufEnter" },
    opts = {

      ---Function to call before (un)comment
      pre_hook = function(...)
        local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
        if loaded and ts_comment then
          return ts_comment.create_pre_hook()(...)
        end
      end,
      ---Function to call after (un)comment
      post_hook = nil,
    },
  },
}

-- function M.config()
--   require("Comment").setup {
--     ---Function to call before (un)comment
--     pre_hook = function(...)
--       local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
--       if loaded and ts_comment then
--         return ts_comment.create_pre_hook()(...)
--       end
--     end,
--     ---Function to call after (un)comment
--     post_hook = nil,
--   }
-- end
--
-- return M
