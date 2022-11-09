cd D:\adb
.\adb devices

for ($private:i = 0; $private:i -lt 12; $private:i += 1) {
    .\adb shell input tap 543 1254
    echo "抽奖"
    Start-Sleep -Seconds 3

    .\adb shell screencap -p /storage/self/primary/Pictures/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/Pictures/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\MeituanFruit\CloseQuChouJiang.png 844 765 907 823 | findstr Matched
    echo $private:result
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 25
        $private:y = [int]$private:result[2] + 25
        .\adb shell input tap $private:x $private:y
        echo "关闭去抽奖"
        Start-Sleep -Seconds 1
        continue
    }

    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\MeituanFruit\Get.png 480 1490 742 1821 | findstr Matched
    echo $private:result
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 55
        $private:y = [int]$private:result[2] + 32
        .\adb shell input tap $private:x $private:y
        echo "领取"
        Start-Sleep -Seconds 1
        continue
    }
}