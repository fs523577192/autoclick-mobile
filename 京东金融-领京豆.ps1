# 请先手动打开“赚钱”页面
cd D:\adb
.\adb devices

.\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
.\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
$private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jdf_can_get.png 103 251 981 282 | findstr Matched
echo $private:result
if ( "$private:result" -ne "" ) {
    $private:result = "$private:result".Split(" ")
    $private:x = [int]$private:result[1] + 0
    $private:y = [int]$private:result[2] + 60
    .\adb shell input tap $private:x $private:y
    echo 可领京豆
    Start-Sleep -Seconds 2

    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jdf_got.png 877 599 970 949 | findstr Matched
    echo $private:result
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 25
        $private:y = [int]$private:result[2] + 25
        .\adb shell input tap $private:x $private:y
        echo 签到成功
        Start-Sleep -Seconds 2
    } else {
        echo 无法关闭签到成功提示
    }
} else {
    echo 无法领京豆
}

.\adb shell input swipe 536 1592 543 358 1000
.\adb shell input swipe 536 1592 543 1258 1000

function waitFinish {
    for ($private:j = 0; $private:j -lt 13; $private:j += 1) {
        Start-Sleep -Seconds 5
        .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
        .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
        $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jdf_finish_task.png 48 286 606 1441 | findstr Matched
        echo $private:result
        if ( "$private:result" -ne "" ) {
            echo 任务完成
            break
        } else {
            echo 未找到任务完成提示
        }
    }
}

function swipe {
    .\adb shell input swipe 543 258 536 1592 1000
    .\adb shell input swipe 543 258 536 1592 1000
    .\adb shell input swipe 536 1592 543 258 1000
    .\adb shell input swipe 536 1592 543 1400 1000
}

for ($private:i = 0; $private:i -lt 6; $private:i += 1) {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jdf_to_view1.png 807 240 936 1308 | findstr Matched
    echo $private:result
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 20
        $private:y = [int]$private:result[2] + 1
        .\adb shell input tap $private:x $private:y
        echo 去浏览
        waitFinish
        .\adb shell input keyevent 4
        echo 返回
        Start-Sleep -Seconds 2
        swipe
        Start-Sleep -Seconds 2
    }
}
