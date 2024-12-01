set xlabel "Masse [g]"
set ylabel "Auslenkung [cm]"
set grid

set pointsize 2

plot    "MessungGummi.txt" using 1:2 with points title 'Gewicht aufladen', \
        "MessungGummi.txt" using 1:3 with points title 'Gewicht abladen'