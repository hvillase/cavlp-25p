// prender SC
s.boot;
s.quit
// medidior
s.meter;
s.scope

// ruido blanco
{WhiteNoise.ar(0.3)!2}.play

// Sintetizador o instrumento

(
SynthDef(\tri, {|freq=440, pan=0, at=0.01, rel=0.1, amp=0.5, out=0|
	var sen, paneo, env;
	sen= LFTri.ar(freq, 0, amp);
	paneo= Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.new([0, 1, 0], [at, rel]), doneAction: 2);
	Out.ar(out, paneo * env)
}).add
);

a=Synth(\tri, [\rel, 0.1, \freq, rrand(200,800)]);

// Patrón de secuencia
(
~sec=Pdef(\hola, Pbind(
	\instrument, \tri,
	\dur, Pseq([0.125], inf),
	\amp, Pseq([0.75, 0.2, 0.7, 0.4], inf),
	\note, Pseq([0, 2, 4, 5, 14, 12, 5, 4, 2, Pn(9, 4), 0, 12], inf),
	\rel, Pseq([0.2, 0.2, 0.2, 0.7], inf)
))
);

~sec.play.quant(4);
~sec.stop;



