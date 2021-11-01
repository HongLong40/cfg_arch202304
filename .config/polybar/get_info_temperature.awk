#!/bin/awk

BEGIN {
    t = 0
    i = 0
    tmax = 0
    tmin = 999
}   
/Core/ {
    ti = $3;
    gsub(/\+|°C/,"",ti);
    t += ti;
    i++;
    if ( ti >= tmax ) { tmax = ti };
    if ( ti <= tmin ) { tmin = ti };
}
END {
    t = t / i;
    printf("Avg: %.1f°C\nMin: %.1f°C\nMax: %.1f°C\n" , t, tmin, tmax);
}

