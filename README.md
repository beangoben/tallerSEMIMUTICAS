<<<<<<< HEAD
tallerSEMIMUTICAS
=================

## Información Musical para procesos autónomos (visuales y sonoros)!
##### Aka Como extraer y conectar Información Musical sin hacer mucho trabajo.
##### Aka Algoritmica Uroboros
___

Este taller esta intencionado como una introducción a técnicas de procesamiento de audio para extraer información musical y conectarla a otros sistemas mediante OSC.
El taller esta divido en tres sesiones:

1. **Información Musical:** Como podemos encontrar y detectar patrones dentro de la música? Veremos las ideas teóricas principales : Transformada de Fourier.
Tambien tocando en wavelets, diccionario de átomos de tiempo-frecuencia. Ademas algoritmos básicos para encontrar información musical. Como ejercicio: probaremos varios tipos de detectores musicales con diferentes cualidades del sonido. 

2. **Visuales:** Conectaremos la información con visuales, para explorar la creación y manipulación de visuales mediante el sonido. Culminaremos con Sistemas Físicos. Como teoría veremos las ideas básicas detrás de un sistema físico newtoniano.

3. **Feedback-loop Sonoro:** Conectaremos la información con el sonido, para explorar la modulación de sonidos mediante información de si misma. Como teoría veremos varios ejemplos de procesos autónomos dentro de la música.

4. **Algo mas?** Quieres ver algun algoritmo en particular? Alguna idea en general? Podemos remplazar algun de los modulos por otros. 

#### Plataformas

Las plataformas para el taller van a ser Supercollider y Processing, pero las técnicas e ideas se pueden aplicar a otros programas como PureData, Openframeworks, Cinder, etc.

No se requiere conocimientos previos en Supercollider y Processing, pero conocimientos generales y básicos en programación ayudan mucho.

Baja **Processing** aqui: https://processing.org/download/?processing
* Usa la version 2.2.1 con pde X: https://github.com/processing/processing-experimental
* O solamente 3.0a4 (Lo mas recomendable)

Baja **Supercollider** (version >= 3.6.5) aqui: http://supercollider.github.io/
Librerias de Informacion Musical:
* MIDetectorOSC: https://github.com/beangoben/MIDetectorOSC
* SCMIR & SourceSeparation & PolyPitch & wavelets : http://www.sussex.ac.uk/Users/nc81/code.html 




  
=======
MIDetectorOSC
=============
*Last tested on SuperCollider 3.6.5 on Ubuntu 13.04, Requires SC3-plugins installed.*


Supercollider extension Quark-wannabe for relaying Music Information via OSC.
The main motivation behind this quark is to have connect visual interactions with sound interactions via OSC Messaging.
Ideally you would run the detector in SC and relay the info to your favorite program like Processing, OF, Cinder, etc.


How to install as a Quark
-------------------------

1.  Clone to the to the Supercollider/quarks folder, typically this is
  * Linux:  ~/.local/share/SuperCollider/
  * MacOSX: ~/Library/Application\ Support/SuperCollider/
  * Windows: C:\Users\UserName\SuperCollider\

  So this would be...

    <pre><code>cd folder
    git clone https://github.com/beangoben/MIDetectorOSC.git
    </code></pre>
    
2.  Copy MIDetectorOSC.quark to the Supercollider/quarks/DIRECTORY folder.
3.  You can now install via Quarks.gui.
4.  Checkout the MIDetectorOSC guide/overview helpfile.


How to install as an Extension
-------------------------

Just copy to your Supercollider/Extensions folder.


Wish/Todo-list:
-------------------------
* Onset detection + BandPass filtering needs some work.
* Fix multiple onset detectors bug (might be LocalBuf?).
* More detectors: FFT Centroids, Chromagrams, Mel coefficients.
* Make awesome documentation and examples with processing.
* Calculate statistical info like medians, max,min, averages and variance.

Want to contribute with code? Have any Ideas? Problems?
-------------------------
Sendme an email!  beangoben@gmail.com


>>>>>>> 1d7631b5f421dcbb813e9a1e9447b2542ff3125e
