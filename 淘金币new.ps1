# 请先手动打开“领水滴”页面
cd D:\adb
.\adb devices

function receive {
    .\adb shell input tap 912 770
    echo 领取奖励
    Start-Sleep -Seconds 3
}

for ($private:i = 0; $private:i -lt 30; $private:i += 1) {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  clearMatch  D:\adb\adb_cap.png  D:\adb\tb_tjb_shengqian.png 200 850 502 1920 976 128
    java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  clearMatch  D:\adb\adb_cap.png  D:\adb\tb_tjb_tianmao.png 200 850 502 1920 976 128
    java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  clearMatch  D:\adb\adb_cap.png  D:\adb\tb_tjb_maochao.png 200 850 502 1920 976 128
    java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  clearMatch  D:\adb\adb_cap.png  D:\adb\tb_tjb_huafei.png 200 850 502 1920 976 128
    java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  clearMatch  D:\adb\adb_cap.png  D:\adb\tb_tjb_desktop_tool.png 50 850 202 1920 976 128
    java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  clearMatch  D:\adb\adb_cap.png  D:\adb\tb_tjb_desktop_link.png 50 850 202 1920 976 128
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  revertMatch  D:\adb\adb_cap.png  D:\adb\tb_tjb_view1.png 839 883 | findstr Matched
    echo $private:result
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 55
        $private:y = [int]$private:result[2] + 18
        .\adb shell input tap $private:x $private:y
        echo 去完成
        Start-Sleep -Seconds 25
        .\adb shell input keyevent 4
        echo 返回
        Start-Sleep -Seconds 3
        receive
    } else {
        break
    }
}

for ($private:i = 0; $private:i -lt 20; $private:i += 1) {
    .\adb shell input tap 888 1244
    #.\adb shell input tap 888 1429
    echo 去完成
    Start-Sleep -Seconds 40
    .\adb shell input keyevent 4
    echo 返回
    Start-Sleep -Seconds 10
}

# 请先打开“金币成就”页面
for ($private:i = 0; $private:i -lt 3; $private:i += 1) {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\tb_tjb_success.png 124 805 295 863 | findstr Matched
    echo $private:result
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 74
        $private:y = [int]$private:result[2] + 18
        .\adb shell input tap $private:x $private:y
        echo 领取奖励
        Start-Sleep -Seconds 15
        .\adb shell input keyevent 4
        echo 返回
        Start-Sleep -Seconds 3
    } else {
        break
    }
}