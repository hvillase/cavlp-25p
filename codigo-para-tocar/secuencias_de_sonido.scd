//==================================
// Secuencias para sintes de sonido
//==================================

// Instrucciones:
// 1 primero declara los buffers y synthdefs del documento sintes_de_sonido.scd
// 2 declara el Pdef
// 3 declara play
// 4 modifica los valores del Pdef y declara al vuelo para hacer live coding

// establece el tempo de la pieza. 120/60 equivale a un tempo bpm de 120
TempoClock.tempo=120/60;

(
(
~son1 = Pdef(\son1, Pbind(\instrument, \audio1,
	\dur, Pseq([1/4, 3/4, 1/2, 1/2], inf),
	\sus, Pseq([1, 0.01, 0.1, 0.02], inf),
	\rel, Pseq([0.01, 0.08, 0.05, 0.04], inf),
	\rate, Pseq([1, 1.21, 1.38, 1], inf),
	\sp, Pseq([0, 0.2, 0.3, 0.4, 0.5, 0.4, 0.3, 0.5], inf),
	\amp, 0.2,
	\out, 11
	))
);

(
~son2 = Pdef(\son2, Pbind(\instrument, \audio2,
	\dur, Pseq([2], inf),
	\at, 0.01,
	\sus, Pseq([0.05], inf),
	\rel, Pseq([0.3], inf),
	\rate, Pseq([1.22], inf),
	\sp, Pseq([0.1], inf),
	\amp, 0.9,
	\out, 9
))
);

(
~son3 = Pdef(\son3, Pbind(\instrument, \audio3,
	\dur, Pseq([1/4, 3/4, 1, 1, 1], inf),
	\at, 0.01,
	\sus, Pseq([0.1], inf),
	\rel, Pseq([0.1], inf),
	\rate, Pseq([0.5, 0.9, 1, 0.5, 0.5], inf),
	\sp, Pseq([0.1], inf),
	\amp, 0.6,
	\out, 0
))
);

(
~son4 = Pdef(\son4, Pbind(\instrument, \audio4,
	\dur, Pseq([1], inf),
	\at, 0.001,
	\sus, Pseq([0.3], inf),
	\rel, Pseq([0.08], inf),
	\rate, Pseq([1, 1, 1, 1], inf),
	\sp, Pseq([0], inf),
	\amp, Pseq([0, 0.3], inf),
	\out, 0
))
);

(
~son5 = Pdef(\son5, Pbind(\instrument, \audio5,
	\dur, Pseq([3/4, 1/4, 1], inf),
	\sus, Pseq([0.04, 0.02], inf),
	\rel, Pseq([0.2, 0.04], inf),
	\rate, Pseq([1.2, 2, 1], inf),
	\sp, Pseq([0, 0], inf),
	\amp, 0.2,
	\out, 0
))
);

(
~son6 = Pdef(\son6, Pbind(\instrument, \audio6,
	\dur, Pseq([3, 1, 2, 1/2, 3/2], inf),
	\sus, Pseq([0.025], inf),
	\rel, Pseq([0.15], inf),
	\rate, Pseq([1], inf),
	\sp, 0,
	\amp, 0.5,
	\out, 0
))
);
);

~son1.play.quant(4);
~son1.stop;
~son2.play.quant(4);
~son2.stop;
~son3.play.quant(4);
~son3.stop;
~son4.play.quant(4);
~son4.stop;
~son5.play.quant(4);
~son5.stop;
~son6.play.quant(4);
~son6.stop;

s.quit; // APAGA supercollider