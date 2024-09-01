function ClearRegister()
  local all_str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+*/"
  for i = 1, #all_str do
    local register_str = string.sub(all_str, i, i)
    vim.fn.setreg(register_str, "")
  end
end


return {
  ClearRegister()
}
