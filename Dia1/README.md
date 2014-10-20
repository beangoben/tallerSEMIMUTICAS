
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

##### Ejercicio:

- Instalar en su OS favorito [MIDetector](https://github.com/beangoben/MIDetectorOSC)

- Executar MIDetector en Supercollider con:

```javascript
(
a=MIDetectorManager.new(net:NetAddr("127.0.0.1",32000));
a.addDetector("Pitch");
a.addDetector("Onset");
a.addDetector("Amp");
)
```

- Activatar lectura de Microfono

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

- Probar varios Detectores como y con varios sonidos:

- Deteccion de diferentes tipos de Frecuencias
  Pitch
  Tartini
  FTPeak

```javascript
(
a=MIDetectorManager.new(args:[\doPost,true,\stattime,4,\doStats,true]);
a.addDetector("Pitch");
a.addDetector("Tartini");
a.addDetector("FTPeak");
)
```

Sonidos a probar:

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
```javascript


- Comprobar que manda informacion y llega en tu red local con:

```javascript
o = OSCresponderNode(nil, '/pitch', { |t, r, msg| msg.postln;}).add;
```

- Mandar Informacion musical a otra persona, cambiando puerto y ip. Esto es estando en la misma red local.









