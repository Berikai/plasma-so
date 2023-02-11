-- Plasma v1.3.3 Source Code
-- Made by Berikai (widely known as Verdant in the SO community)
-- https://berikai.dev

getLuaEngine().cbShowOnPrint.Checked = false -- Disable Lua Engine Logs / Lua Motoru Loglarını Kapat
local UDF1 = createFormFromFile("form.frm") -- Load UI / Arayüzü Yükle

-- Initialization Variables / Başlangıç Değişkenleri
isVerified543245354352 = false -- LMAOOOO! I made this name like this because I wanted it unpredictable and unfindable. It's the variable that determines if the user authenticated or not.
isKeyOpen = true
maxRam = '3072' -- Default maxRam / Varsayılan maksimum ram
isAutoH = false
autoHcheck = 226
  
  --GIRIS
  isVerified543245354352 = true -- Auth passed! / Auth geçildi!
  UDF1.Show() -- Show Form / Form'u göster
  
  -- The function of Plasma which does AoB scanning. Every time we travel to a different world the gamemode value changes so we are calling this function in order to find the value again. / Plasma'nın AoB scan yaptığı fonksiyon. Her dünya değiştirildiğinde gamemode değerinin yeniden bulunması gerektiğinden bu çağırılır.
  function actual_plasma_func()
  
    local processName = "javaw.exe"
    if processName == "javaw.exe" then
      openProcess(processName) -- Open specified process / Belirtilmiş process'i aç
      local scan = createMemScan(UDF1.CEProgressbar1) -- (Func name says it all) / Memory tarayıcısı oluştur
      local list = createFoundList(scan) -- (Func name says it all) / Bulunan değerler listesi oluştur
      
      -- AoB s here! / İşte AoB lar burada!

      -- We worked so hard to find these aob's with my brother. It was so much fun. Also the realization that these aob's depends on the maxRam was crazy for us. Such great days.
      -- Anyways, I'm so lazy to convert these line into turkish lol.

      -- You're welcome ;)

      -- NOTE: I do not exactly remember the autoH mechanism but it was something that depends on the value of memory.

      if string.sub(maxRam, 1, 4) == '3072' then
        scan.firstScan(1, 8, 0, "00 00 00 0? 00 00 00 ?? ?? ?? E2 ?? ?? ?? E3 ?? ?? ?? E? ?? ?? ?? ?? ?? ?? ?? E? 00 00 00 00 ?? ?? ?? ?? ?? ?? ?? ?? 0? 00 00 00 00 00 00 00 ?? ?? ?? F8", "", 0, 18446744073709551615, "+W-C", 1, 1, true, false, false, false)
        autoHcheck = 226
      end
      
      if string.sub(maxRam, 1, 8) == '3072 [2]' then
        scan.firstScan(1, 8, 0, "00 00 00 0? 00 00 00 ?? ?? ?? E2 ?? ?? ?? E4 ?? ?? ?? E? ?? ?? ?? ?? ?? ?? ?? E? 00 00 00 00 ?? ?? ?? ?? ?? ?? ?? ?? 0? 00 00 00 00 00 00 00 ?? ?? ?? F8", "", 0, 18446744073709551615, "+W-C", 1, 1, true, false, false, false)
        autoHcheck = 226
      end
      
      if string.sub(maxRam, 1, 8) == '3072 [3]' then
        scan.firstScan(1, 8, 0, "00 00 00 0? 00 00 00 ?? ?? ?? E2 ?? ?? ?? E5 ?? ?? ?? E? ?? ?? ?? ?? ?? ?? ?? E? 00 00 00 00 ?? ?? ?? ?? ?? ?? ?? ?? 0? 00 00 00 00 00 00 00 ?? ?? ?? F8", "", 0, 18446744073709551615, "+W-C", 1, 1, true, false, false, false)
        autoHcheck = 226
      end
      
      if string.sub(maxRam, 1, 4) == '8192' then
        scan.firstScan(1, 8, 0, "00 00 00 0? 00 00 00 ?? ?? ?? BA ?? ?? ?? BB ?? ?? ?? B? ?? ?? ?? ?? ?? ?? ?? B? 00 00 00 00 ?? ?? ?? ?? ?? ?? ?? ?? ?? 00 00 00 00 00 00 00 ?? ?? ?? F8", "", 0, 18446744073709551615, "+W-C", 1, 1, true, false, false, false)
        autoHcheck = 186
      end
      
      -- Freeze if checkbox checked / Eğer kutucuk işaretliyse dondur
      if UDF1.CECheckbox1.Checked then
        pause()
      end

      scan.waitTillDone() -- Tarayana kadar bekle

      -- Unfreeze if checkbox checked / Eğer kutucuk işaretliyse dondurmayı kaldır
      if UDF1.CECheckbox1.Checked then
        unpause()
      end

      list.initialize() -- Listeyi hazırla
  
      -- If only one result is found, that means we found the true value. / Eğer bir sonuç bulunduysa bu doğru sonucu bulduğumuz anlamına gelir.
      if list.getCount() == 1 then
        -- If the show message checkbox checked / Eğer mesaj göster kutucuğu işaretliyse
        if UDF1.CECheckbox3.Checked == false then
          messageDialog("Plasma", "Hile aktif! Reach'i açmak-kaptamak için G'ye basılı tut.", type, mbYes)
        end

        UDF1.CELabel2.Caption = "Aktif!"

        local isReach = false
  
        local function loop(timer)

          if isKeyOpen == true then
              if isKeyPressed(71) then -- G
                if isReach then
                  -- Reach açıksa reachi kapatıyoruz.
                  isReach = false
                  local bytes = readBytes(list.getAddress(0), 30, true) -- Get Byte Array / Bulunan Bayt dizisini al
                  bytes[24] = bytes[24] - 4 -- Extraxt 4 from 24th array value / 24. dizi değerinden 4 çıkar
                  writeBytes(string.sub(string.format("%02x", (tonumber(list.getAddress(0), 16) + 23) * 256), 1, 9), bytes[24]) -- Write the 24th byte to memory / 24. bayt ı memory e yaz.
                  -- The gamemode value is actually the 24th value of aob. Other values are the values that we need in the aob pattern for us to find this value. / AoB'un 24. değeri gamemode değeri oluyor. Dizideki geriye kalan değerler o 24. değeri bulmak için memoryde bu patterni aratmamızı sağlayan değerler.
                else
                  -- Reach kapalıysa reach'i açıyoruz.
                  isReach = true
                  local bytes = readBytes(list.getAddress(0), 30, true) -- Get Byte Array / Bulunan Bayt dizisini al
                  bytes[24] = bytes[24] + 4 -- Add 4 to 24th array value / 24. dizi değerine 4 ekle
                  writeBytes(string.sub(string.format("%02x", (tonumber(list.getAddress(0), 16) + 23) * 256), 1, 9), bytes[24]) -- Write the 24th byte to memory / 24. bayt ı memory e yaz.
                end
              end
              if isKeyPressed(72) then -- H
                UDF1.CELabel2.Caption = "Plasma."
                if UDF1.CECheckbox3.Checked == false then
                  messageDialog("Plasma", "Reach tekrardan açılıyor...", type, mbYes)
                end
                timer.Enabled = false
                actual_plasma_func()
              end
          end

          -- Auto H mechanism / Oto H mekanizması
          if isAutoH then
            local autoHbyte = readBytes(list.getAddress(0), 30, true)
            if autoHcheck ~= autoHbyte[11] then
              autoHcheck = autoHbyte[11]
              UDF1.CELabel2.Caption = "Plasma."
              if UDF1.CECheckbox3.Checked == false then
                messageDialog("Plasma", "Reach tekrardan açılıyor...", type, mbYes)
              end
              timer.Enabled = false
              actual_plasma_func()
            end
          end
        end
  
        -- Check the states regularly / Düzenli olarak durumları kontrol et (oto H aktif mi vs)
        local timer = createTimer()
        timer.setInterval = 100
        timer.OnTimer = loop
        timer.Enabled = true
      else
        messageDialog("Plasma", "Hile açılırken sorun oldu! \n\n*SonOyuncu Launcher'dan MaxRam'i doğru ayarladığından emin ol! \n*Hileyi sunucuya girdikten sonra çalıştırdığından emin ol! \n*SonOyuncu'yu yeniden başlatmayı dene. \n\nSorun hala devam ederse bizimle iletişime geç.", type, mbYes)
        UDF1.RadioButton1.Checked = false
      end
    else
      messageDialog("Plasma", "SonOyuncu tespit edilemedi!", type, mbYes)
    end
  
  end
  
  -- On Form Close/ Form Kapatılırsa
  function UDF1_FormClose(sender)
    closeCE()
  end
  
  -- On ComboBox change / ComboBox değişince
  function UDF1_1_CEComboBox1Change(sender)
    maxRam = UDF1.CEComboBox1.Text -- Set MaxRam to specified value / MaxRam i bu değere eşitle
  end
  
  -- Discord
  function UDF1_1_CEButton1Click(sender)
    os.execute("start https://discord.gg/CAEJY2PNVc")
  end
  
  -- Key Detection Checkbox / Tuş Algılama Kutusu
  function UDF1_1_CECheckbox2Change(sender)
    if UDF1.CECheckbox2.Checked == true then
      isKeyOpen = false
    else
      isKeyOpen = true
    end
  end
  
  -- Auto H presser / Otomatik H basıcı
  function UDF1_1_CECheckbox6Change(sender)
    if UDF1.CECheckbox6.Checked == true then
      isAutoH = true
    else
      isAutoH = false
    end
  end
  
  -- LOOOLLLLLLL POOR AUTH PROTECTION XD
  function UDF1_RadioButton1Change(sender)
    if UDF1.RadioButton1.Checked == true then
      if isVerified543245354352 == true then
        actual_plasma_func()
      else
        messageDialog("Plasma", "Sanırım Plasma'yı cracklemeye çalışıyorsun :')", type, mbYes)
        messageDialog("Plasma", "Anlıyorum, para vermek cazip gelmiyor...", type, mbYes)
        messageDialog("Plasma", "Halbuki plasma'yı ücretsiz bir şekilde kullanabileceğin kampanyalarımız bile var...", type, mbYes)
        messageDialog("Plasma", "İnan ki Plasma'yı yapmak için gerçekten çok çaba sarf ettik.", type, mbYes)
        messageDialog("Plasma", "Lütfen emeğe saygı duymayı öğren.", type, mbYes)
        closeCE()
      end
    end
  end