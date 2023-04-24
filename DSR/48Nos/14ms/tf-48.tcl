set tam [expr $val(nn) - 1]

for {set i 0} {($i) < $tam} {incr i 2} {
    set udp($i) [new Agent/UDP]
    set sink($i) [new Agent/Null]
    set cbr($i) [new Application/Traffic/CBR]
    $nsim attach-agent $n($i) $udp($i)
    $nsim attach-agent $n([expr $tam-($i)]) $sink($i)
    $nsim connect $udp($i) $sink($i)
    $cbr($i) attach-agent $udp($i)
    $cbr($i) set packetSize_ 512
    $nsim at 1.0 "$cbr($i) start"
}
