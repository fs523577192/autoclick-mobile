cd D:\adb
.\adb devices

.\adb shell am start com.taobao.taobao/com.taobao.tao.TBMainActivity
echo 打开淘宝
Start-Sleep -Seconds 8

.\adb shell input tap 971 1842
echo 我的淘宝
Start-Sleep -Seconds 5

function getSumShine() {
    .\adb shell input tap 505 547
    Start-Sleep -Milliseconds 500
    .\adb shell input tap 321 635
    Start-Sleep -Milliseconds 500
    .\adb shell input tap 74 660
    Start-Sleep -Milliseconds 500
    .\adb shell input tap 891 564
    Start-Sleep -Milliseconds 500
    .\adb shell input tap 684 649
    Start-Sleep -Milliseconds 500
    .\adb shell input tap 914 730
    Start-Sleep -Milliseconds 500
    .\adb shell input tap 245 817
    Start-Sleep -Milliseconds 500
    echo 收阳光
}

.\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
.\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
$private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\taobao_farm.png 600 1106 | findstr Matched
if ( "$private:result" -ne "" ) {
    $private:result = "$private:result".Split(" ")
    $private:x = [int]$private:result[1] + 60
    $private:y = [int]$private:result[2] + 60
    .\adb shell input tap $private:x $private:y
    echo 天猫农场
    Start-Sleep -Seconds 10

    .\adb shell input tap 537 1525
    echo 立刻去收
    Start-Sleep -Milliseconds 500

    .\adb shell input tap 531 1480
    Start-Sleep -Milliseconds 500
    .\adb shell input tap 293 1328
    Start-Sleep -Milliseconds 500
    .\adb shell input tap 536 1206
    Start-Sleep -Milliseconds 500
    .\adb shell input tap 293 1084
    Start-Sleep -Milliseconds 500
    .\adb shell input tap 783 1081
    Start-Sleep -Milliseconds 500
    .\adb shell input tap 537 962
    Start-Sleep -Milliseconds 500
    .\adb shell input tap 296 847
    Start-Sleep -Milliseconds 500
    .\adb shell input tap 776 821
    Start-Sleep -Milliseconds 500
    .\adb shell input tap 539 697
    Start-Sleep -Milliseconds 500
    echo 收作物

    .\adb shell input tap 537 1525
    
    echo 升级收阳光
    Start-Sleep -Seconds 1

    getSumShine

    #.\adb shell input tap 76 1207
    .\adb shell input tap 983 1554
    Start-Sleep -Seconds 1
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\tb_farm_view.png 830 830 | findstr Matched
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 70
        $private:y = [int]$private:result[2] + 75
        .\adb shell input tap $private:x $private:y
        echo 浏览得阳光
        Start-Sleep -Seconds 18
        .\adb shell input keyevent 4
        echo 返回
        Start-Sleep -Seconds 1

        .\adb shell input tap 1009 868
        Start-Sleep -Seconds 1
        getSunShine
    }
}
