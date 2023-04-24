#localização inicial randomizada dos nós móveis
for {set i 0} {$i < $val(nn) } { incr i } {
            set xx [expr rand()*500]
            set yy [expr rand()*500]
            $n($i) set X_ $xx
            $n($i) set Y_ $yy
            $n($i) set Z_ 0.0
}

#define rótulos 
for {set i 0} {$i < $val(nn)} { incr i } {
     $nsim at 0.0 "$n($i) label N($i)"
}

# define movimentação dos nós
for {set i 0} {$i < $val(nn)} { incr i } {
     $nsim at 5.0 "$n($i) setdest [expr rand()*500] [expr rand()*500] $val(delay)"
     }
    