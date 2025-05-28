// Hola mundo

"Hola Mundo!".postln
// clase 1: introducción a SC
() // parametos
{} // funciones
|| // argumentos
; // salto de línea
~ // variable global
.
,
A-Z 0-9

s.boot;

// Primer sonido, apagar con ctrl+punto
{SinOsc.ar(440,0,0.5)}.play

a=Pbind(\note, Pseq([0, 1, 2, 3, 4, 5, 6], inf)).play

a.stop;
a.play;

\dur
\note
\amp
\pan
