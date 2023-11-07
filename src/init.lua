--- === MultiShade ===
---
--- Creates a semitransparent overlay to reduce screen brightness.
---
--- Download: https://github.com/brennydoogles/hammerspoon-multishade/Spoons/raw/master/Spoons/

local obj = {}
obj.__index = obj

-- Metadata
obj.name = "MultiShade"
obj.version = "0.1"
obj.author = "Brendon Dugan"
obj.homepage = "https://github.com/brennydoogles/hammerspoon-multishade"
obj.license = "Apache 2.0 - http://www.apache.org/licenses/"


obj.defaultIcon = "ASCII:" ..
        "A.........2........A\n" ..
        "D4................5B\n" ..
        "....................\n" ..
        "....................\n" ..
        "....................\n" ..
        "....................\n" ..
        "....................\n" ..
        "..........1.........\n" ..
        "....................\n" ..
        "....................\n" ..
        "3.....1......1.....3\n" ..
        "....................\n" ..
        "....................\n" ..
        "..........1.........\n" ..
        "....................\n" ..
        "....................\n" ..
        "....................\n" ..
        "....................\n" ..
        "D5................4B\n" ..
        "C.........2........C\n"

obj.shades = {}

--- Shade:init()
--- Method
--- Sets up the Spoon
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
function obj:init()
    self.testMenuIcon = hs.menubar.new()
    self.testMenuIcon:setIcon(obj.defaultIcon)
    self.testMenuIcon:setTooltip("TestSpoon")
    self.menuTable = {}

    for i, v in ipairs(hs.screen.allScreens()) do
        obj.shades[v:name()] = {
            rectangle = hs.drawing.rectangle(v:fullFrame()),
            name = v:name(),
            transparency = 0
        }
        self.menuTable[v:name()] = {
            title = v:name(),
            disabled = false,
            menu = {
                {
                    title = "25%",
                    fn = function()
                        obj.shades[v:name()]["transparency"] = 0.25
                        obj.start()
                    end
                },
                {
                    title = "50%",
                    fn = function()
                        obj.shades[v:name()]["transparency"] = 0.5
                        obj.start()
                    end
                },
                {
                    title = "75%",
                    fn = function()
                        obj.shades[v:name()]["transparency"] = 0.75
                        obj.start()
                    end
                },
                {
                    title = "off",
                    fn = function()
                        obj.shades[v:name()]["transparency"] = 0
                        obj.start()
                    end
                },
            }
        }
    end


    self.menuTable[0] =
    {
        title = "All Screens",
        disabled = false,
        menu = {
            {
                title = "25%",
                fn = function()
                    for i, v in pairs(obj.shades) do
                        v["transparency"] = 0.25
                        obj.shades[v.name] = v
                    end
                    obj.start()
                end
            },
            {
                title = "50%",
                fn = function()
                    for i, v in pairs(obj.shades) do
                        v["transparency"] = 0.5
                        obj.shades[v.name] = v
                    end
                    obj.start()
                end
            },
            {
                title = "75%",
                fn = function()
                    for i, v in pairs(obj.shades) do
                        v["transparency"] = 0.75
                        obj.shades[v.name] = v
                    end
                    obj.start()
                end
            },
            {
                title = "off",
                fn = function()
                    for i, v in pairs(obj.shades) do
                        v["transparency"] = 0
                        obj.shades[v.name] = v
                    end
                    obj.start()
                end
            },
        }
    }
    self.testMenuIcon:setMenu(self.menuTable)
end

function obj:start()
    for i, v in pairs(obj.shades) do
        v.rectangle:hide()
        if v.transparency > 0 then
            v.rectangle:setFillColor({["white"]=0, ["alpha"] = v.transparency })
            v.rectangle:setStroke(false):setFill(true)
            v.rectangle:bringToFront(true):setBehavior(17)
            v.rectangle:show()
        end
    end
end


obj.screenWatcher = hs.screen.watcher.new(
        function()
            obj.init()
            obj.start()
        end
)
obj.screenWatcher:start()

return obj