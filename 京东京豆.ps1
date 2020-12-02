# 请先手动打开“领京豆”页面
cd D:\adb
.\adb devices

.\adb shell input tap 480 615
echo 进店领豆
Start-Sleep -Seconds 15

#.\adb shell input tap 900 620
# 第一个店
#.\adb shell input tap 900 1220
# 第二个店
function enterAndGet {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_enter.png 791 568 | findstr Matched
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 108
        $private:y = [int]$private:result[2] + 43
        .\adb shell input tap $private:x $private:y
        echo 进店领豆
        
        Start-Sleep -Seconds 15
        .\adb shell input keyevent 4
        echo 返回
        Start-Sleep -Seconds 5
    }
}
enterAndGet
enterAndGet
.\adb shell input keyevent 4
echo 返回
Start-Sleep -Seconds 5

.\adb shell input tap 540 400
echo 签到
Start-Sleep -Seconds 15
.\adb shell input keyevent 4
echo 返回
Start-Sleep -Seconds 5

.\adb shell input tap 1000 326
echo 种豆得豆
Start-Sleep -Seconds 15

.\adb shell input tap 872 462
echo 免费水果
Start-Sleep -Seconds 15
.\adb shell input tap 125 1633
echo 每日签到
Start-Sleep -Seconds 5
.\adb shell input tap 543 1342
echo 签到
Start-Sleep -Seconds 5
.\adb shell input tap 551 1370
echo 我知道了
Start-Sleep -Seconds 5

for ($i = 0; $i -lt 9; $i += 1) {
    .\adb shell input tap 908 1651
    echo 浇水
    Start-Sleep -Seconds 5
}

.\adb shell input tap 302 1677
echo 领水滴
Start-Sleep -Seconds 3
for ($private:i = 7; $private:i -gt 0; $private:i -= 1) {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_fruit_view.png 816 802 | findstr Matched
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 62
        $private:y = [int]$private:result[2] + 22
        .\adb shell input tap $private:x $private:y
        echo 去逛逛
        Start-Sleep -Seconds 15
        .\adb shell input keyevent 4
        echo 返回
        Start-Sleep -Seconds 5

        .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
        .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
        $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_fruit_get.png 404 1529 | findstr Matched
        if ( "$private:result" -ne "" ) {
            $private:result = "$private:result".Split(" ")
            $private:xx = [int]$private:result[1] + 125
            $private:yy = [int]$private:result[2] + 34
            .\adb shell input tap $private:xx $private:yy
            echo 立刻领取
            Start-Sleep -Seconds 2
        }
        .\adb shell input tap $private:x $private:y
        echo 领水滴
        Start-Sleep -Seconds 2
    }
}

#.\adb shell input tap 1023 817
#echo 关闭“领水滴”
#Start-Sleep -Seconds 1

#.\adb shell input tap 329 1595
#echo 领水滴
#Start-Sleep -Seconds 3

for ($private:i = 3; $private:i -gt 0; $private:i -= 1) {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_fruit_get1.png 816 1002 | findstr Matched
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 35
        $private:y = [int]$private:result[2] + 21
        .\adb shell input tap $private:x $private:y
        echo 领取
        Start-Sleep -Seconds 5
    }
}

.\adb shell input keyevent 4
echo 返回
Start-Sleep -Seconds 5

function goToActivity {
    .\adb shell input tap 738 1678
    echo 逛逛会场
    Start-Sleep -Seconds 5
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_walk.png 129 1035 | findstr Matched
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 84
        $private:y = [int]$private:result[2] + 28
        .\adb shell input tap $private:x $private:y
    }
    .\adb shell input keyevent 4
    echo 返回
    Start-Sleep -Seconds 5
}


.\京豆-商品.ps1
Start-Sleep -Seconds 5
.\京豆-店铺.ps1


# 宠汪汪
for ($private:i = 13; $private:i -gt 0; $private:i -= 1) {
    .\adb shell input tap 896 1867
    echo 逛逛会场
    Start-Sleep -Seconds 15

    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_get_cash.png 560 980 | findstr Matched
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 148
        $private:y = [int]$private:result[2] + 31
        .\adb shell input tap $private:x $private:y
        echo 签到领现金
        Start-Sleep -Seconds 2
        .\adb shell input tap 532 1300
        echo 知道了
        Start-Sleep -Seconds 2
    }

    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_xiaowo.png 431 115 647 178 | findstr Matched
    if ( "$private:result" -ne "" ) {
        .\adb shell input tap 199 147
    } else {
        .\adb shell input keyevent 4
    }
    echo 返回
    Start-Sleep -Seconds 5
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_exit_get_cash.png 458 1148 | findstr Matched
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 72
        $private:y = [int]$private:result[2] + 24
        .\adb shell input tap $private:x $private:y
        echo 知道了
        Start-Sleep -Seconds 5
    }
}

for ($private:i = 7; $private:i -gt 0; $private:i -= 1) {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_dog_view.png 756 218 | findstr Matched
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 96
        $private:y = [int]$private:result[2] + 24
        .\adb shell input tap $private:x $private:y
        echo 进入并关注
        Start-Sleep -Seconds 8

        .\adb shell input keyevent 4
        echo 返回
        Start-Sleep -Seconds 5
    }
}
.\adb shell input swipe 536 1590 543 300 500
Start-Sleep -Seconds 1
for ($private:i = 7; $private:i -gt 0; $private:i -= 1) {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_dog_view.png 756 218 | findstr Matched
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 96
        $private:y = [int]$private:result[2] + 24
        .\adb shell input tap $private:x $private:y
        echo 进入并关注
        Start-Sleep -Seconds 8

        .\adb shell input keyevent 4
        echo 返回
        Start-Sleep -Seconds 5
    }
}
