local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/keseerattanakorn/Bankzahh/refs/heads/main/Lib.lua"))()

-- สร้างหน้าต่าง
local window = ui:Win("Reaper Hub")

-- สร้าง Tab
local mainTab = ui.tabs:Tab("Main")
local farmTab = ui.tabs:Tab("Farm")

-- ======================
-- 🔹 MAIN TAB
-- ======================

mainTab:Button("กดเพื่อพิมพ์", function()
    print("คุณกดปุ่มแล้ว!")
end)

mainTab:Toggle("เปิด/ปิดระบบ", false, function(state)
    print("สถานะ:", state)
end)

mainTab:Textbox("ใส่ชื่อ", "พิมพ์ตรงนี้...", function(text)
    print("คุณพิมพ์:", text)
end)

mainTab:Dropdown("เลือกโหมด", {"Easy","Normal","Hard"}, function(choice)
    print("เลือก:", choice)
end)

-- ======================
-- 🔹 FARM TAB
-- ======================

farmTab:Toggle("Auto Farm", false, function(state)
    if state then
        print("เริ่มฟาร์ม")
    else
        print("หยุดฟาร์ม")
    end
end)

farmTab:Button("รีเซ็ต", function()
    print("รีเซ็ตแล้ว")
end)
