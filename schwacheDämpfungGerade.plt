set datafile separator ";"
set title "Schwach gedaempftes Federpendel"
set xlabel "Zeit (s)"
set ylabel "Auslenkung (mm)"
set grid

# Dezimalzeichen auf Deutsch einstellen
set decimalsign locale
set decimalsign ","

# Lineare Funktion definieren (logarithmierte Amplitude)
damping_line(t) = m * t + b

# Startwerte für die lineare Funktion
m = -0.5  # Anfangswert für die Steigung (Dämpfungskonstante)
b = 20 # Anfangswert für ln(A), wenn maximale Amplitude ca. 22 mm

f(t) = a*t + c
c = 17.8
a = -3.15

# Fit der logarithmierten Daten
fit damping_line(t) "schwacheDämfpungV2.csv" using 2:6 via m, b

# Daten und die Fit-Linie plotten
plot "schwacheDämfpungV2.csv" using 2:6 with points title "Messdaten", \
    f(x) with lines linecolor rgb "red" title "fitgerade daempfung" #, \
    #damping_line(x) with lines linecolor rgb "red" title "Dämpfungsgerade"

print "Gefittete Steigung (m): ", m