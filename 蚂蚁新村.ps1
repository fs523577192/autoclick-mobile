cd D:\adb
.\adb devices

function goBack {
    .\adb shell input keyevent 4
    echo 返回
    Start-Sleep -Seconds 2
}

.\adb shell input tap 612 947
echo "收豆"
Start-Sleep -Seconds 1

.\adb shell input tap 771 1536
echo "请走"
Start-Sleep -Seconds 2
.\adb shell input tap 715 1538
echo "确认请走"
Start-Sleep -Seconds 1
.\adb shell input tap 329 1685
echo "请走"
Start-Sleep -Seconds 2
.\adb shell input tap 715 1538
echo "确认请走"
Start-Sleep -Seconds 1

function invite {
    .\adb shell screencap -p /storage/self/primary/Pictures/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/Pictures/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\MaYiXinCun\invite.png 798 1022 1018 2397 | findstr Matched
    echo $private:result
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 105
        $private:y = [int]$private:result[2] + 17
        .\adb shell input tap $private:x $private:y
        echo "直接邀请摆摊"
    }
}
.\adb shell input tap 820 1661
echo "邀请摆摊"
Start-Sleep -Seconds 2
invite
.\adb shell input tap 395 1879
echo "邀请摆摊"
Start-Sleep -Seconds 2
invite

function closeAndReturn {
    .\adb shell screencap -p /storage/self/primary/Pictures/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/Pictures/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\MaYiXinCun\close.png 803 1061 935 2397 | findstr Matched
    echo $private:result
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 40
        $private:y = [int]$private:result[2] + 17
        .\adb shell input tap $private:x $private:y
        echo "收摊"
        Start-Sleep -Seconds 2
        .\adb shell input tap 720 1538
        echo "确认收摊"
        Start-Sleep -Seconds 2
    }
}
.\adb shell input tap 532 2213
echo "我的小摊"
Start-Sleep -Seconds 2
for ($private:i = 0; $private:i -lt 4; $private:i += 1) {
    closeAndReturn
}

# TODO
function goOpen {
    .\adb shell screencap -p /storage/self/primary/Pictures/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/Pictures/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\MaYiXinCun\hasPosition.png 896 1061 999 2397 | findstr Matched
    echo $private:result
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 40
        $private:y = [int]$private:result[2] + 17
        .\adb shell input tap $private:x $private:y
        echo "摆摊"
        Start-Sleep -Seconds 2
        
    }
}
.\adb shell screencap -p /storage/self/primary/Pictures/Screenshots/adb_cap.png
.\adb pull /storage/self/primary/Pictures/Screenshots/adb_cap.png
$private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\MaYiXinCun\open.png 802 1061 935 2397 | findstr Matched
echo $private:result
if ( "$private:result" -ne "" ) {
    $private:result = "$private:result".Split(" ")
    $private:x = [int]$private:result[1] + 40
    $private:y = [int]$private:result[2] + 17
    .\adb shell input tap $private:x $private:y
    echo "摆摊"
    Start-Sleep -Seconds 2
    for ($private:i = 0; $private:i -lt 4; $private:i += 1) {
        goOpen
    }
}

