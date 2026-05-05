-- callout.lua
--
-- Custom filter to convert divs with class "callout" to callout
-- blocks for special callout classes exercise, answer, and hint
--
local callout_attrs = {
   exercise = {
      type = "exercise",
      collapse = false,
   },
   answer = {
      type = "answer",
      collapse = true
   },
   hint = {
      type = "hint",
      collapse = true
   }
}

local function isCallout(class)
  return class == 'callout' or class:match("^callout%-")
end

local function calloutType(div)
  for _, class in ipairs(div.attr.classes) do
    if isCallout(class) then
      local type = class:match("^callout%-(.*)")
      if type == nil then
        type = "none"
      end
      return type
    end
  end
  return nil
end


-- function Div
--
-- Format div callout blocks. Only for html classes
function Div(div)
   local title
   local callout_type = calloutType(div)
   if callout_type == nil then
      return div
   end
   if div.content[1] ~= nil and div.content[1].t == "Header" then
      title = pandoc.utils.stringify(div.content[1])
      div.content:remove(1)
   else
      title = callout_type:gsub("^%l", string.upper)
   end

   return quarto.Callout({
	 type = callout_type,
	 content = { pandoc.Div(div) },
	 title = title,
	 collapse = callout_attrs[callout_type].collapse
   })
end
