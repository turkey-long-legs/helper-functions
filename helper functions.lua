--[helper]

--aliases
local client = game:GetService("Players").LocalPlayer
local hb = game:GetService("RunService").Heartbeat

--chained FindFirstChild
function ffc(obj, ...)
    for _, v in ipairs({...}) do    
        if obj == nil then
            return nil
        else
            obj = obj:FindFirstChild(v)
        end
    end
    return obj
end

--default parameter alternative
function defIfNil(parameter, default)
    if parameter == nil then
        return default
    end
    return parameter
end

--recursively print table content
function printTable(tab, form)
    form = defIfNil(form, 0)
    local format = string.rep("\t", form)
    for k, v in next, tab do
        if type(v) == "table" then
            print(format .. "[" .. k .. "] = {")
            printTable(tostring(v), form + 1)
            print(format .. "}")
        else
            print(format .. "[" .. k .. "] = " .. tostring(v))
        end
    end
end

--make an executable temporary function
function tempFunc(func)
    return func
end

function getRoot(char)
    local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
    return rootPart
end
--[helper] end