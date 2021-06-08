# 请先手动打开“领水滴”页面
cd D:\adb
.\adb devices

function goBack {
    .\adb shell input keyevent 4
    echo 返回
    Start-Sleep -Seconds 5
}
function receive {
    .\adb shell input tap 912 700
    echo 领取奖励
    Start-Sleep -Seconds 5
}

function clearUseless {
    java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  clearMatch  D:\adb\adb_cap.png  D:\adb\tb_tjb_shengqian.png 200 800 602 1920 976 128
    java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  clearMatch  D:\adb\adb_cap.png  D:\adb\tb_tjb_tianmao.png 200 800 502 1920 976 128
    java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  clearMatch  D:\adb\adb_cap.png  D:\adb\tb_tjb_maochao.png 200 800 502 1920 976 128
    java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  clearMatch  D:\adb\adb_cap.png  D:\adb\tb_tjb_huafei.png 200 800 502 1920 976 128
    java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  clearMatch  D:\adb\adb_cap.png  D:\adb\tb_tjb_duobao.png 200 800 502 1920 976 128
}

function needSwipe {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    for ($private:i = 1; $private:i -le 6; $private:i += 1) {
        $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  "D:\adb\tjb_need_swipe$private:i.png" 101 90 782 190 | findstr Matched
        if ("$private:result" -ne "") {
            1 -eq 1
            return
        }
    }
    1 -ne 1
}

for ($private:i = 0; $private:i -lt 27; $private:i += 1) {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    clearUseless
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\tb_tjb_view1.png 800 883 | findstr Matched
    echo $private:result
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 55
        $private:y = [int]$private:result[2] + 18
        .\adb shell input tap $private:x $private:y
        echo 去完成
        Start-Sleep -Seconds 5
        $private:result=needSwipe
        echo $private:result
        if ( $private:result[$private:result.length - 1] ) {
            .\adb shell input swipe 536 1600 543 200 10000
            .\adb shell input swipe 536 1600 543 200 10000
        } else {
            Start-Sleep -Seconds 18
        }
        goBack

        .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
        .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
        $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\tb_exit.png 439 1207 641 1265 | findstr Matched
        echo $private:result
        if ( "$private:result" -ne "" ) {
            $private:result = "$private:result".Split(" ")
            $private:x = [int]$private:result[1] + 74
            $private:y = [int]$private:result[2] + 18
            .\adb shell input tap $private:x $private:y
            echo 确定退出
            Start-Sleep -Seconds 5
        }
        receive
    } else {
        break
    }
}

for ($private:i = 0; $private:i -lt 12; $private:i += 1) {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png

    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  revertMatch  D:\adb\adb_cap.png  D:\adb\tb_fuguo_view1.png 840 968 | findstr Matched
    echo $private:result
    if ( "$private:result" -eq "" ) {
        $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  revertMatch  D:\adb\adb_cap.png  D:\adb\tb_fuguo_view.png 840 968 | findstr Matched
        echo $private:result
    }

    if ( "$private:result" -eq "" ) {
        break
    }
    $private:result = "$private:result".Split(" ")
    $private:x = [int]$private:result[1] + 34
    $private:y = [int]$private:result[2] + 9
    .\adb shell input tap $private:x $private:y
    echo 去完成
    Start-Sleep -Seconds 30
    goBack
}

# 做任务领活力
for ($private:i = 0; $private:i -lt 6; $private:i += 1) {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\huoli_view.png 841 828  | findstr Matched
    echo $private:result
    if ( "$private:result" -eq "" ) {
        $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\huoli_wander.png 841 828  | findstr Matched
        echo $private:result
    }
    if ( "$private:result" -eq "" ) {
        break
    }
    $private:result = "$private:result".Split(" ")
    $private:x = [int]$private:result[1] + 55
    $private:y = [int]$private:result[2] + 10
    .\adb shell input tap $private:x $private:y
    echo 浏览
    Start-Sleep -Seconds 33
    .\adb shell input keyevent 4
    echo 返回
    Start-Sleep -Seconds 3
}