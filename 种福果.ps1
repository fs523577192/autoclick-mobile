# 请先打开淘宝种福果页面
cd D:\adb
.\adb devices

.\adb shell input tap 1021 1635
echo 做任务
Start-Sleep -Seconds 1

#.\adb shell input tap 886 843

#.\adb shell input tap 888 1588
.\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
.\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
$private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\tb_fuguo_checkin.png 821 612 | findstr Matched
if ( "$private:result" -ne "" ) {
    $private:result = "$private:result".Split(" ")
    $private:x = [int]$private:result[1] + 62
    $private:y = [int]$private:result[2] + 22
    .\adb shell input tap $private:x $private:y
    echo 签到
    Start-Sleep -Seconds 1
}
$private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\tb_fuguo_get.png 821 812 | findstr Matched
if ( "$private:result" -ne "" ) {
    $private:result = "$private:result".Split(" ")
    $private:x = [int]$private:result[1] + 62
    $private:y = [int]$private:result[2] + 22
    .\adb shell input tap $private:x $private:y
    echo 定时领福气
    Start-Sleep -Seconds 1
}
$private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\tb_fuguo_exchange.png 821 812 | findstr Matched
if ( "$private:result" -ne "" ) {
    $private:result = "$private:result".Split(" ")
    $private:x = [int]$private:result[1] + 62
    $private:y = [int]$private:result[2] + 22
    .\adb shell input tap $private:x $private:y
    echo 淘金币兑换福气
    Start-Sleep -Seconds 1
}

for ($private:i = 3; $private:i -gt 0; $private:i -= 1) {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\tb_fuguo_view.png 821 812 | findstr Matched
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 62
        $private:y = [int]$private:result[2] + 22
        .\adb shell input tap $private:x $private:y
        echo 逛精选商品
        Start-Sleep -Seconds 18
        .\adb shell input keyevent 4
        echo 返回
        Start-Sleep -Seconds 1
    }
}

.\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
.\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  blackwhite  D:\adb\adb_cap.png  D:\adb\cap_black_white.png
$private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\cap_black_white.png  D:\adb\tb_fuguo_close.png 925 124 | findstr Matched
if ( "$private:result" -ne "" ) {
    $private:result = "$private:result".Split(" ")
    $private:x = [int]$private:result[1] + 56
    $private:y = [int]$private:result[2] + 56
    .\adb shell input tap $private:x $private:y
    for ($private:i = 10; $private:i -gt 0; $private:i -= 1) {
        .\adb shell input tap 540 1676
        echo 浇水
        Start-Sleep -Seconds 2
    }
    .\adb shell input keyevent 4
    echo 返回
}
