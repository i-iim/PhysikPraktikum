set datafile separator ";"
set title "Schwach gedaempftes Federpendel"
set xlabel "Zeit (s)"
set ylabel "Auslenkung (mm)"
set grid

# Use columns 2 and 7 for time and deflection
set decimalsign locale;
set decimalsign ","
plot "SchwacheFeder_schwachgedämpft.csv" using 2:6 with points title ""