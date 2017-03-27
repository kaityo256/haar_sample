set term png 18
set out "original.png"

unset key
set ytics 0.5
set xtics 64
p [0:256]"original.dat" w l lw 4

set ytics 5
set out "transform.png"
p [0:256]"transform.dat" w l lw 2

set out "inv_transform.png"
set ytics 0.5
set xtics 64
p [0:256] [-1.0:1.01] "inv_transform.dat" w l lw 4
