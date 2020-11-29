# 请先手动打开“赚钱”页面
cd D:\adb
.\adb devices

.\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
.\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
for ($private:i = 1; $private:i -le 4; $private:i += 1) {
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jdf_can_get$private:i.png 103 251 1080 397 | findstr Matched
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
        break;
    }
}
if ($private:i -ge 5) {
    echo 无法领京豆
}

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
    for ($private:i = 0; $private:i -lt 3; $private:i += 1) {
        .\adb shell input swipe 543 258 536 1592 300
        Start-Sleep -Seconds 1
    }

    for ($private:i = 0; $private:i -lt 3; $private:i += 1) {
        .\adb shell input swipe 536 1515 543 350 1200
        Start-Sleep -Seconds 1
    }
}

function getAndRefresh {
    for ($private:i = 0; $private:i -lt 3; $private:i += 1) {
        .\adb shell input swipe 543 258 536 1592 300
        Start-Sleep -Seconds 1
    }

    for ($private:i = 0; $private:i -lt 3; $private:i += 1) {
        .\adb shell input swipe 536 1590 543 300 1200
        Start-Sleep -Seconds 1

        .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
        .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
        $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jdf_to_get.png 760 240 936 1320 | findstr Matched
        echo $private:result
        if ( "$private:result" -ne "" ) {
            $private:result = "$private:result".Split(" ")
            $private:x = [int]$private:result[1] + 20
            $private:y = [int]$private:result[2] + 10
            .\adb shell input tap $private:x $private:y
            echo 领取奖励
            Start-Sleep -Seconds 3

            .\adb shell input tap 1014 157
            echo 菜单
            Start-Sleep -Seconds 3

            .\adb shell input tap 332 1428
            echo 刷新
            Start-Sleep -Seconds 8

            swipe
            break
        }
    }
}

for ($private:i = 0; $private:i -lt 12; $private:i += 1) {
    getAndRefresh

    Start-Sleep -Seconds 2
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jdf_to_view1.png 807 240 936 1308 | findstr Matched
    echo $private:result
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 20
        $private:y = [int]$private:result[2]
        .\adb shell input tap $private:x $private:y
        echo 去浏览
        waitFinish
        .\adb shell input keyevent 4
        echo 返回
        Start-Sleep -Seconds 2
        continue
    }

    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jdf_to_view2.png 807 240 936 1308 | findstr Matched
    echo $private:result
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 20
        $private:y = [int]$private:result[2]
        .\adb shell input tap $private:x $private:y
        echo 去浏览
        waitFinish
        .\adb shell input keyevent 4
        echo 返回
        Start-Sleep -Seconds 2
    }
}

# 请先准备好每日签到页面
.\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
.\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
$private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jdf_sign.png 374 730 726 1100 | findstr Matched
echo $private:result

if ( "$private:result" -ne "" ) {
    $private:result = "$private:result".Split(" ")
    $private:x = [int]$private:result[1] + 104
    $private:y = [int]$private:result[2] + 28
    .\adb shell input tap $private:x $private:y
    echo 签到
    Start-Sleep -Seconds 5
    .\adb shell input keyevent 4
    echo 返回
    Start-Sleep -Seconds 5
}
.\adb shell input tap 979 1401
echo 双签
Start-Sleep -Seconds 5
.\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
.\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
$private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jdf_double_sign.png 424 1422 | findstr Matched
echo $private:result
if ( "$private:result" -ne "" ) {
    $private:result = "$private:result".Split(" ")
    $private:x = [int]$private:result[1] + 105
    $private:y = [int]$private:result[2] + 30
    .\adb shell input tap $private:x $private:y
    echo 领取
    Start-Sleep -Seconds 5
}
.\adb shell input keyevent 4
echo 返回
Start-Sleep -Seconds 5

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
for ($private:i = 0; $private:i -lt 16; $private:i += 1) {
    .\adb shell input tap 103 1153
    echo 任务
    Start-Sleep -Seconds 4
    
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jdf_fruit_get.png 830 1000 970 1480 | findstr Matched
    echo $private:result
    if ( "$private:result" -ne "" ) {
        .\adb shell input tap 908 1500
        echo 领取
        Start-Sleep -Seconds 8
        continue
    }

    #.\adb shell input tap 908 1600
    .\adb shell input tap 908 1500
    echo 去浏览
    Start-Sleep -Seconds 4

    .\adb shell input keyevent 4
    echo 返回
    Start-Sleep -Seconds 8

    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jdf_fruit_task.png 30 1000 196 1428 | findstr Matched
    echo $private:result
    if ( "$private:result" -eq "" ) {
        .\adb shell input keyevent 4
        echo 返回
        Start-Sleep -Seconds 5
    }
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jdf_fruit_task.png 30 1000 196 1428 | findstr Matched
    echo $private:result
    if ( "$private:result" -eq "" ) {
        echo 无法找到任务按钮
        break
    }
    Start-Sleep -Seconds 5
}
