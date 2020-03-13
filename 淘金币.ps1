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
Start-Sleep -Seconds 16
.\adb shell input keyevent 4
echo 返回
Start-Sleep -Seconds 2

.\adb shell input tap 918 1308
echo 逛精选好货
Start-Sleep -Seconds 18
.\adb shell input keyevent 4
echo 返回
Start-Sleep -Seconds 2

.\adb shell input tap 918 1525
echo 逛高抵扣
Start-Sleep -Seconds 15
.\adb shell input keyevent 4
echo 返回
Start-Sleep -Seconds 2

#.\adb shell input tap 918 1737
.\adb shell input tap 918 1525
echo 逛福果
Start-Sleep -Seconds 8
.\种福果.ps1


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