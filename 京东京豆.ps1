# 请先手动打开“领京豆”页面
cd D:\adb
.\adb devices

for ($i = 0; $i -lt 8; $i += 1) {
    .\adb shell input tap 908 1651
    echo 浇水
    Start-Sleep -Milliseconds 80
    for ($j = 0; $j -lt 6; $j += 1) {
        .\adb shell input tap 577 1225
        Start-Sleep -Milliseconds 80
    }
    echo 小鸭
    Start-Sleep -Seconds 7
    .\adb shell input tap 540 1380
    Start-Sleep -Seconds 1
}

.\adb shell input tap 302 1677
echo 领水滴
Start-Sleep -Seconds 3
for ($private:i = 9; $private:i -gt 0; $private:i -= 1) {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_fruit_view.png 816 802 | findstr Matched
    echo $private:result
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 62
        $private:y = [int]$private:result[2] + 22
        .\adb shell input tap $private:x $private:y
        echo 去逛逛
        Start-Sleep -Seconds 15

        .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
        .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
        $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_exit_to_home.png 172 114 231 173 | findstr Matched
        echo $private:result
        if ( "$private:result" -ne "" ) {
            $private:result = "$private:result".Split(" ")
            $private:xx = [int]$private:result[1] + 25
            $private:yy = [int]$private:result[2] + 25
            .\adb shell input tap $private:xx $private:yy
        } else {
            .\adb shell input keyevent 4
        }
        echo 返回
        Start-Sleep -Seconds 5

        .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
        .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
        $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_fruit_get.png 404 1529 | findstr Matched
        echo $private:result
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


.\京豆-商品.ps1
Start-Sleep -Seconds 5
.\京豆-店铺.ps1



# 宠汪汪
for ($private:i = 8; $private:i -gt 0; $private:i -= 1) {
    .\adb shell input tap 896 1400 #1604 #1867
    echo 逛逛会场
    Start-Sleep -Seconds 15

    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_get_cash.png 560 980 | findstr Matched
    echo $private:result
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
    echo $private:result
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
    echo $private:result
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 72
        $private:y = [int]$private:result[2] + 24
        .\adb shell input tap $private:x $private:y
        echo 知道了
        Start-Sleep -Seconds 5
    }
}

for ($private:i = 6; $private:i -gt 0; $private:i -= 1) {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_dog_view1.png 746 218 | findstr Matched
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
for ($private:i = 6; $private:i -gt 0; $private:i -= 1) {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_dog_view1.png 746 218 | findstr Matched
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

        .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
        .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
        $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_yingxiao.png 430 114 648 178 | findstr Matched
        if ( "$private:result" -ne "" ) {
            .\adb shell input keyevent 4
            echo 返回
            Start-Sleep -Seconds 5
        }
    }
}
