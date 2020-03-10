# 请先手动打开“领水滴”页面
cd D:\adb
.\adb devices

.\adb shell input tap 537 1462
echo 立即签到
Start-Sleep -Seconds 2
.\adb shell input tap 904 477
Start-Sleep -Seconds 2
.\adb shell input tap 967 1099
echo 领水滴
Start-Sleep -Seconds 2

.\adb shell input tap 918 884
echo 签到
Start-Sleep -Seconds 2

.\adb shell input tap 918 1100
echo 逛指定商品
Start-Sleep -Seconds 15
.\adb shell input keyevent 4
echo 返回

.\adb shell input tap 918 1308
echo 逛精选好货
Start-Sleep -Seconds 15
.\adb shell input keyevent 4
echo 返回

.\adb shell input tap 918 1525
echo 逛高抵扣
Start-Sleep -Seconds 15
.\adb shell input keyevent 4
echo 返回

.\adb shell input tap 918 1737
echo 逛福果
Start-Sleep -Seconds 8
.\adb shell input tap 1021 1635
echo 做任务
Start-Sleep -Seconds 1
.\adb shell input tap 886 843
echo 签到
Start-Sleep -Seconds 1
.\adb shell input tap 888 1588
echo 定时领福气
Start-Sleep -Seconds 1
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
    }
}
for ($private:i = 10; $private:i -gt 0; $private:i -= 1) {
    .\adb shell input tap 540 1676
    echo 浇水
    Start-Sleep -Seconds 2
}
.\adb shell input keyevent 4
echo 返回