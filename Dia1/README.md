
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

- Instalar en su OS favorito[MIDetector](https://github.com/beangoben/MIDetectorOSC)
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

(
a=MIDetectorManager.new(ins:z, net:NetAddr("127.0.0.1",32000));
a.addDetector("Pitch");
a.addDetector("Onset");
a.addDetector("Amp");
)
```

- Probar varios Detectores como:

- Comprobar que manda informacion en tu red local con:

- Mandar Informacion musical a otra persona, cambiando puerto y ip. Esto es estando en la misma red local.









