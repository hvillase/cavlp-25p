// El sintetizador de sonido

// Prendemos supercollider
s.boot;

// Cargar sonido en Buffer
b = Buffer.read(s, "/home/hernani/cavlp-25p/sonidos/git1-m.wav");

// Ruta Mac
//"/Users/name/Desktop/folder/sonido2.wav"

// Ruta Windows
// desde c:

// Sintetizador de sonido MONO
(
SynthDef(\sonido1, {|rate=1, sp=0, pan=0, amp=1, at=0.001, sus=1, rel|
	var sonido, hpf, env, paneo;
	sonido=PlayBuf.ar(b.numChannels, b.bufnum, rate, 1, sp * b.numFrames, 0);
	hpf=HPF.ar(sonido, 20);
	paneo=Pan2.ar(hpf, pan, amp);
	env=EnvGen.ar(Env([0,1,1,0], [at, sus * b.duration, rel]), doneAction:2);
	Out.ar(0, paneo * env)
}).add;
)

Synth(\sonido1, [\rate, 2, \amp, 1]);

// Secuencia patrón
// variable global
// play, quant, stop

(
~seq1=Pdef(\tacos,
	Pbind(\instrument,\sonido1,
		\amp,0.4,
		\dur, Pseq([1/8, 1/4, 1/4], inf),
		\rate, Pseq([1, 2, 0.5, 1.5, 0.6, 1.2], inf)))
);

~seq1.play.quant(4);
~seq1.stop

// Patrones
pseq
pn
prand
pshuffle
Librería de patrones