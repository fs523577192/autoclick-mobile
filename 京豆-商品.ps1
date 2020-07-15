cd D:\adb
.\adb devices

function tapHeart {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_heart.png 920 1194 | findstr Matched
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 30
        $private:y = [int]$private:result[2] + 30
        .\adb shell input tap $private:x $private:y
        echo 取消关注
    } else {
        $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_heart1.png 920 1194 | findstr Matched
        if ( "$private:result" -ne "" ) {
            $private:result = "$private:result".Split(" ")
            $private:x = [int]$private:result[1] + 30
            $private:y = [int]$private:result[2] + 30
            .\adb shell input tap $private:x $private:y
            echo 取消关注
        }
    }
}

.\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
.\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
$private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_bean_goods.png 602 1381 | findstr Matched
echo $private:result
if ( "$private:result" -ne "" ) {
    $private:result = "$private:result".Split(" ")
    $private:x = [int]$private:result[1] + 28
    $private:y = [int]$private:result[2] + 32
    .\adb shell input tap $private:x $private:y
    echo 挑选商品
    Start-Sleep -Seconds 5

    for ($i = 0; $i -lt 6; $i += 1) {
        .\adb shell input tap 830 1490
        echo 关注商品
        Start-Sleep -Seconds 10
        tapHeart
        Start-Sleep -Seconds 5
        .\adb shell input keyevent 4
        echo 返回
        Start-Sleep -Seconds 2
        .\adb shell input swipe 830 1490 240 1490 500
        echo 右划
        Start-Sleep -Seconds 2
    }
    .\adb shell input keyevent 4
    echo 返回
}