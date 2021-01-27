local name = "showhilight"
local version = 0.1
local description = "Prints all hilights into a separate tab for future reference"
local ctrlCodes = {
    U = "\021",
    B = "\002",
    C = "\003",
    O = "\015",
    R = "\022",
    H = "\008"
}

local function formatEventText(formatStr, eventArgs)
    retStr = formatStr

    retStr = string.gsub(retStr, "%%U", ctrlCodes["U"])
    retStr = string.gsub(retStr, "%%B", ctrlCodes["B"])
    retStr = string.gsub(retStr, "%%C", ctrlCodes["C"])
    retStr = string.gsub(retStr, "%%O", ctrlCodes["O"])
    retStr = string.gsub(retStr, "%%R", ctrlCodes["R"])
    retStr = string.gsub(retStr, "%%H", ctrlCodes["H"])
    retStr = string.gsub(retStr, "%$t", "\t")

    for i = 1, #eventArgs do
        replaceStr = "%$" .. i
        eventArgs[i] = string.gsub(eventArgs[i], "%%", "%%%%")
        retStr = string.gsub(retStr, replaceStr, eventArgs[i])
    end

    return retStr
end

local function on_hilight(event, args)
    curctx = hexchat.get_context()
    hlctx = curctx:find_context(nil, '[Hilights]')

    if (hlctx == nil) then
        curctx:command('query -nofocus [Hilights]')
        hlctx = curctx:find_context(nil, '[Hilights]')
    end

    if (hlctx ~= nil) then
        fmt = hexchat.get_info('event_text ' .. event)
        args[1] = string.format('%s/%s', args[1], curctx:get_info('channel'))

        -- Force 4 args
        for i = 1, 4 do
            if (args[i] == nil) then args[i] = '' end
        end

        str = formatEventText(fmt, args)
        hlctx:print(str)
    else
	curctx:print("Unable to find [Hilights]")
    end
end

local function msg_hilight(args)
    on_hilight('Channel Message', args)
end

local function act_hilight(args)
    on_hilight('Channel Action', args)
end

hexchat.register(name, version, description)

hexchat.hook_print('Channel Msg Hilight', msg_hilight)
hexchat.hook_print('Channel Action Hilight', act_hilight)
hexchat.print(string.format('Loaded %s version %.1f', name, version))
