cd D:\adb
.\adb devices

.\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
.\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
$private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_bean_shop.png 270 1381 | findstr Matched
echo $private:result
if ( "$private:result" -ne "" ) {
    $private:result = "$private:result".Split(" ")
    $private:x = [int]$private:result[1] + 30
    $private:y = [int]$private:result[2] + 34
    .\adb shell input tap $private:x $private:y
    echo 逛逛店铺
    Start-Sleep -Seconds 5

    $script:bottleCount=4
    function gotBottle {
        .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
        .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
        $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_got_bottle.png 341 704 | findstr Matched
        if ( "$private:result" -ne "" ) {
            echo 找到营养液
            $script:bottleCount-=1
        }
    }
    function tapStore {
        .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
        .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
        $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_enter_favor.png 100 679 | findstr Matched
        echo $private:result
        if ( "$private:result" -ne "" ) {
            $private:result = "$private:result".Split(" ")
            $private:x = [int]$private:result[1] + 102
            $private:y = [int]$private:result[2] + 37
            .\adb shell input tap $private:x $private:y
            echo 进店并关注
        } else {
            $script:bottleCount=0
            echo 无法进店
        }
    }
    while ($script:bottleCount -gt 0) {
        tapStore
        if ($script:bottleCount -le 0) {
            break
        }
        Start-Sleep -Seconds 13
        gotBottle
        .\adb shell input tap 1006 146
        Start-Sleep -Seconds 2
        .\adb shell input tap 960 293
        echo 取消关注
        Start-Sleep -Seconds 5
        .\adb shell input keyevent 4
        echo 返回
        Start-Sleep -Seconds 5
    }
    .\adb shell input keyevent 4
    echo 返回
}