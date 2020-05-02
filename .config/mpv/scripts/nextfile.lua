function nexthandler()
    local pl_current = mp.get_property_number("playlist-pos-1")
    local pl_count = mp.get_property_number("playlist-count")
    local chapter = mp.get_property_number('chapter')
    local chapters = mp.get_property_number('chapters')
    local remain = mp.get_property_number('time-remaining')

    if chapter == nil then
        if pl_count > 1 and pl_current < pl_count then
            mp.set_property_number('playlist-pos-1', pl_current + 1)
        end
    else
        if chapter == (chapters - 1) and remain <= (5*60) then
            if pl_count > 1 and pl_current < pl_count then
                mp.set_property_number('playlist-pos-1', pl_current + 1)
            end
        else
            mp.command("no-osd add chapter 1")
        end
    end
end

function prevhandler()
    local chapter = mp.get_property_number('chapter')

    if chapter == nil or chapter <= 0 then
        local pbt = mp.get_property_number("playback-time")
        local cst = mp.get_property_number("chapter-seek-threshold")
        local pl_current = mp.get_property_number("playlist-pos")
        local pl_count = mp.get_property_number("playlist-count")

        if pbt >= cst or pl_count <= 1 or pl_current <= 0 then
            mp.set_property_number('playback-time', 0)
        else -- pl_count is greater than 1 and pl_current is greater than 0
            mp.set_property_number('playlist-pos', pl_current - 1)
        end
    else
        mp.command("no-osd add chapter -1")
    end
end

mp.add_key_binding('shift+RIGHT', 'next', nexthandler)
mp.add_key_binding('shift+LEFT', 'prev', prevhandler)
