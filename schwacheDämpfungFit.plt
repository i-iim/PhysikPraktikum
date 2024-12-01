# Dateiformat und Titel
set datafile separator ";"
set title "Schwach gedaempftes Federpendel"
set xlabel "Zeit (s)"
set ylabel "Auslenkung (mm)"
set grid

# Dezimalzeichen auf Deutsch einstellen
set decimalsign locale
set decimalsign ","

# Daten plotten
plot "SchwacheFeder_schwachgedämpft.csv" using 2:6 with lines title "Messdaten"

# Fit-Funktion definieren
f(x) = A * exp(-gamma * x) * cos(omega * x + phi)
g(x) = A * exp(-gamma * x)

# Anfangsbedingungen für Fit
A = 22               # Maximale Amplitude
gamma = 0.1          # Annahme: leichte Dämpfung
omega = 2 * 3.14 / 1.3 # Frequenz aus gemessener Periode (1,3 s)
phi = 0.5              # Initialphase

# Fitting durchführen
fit f(x) "SchwacheFeder_schwachgedämpft.csv" using 2:6 via A, gamma, omega, phi

# Ergebnis plottens
set decimalsign locale
set decimalsign ","
plot "SchwacheFeder_schwachgedämpft.csv" using 2:6 with points linecolor rgb "red" title "Messdaten", \
     f(x) with lines linecolor rgb "yellow" title "Fit", \
     g(x) title "Daempfung (Huellkurve)" with lines lt 2

     # Fit-Parameter ausgeben
print "A =", A
print "gamma =", gamma
print "omega =", omega
print "phi =", phi