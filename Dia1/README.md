
# Dia 1: Información Musical (IM)
(y todo lo que puede hacer por ti)
---

##### Cosas por instalar:
* Supercollider
* Matlib quark
* MIDetectorOSC
* Opcional: Source Seperation & PolyPitch

##### Links interesantes:


##### Temas por ver:
* Sonido y representaciones de senales de audio
* Dominio de Fourier (Transformadas, Espectogramas)
* Tecnicas con Fourier
* Problemas mas avanzados en IM
* Opcional: Source Seperation & PolyPitch

#### Ejercicios:

##### Instalar en su OS favorito [MIDetector](https://github.com/beangoben/MIDetectorOSC)

##### Executar MIDetector en Supercollider con:

```javascript
(
a=MIDetectorManager.new(net:NetAddr("127.0.0.1",32000));
a.addDetector("Pitch");
a.addDetector("Onset");
a.addDetector("Amp");
)
```


##### Activatar lectura de Microfono

```javascript
z = {SoundIn.ar(0)}.play;
```

apagar el microfono con

```javascript
z.free
```

```javascript
(
a=MIDetectorManager.new(ins:z, net:NetAddr("127.0.0.1",32000));
a.addDetector("Pitch");
a.addDetector("Onset");
a.addDetector("Amp");
)
```

##### Probar varios Detectores como y con varios sonidos:

- Deteccion de diferentes tipos de Frecuencias
- Pitch
- Tartini
- FTPeak

```javascript
(
a=MIDetectorManager.new(args:[\doPost,true,\stattime,4,\doStats,true]);
a.addDetector("Pitch");
a.addDetector("Tartini");
a.addDetector("FTPeak");
)
```

- Sonidos a probar:

```javascript
x={
  var freq=MouseX.kr(20,10000).poll(label:"Real freq");
  SinOsc.ar(freq )*0.2
}.play
x.free

// VS a Blip Wave o Buzz with 4 Harmonics
x={
  var freq=MouseX.kr(20,10000).poll(label:"Real freq");
  SinOsc.ar(freq ,4)*0.2
}.play

x.free
// VS a Blip Wave o Buzz with 200 Harmonics
x={
  var freq=MouseX.kr(20,10000).poll(label:"Real freq");
  Blip.ar(freq ,200)*0.2
}.play

x.free

// vs a Bank of frequency resonators
x={ DynKlank.ar([[200, 671, 1153, 1723], nil, [1, 1, 1, 1]], PinkNoise.ar([0.007,0.007])) }.play;
x.free

// vs a White Noise
x={ WhiteNoise.ar(0.2) }.play;
x.free
```

- Detector para Informacion Musical relacionado a Amplitud y Volumen
- Amp
- WAmp
- Loud
- FTPower

```javascript
(
a=MIDetectorManager.new(args:[\doPost,true,\stattime,4,\doStats,true]);
a.addDetector("Amp");
a.addDetector("WAmp",[\winSize,0.2]);
a.addDetector("Loud");
a.addDetector("FTPower");
)
```

- Sonidos a probar

```javascript
//vs a Saw modulated sound
x={
  var amp=LFSaw.ar(0.5, 1).abs.poll(label:"Mod Amp");
  SinOsc.ar(440 )*amp
}.play

x.free
// Vs a slooow chirp
x={
  var amp=Line.kr(1,0,10);
  SinOsc.ar(XLine.kr(8000,400,10))*amp
}.play

x.free
// Vs a fast chirp
x={
  var amp=Line.kr(1,0,2);
  SinOsc.ar(XLine.kr(8000,400,2))*amp
}.play

x.free
//vs Some Impulses
x={Impulse.ar(4)}.play
x.free
//vs Many Impulses
x={Impulse.ar(24)}.play
x.free

//vs random Volume grains
x={Decay2.ar(Dust.ar(4),0.01,0.2,LFNoise2.kr(24).range(0,5))*SinOsc.ar(LFNoise2.kr(2).range(200,8800))*0.2}.play
x.free
```

- Detection Relacionado a Onset
- Onset
- Coyote

```javascript
(
a=MIDetectorManager.new(args:[\doPost,true,\stattime,4,\doStats,true]);
a.addDetector("Onset");
a.addDetector("Coyote");
)
```

- Sonidos a probar

```javascript
x={Impulse.ar(3)}.play
x.free

x={  Mix.ar(Decay2.ar(Impulse.ar([0.5,0.5],[0,0.5]),0.05,[0.25,0.5])* [Pulse.ar(220),Pulse.ar(2200)])}.play;

x.free
```

- Deteccion para bandas de poder, Fourier Transforms Bins and Mags
- FTBins
- FTMags
- PowerBands

```javascript
(
a=MIDetectorManager.new(nets:NetAddr("127.0.0.1",32000),args:[\doPost,true,\doPlot,true,\doStats,true]);
a.addDetector("FTBins"); //sends an array of complex numbers Real1,Imag1....RealN-1,ImagN-1
a.addDetector("FTMags");
a.addDetector("PowerBands");
)
```

-- Sonido a probar

```javascript
x={Mix.ar(SinOsc.ar(LFNoise2.kr([2,1,3,5],1,0).range(20,20000)))*0.01}.play;
x.free
```

##### Comprobar que manda informacion y llega en tu red local con:

```javascript
o = OSCresponderNode(nil, '/pitch', { |t, r, msg| msg.postln;}).add;
```

##### Mandar Informacion musical a otra persona, cambiando puerto y ip. Esto es estando en la misma red local.









