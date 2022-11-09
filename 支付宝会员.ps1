cd D:\adb
.\adb devices

function goBack {
    .\adb shell input keyevent 4
    echo 返回
    Start-Sleep -Seconds 2
}
function swipe {
    Start-Sleep -Seconds 1
    .\adb shell input swipe 536 1600 543 1400 500
}

for ($private:i = 0; $private:i -lt 6; $private:i += 1) {
    .\adb shell screencap -p /storage/self/primary/Pictures/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/Pictures/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\zfb_hongbao.png 198 1149 741 2190 | findstr Matched
    .\adb shell input tap 540 2353
    echo $private:result
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 700
        $private:y = [int]$private:result[2] + 100
        .\adb shell input tap $private:x $private:y
        echo 逛红包
        swipe
        Start-Sleep -Seconds 17
        goBack
    }
}
    
