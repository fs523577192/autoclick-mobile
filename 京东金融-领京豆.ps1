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
# for ($private:j = 0; $private:j -lt 3; $private:j += 1)
for ($private:i = 0; $private:i -lt 3; $private:i += 1) {
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

# 请先准备好每日签到页面
for ($private:i = 0; $private:i -lt 4; $private:i += 1) {
    .\adb shell input swipe 855 1113 521 1113 1000
    Start-Sleep -Seconds 2
    .\adb shell input tap 855 1113
    echo 去浏览
    waitFinish
    .\adb shell input keyevent 4
    echo 返回
    Start-Sleep -Seconds 5
}

# 请先准备好“金果摇钱树”任务页面
for ($private:i = 0; $private:i -lt 6; $private:i += 1) {
    .\adb shell input tap 908 1347
    echo 去浏览
    Start-Sleep -Seconds 4

    .\adb shell input keyevent 4
    echo 返回
    Start-Sleep -Seconds 6

    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jdf_fruit_task.png 30 1066 196 1428 | findstr Matched
    echo $private:result
    if ( "$private:result" -eq "" ) {
        .\adb shell input keyevent 4
        echo 返回
        Start-Sleep -Seconds 5
    }
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jdf_fruit_task.png 30 1366 196 1428 | findstr Matched
    echo $private:result
    if ( "$private:result" -ne "" ) {
        echo 无法找到任务按钮
        break
    }

    Start-Sleep -Seconds 5
    .\adb shell input tap 103 1153
    echo 任务
    Start-Sleep -Seconds 4
}
