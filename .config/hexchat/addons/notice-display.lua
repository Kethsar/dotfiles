name = "notice-display"
version = 0.1
description = "Display notices from the currently focused network in the current tab"
curCtx = hexchat.get_context()
ctrlCodes = {
    U = "\021",
    B = "\002",
    C = "\003",
    O = "\015",
    R = "\022",
    H = "\008"
}

function focusTabChange(args)
    curCtx = hexchat.get_context()
end

function formatEventText(formatStr, eventArgs)
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
        retStr = string.gsub(retStr, replaceStr, eventArgs[i])
    end

    return retStr
end

function DisplayNotice(args)
    noticeCtx = hexchat.get_context()
    noticeNtwrk = noticeCtx:get_info("network")
    curNtwrk = curCtx:get_info("network")

    if(curNtwrk == noticeNtwrk) then
        noticeFormat = hexchat.get_info("event_text Notice")
        noticeMsg = formatEventText(noticeFormat, args)
        curCtx:print(noticeMsg)
    end
end

hexchat.register(name, version, description)

hexchat.hook_print("Focus Tab", focusTabChange)
hexchat.hook_print("Notice", DisplayNotice)
hexchat.print("Loaded notice-display ver. " .. version)
