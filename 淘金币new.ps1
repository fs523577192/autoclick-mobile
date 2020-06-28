# 请先手动打开“领水滴”页面
cd D:\adb
.\adb devices

function receive {
    .\adb shell input tap 918 1066
    echo 一键领取
    Start-Sleep -Seconds 2
}

for ($private:i = 0; $private:i -lt 4; $private:i += 1) {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\tb_tjb_view2.png 859 1143 | findstr Matched
    echo $private:result
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 55
        $private:y = [int]$private:result[2] + 18
        .\adb shell input tap $private:x $private:y
        echo 去浏览
        Start-Sleep -Seconds 25
        .\adb shell input keyevent 4
        echo 返回
        Start-Sleep -Seconds 3
        receive
    } else {
        $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\tb_tjb_view1.png 859 1143 | findstr Matched
        echo $private:result
        if ( "$private:result" -ne "" ) {
            $private:result = "$private:result".Split(" ")
            $private:x = [int]$private:result[1] + 55
            $private:y = [int]$private:result[2] + 18
            .\adb shell input tap $private:x $private:y
            echo 去浏览
            Start-Sleep -Seconds 25
            .\adb shell input keyevent 4
            echo 返回
            Start-Sleep -Seconds 3
            receive
        } else {
            break
        }
    }
}

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