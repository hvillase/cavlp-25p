// clase 4

s.boot; // prender server
s.quit; // apagar
s.meter;
s.scope;

TempoClock.tempo=60/60;
LinkClock.help;
TecnoTexto.help;

// buffers

(
~b1= Buffer.read(s, "/home/hernani/cavlp-25p/sonidos/pelota1_st.wav");
~b2= Buffer.read(s, "/home/hernani/cavlp-25p/sonidos/silbato2_st.wav");
~b3= Buffer.read(s, "/home/hernani/cavlp-25p/sonidos/spray1_st.wav");
~b4= Buffer.read(s, "/home/hernani/cavlp-25p/sonidos/tapa_botella_st.wav");
);

// synthes
(
(
SynthDef(\s1, {|rate=1, sp=0, pan=0, amp=1, at=0.001, sus=1, rel, out=0|
	var sonido, hpf, env, paneo;
	sonido=PlayBuf.ar(~b1.numChannels, ~b1.bufnum, rate, 1, sp * ~b1.numFrames, 0);
	hpf=HPF.ar(sonido, 20);
	paneo=Pan2.ar(hpf, pan, amp);
	env=EnvGen.ar(Env([0,1,1,0], [at, sus * ~b1.duration, rel]), doneAction:2);
	Out.ar(out, paneo * env)
}).add;
);

(
SynthDef(\s2, {|rate=1, sp=0, pan=0, amp=1, at=0.001, sus=1, rel, out=0|
	var sonido, hpf, env, paneo;
	sonido=PlayBuf.ar(~b2.numChannels, ~b2.bufnum, rate, 1, sp * ~b2.numFrames, 0);
	hpf=HPF.ar(sonido, 20);
	paneo=Pan2.ar(hpf, pan, amp);
	env=EnvGen.ar(Env([0,1,1,0], [at, sus * ~b2.duration, rel]), doneAction:2);
	Out.ar(out, paneo * env)
}).add;
);

(
SynthDef(\s3, {|rate=1, sp=0, pan=0, amp=1, at=0.001, sus=1, rel, out=0|
	var sonido, hpf, env, paneo;
	sonido=PlayBuf.ar(~b3.numChannels, ~b3.bufnum, rate, 1, sp * ~b3.numFrames, 0);
	hpf=HPF.ar(sonido, 20);
	paneo=Pan2.ar(hpf, pan, amp);
	env=EnvGen.ar(Env([0, 1, 1, 0], [at, sus * ~b3.duration, rel]), doneAction:2);
	Out.ar(out, paneo * env)
}).add;
);

(
SynthDef(\s4, {|rate=1, sp=0, pan=0, amp=1, at=0.001, sus=1, rel, out=0|
	var sonido, hpf, env, paneo;
	sonido=PlayBuf.ar(~b4.numChannels, ~b4.bufnum, rate, 1, sp * ~b4.numFrames, 0);
	hpf=HPF.ar(sonido, 20);
	paneo=Pan2.ar(hpf, pan, amp);
	env=EnvGen.ar(Env([0, 1, 1, 0], [at, sus * ~b4.duration, rel]), doneAction:2);
	Out.ar(out, paneo * env)
}).add;
);
);

Synth(\s1);
Synth(\s2);
Synth(\s3);
Synth(\s4);

// secuencias

(
~sec1=Pdef(\sec1, Pbind(\instrument, \s1,
	\dur, Pseq([2],inf),
	\rate, Pseq([1], inf),
	\amp, 1,
	\out, 0
))
);

(
~sec2=Pdef(\sec2, Pbind(\instrument, \s2,
	\dur, Pseq([2, 1, 1], inf),
	\rate, Pseq([1, 1.2, 1], inf),
	\at, 0.01,
	\sus, 0.04,
	\rel, 0.02,
	\amp, 1,
	\out, 0
))
);

(
~sec3=Pdef(\sec3, Pbind(\instrument, \s3,
	\dur, 1,
	\amp, 0.4,
	\out, 0
))
);

(
~sec4=Pdef(\sec4, Pbind(\instrument, \s4,
	\dur, Pseq([1, 0.25, 0.5], inf),
	\amp, 0.4,
	\out, 0
))
);

~sec1.play.quant(4);
~sec1.stop;
~sec2.play.quant(4);
~sec2.stop;
~sec3.play.quant(4);
~sec3.stop;
~sec4.play.quant(4);
~sec4.stop;
