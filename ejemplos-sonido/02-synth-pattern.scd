// clase 2: synth + pattern

s.boot;
s.quit;

// SynthDef

(
SynthDef(\tri, {|freq=440, pan=0, at=0.01, rel=0.1, amp=0.5, out=0|
	var sen, paneo, env;
	sen= LFTri.ar(freq, 0, amp);
	paneo= Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.new([0, 1, 0], [at, rel]), doneAction: 2);
	Out.ar(out, paneo * env)
}).add
);

a=Synth(\tri);

// Pattern: Pdef con Pseq

(
~sec1=Pdef(\sec1, Pbind(
	\instrument, \tri,
	\dur, 0.125,
	\note, Pseq([0, 2, 4, 5, 7, 12], inf),
	\amp, 0.5
))
);

~sec1.play;
~sec1.stop;