# Thornley-Edinburgh-Forest-Model
Contains files to run the Edinburgh Forest Model by John Thornley
[![DOI](https://zenodo.org/badge/452433269.svg)](https://zenodo.org/badge/latestdoi/452433269)

Edinburgh Forestry Model
About the EFM
The Edinburgh Forest Model is a dynamic, process-based model of carbon (C),
nitrogen (N) and water in cool temperate forests. It simulates tree growth (evergreen
or deciduous) with growth responses to the environment (e.g. light, temperature, day
length, rainfall, humidity, wind, atmospheric N deposition, CO2) and also to
management (e.g. fertilizer input, plantations or "natural forests" with possible self
thinning and regeneration). It incorporates a soil submodel with mineral and organic
matter pools, and also a plant/soil water submodel of the physics and biology of water
movement. A list of the possibilities and processes covered by EFM is included at the
start of the "source program/text efm.csl"; this is highly annotated and hopefully
adequately explanatory. Although there is as yet no complete description of the EFM,
much of it is based on an earlier developed pasture model (Thornley, 1998. Grassland
Dynamics: an ecosystem simulation model, CAB International). More recent
developments are described in various papers. (Thornley JHM, Cannell MGR. 2004.
Long-term effects of fire frequency on carbon storage and productivity of boreal
forests: a modeling study. Tree Physiology 24: 765-773. Cannell MGR, Thornley
JHM. 2003. Ecosystem productivity is independent of some soil properties at
equilibrium. Plant and Soil 257: 193-204. Thornley JHM, Cannell MGR. 2000.
Managing forests for wood yield and carbon storage: a theoretical study. Tree
Physiology 20: 477-485. Thornley JHM. 1999. Modelling stem height and diameter
growth in plants. Annals of Botany 84: 195-205. Thornley JHM, Cannell MGR. 2000.
Modeling the components of plant respiration: representation and realism. Annals of
Botany 85: 55-67.) A recent and ongoing development is the addition of an aphid
submodel (the green spruce aphid).
The model tracks the rates of inputs and outputs of both the C, N and water, and their
effects on the state variables (e.g. C, N and water pools in the trees and soil) on a time
scale from diurnal, to centuries. Responses to changes in environment or
management can be studied in the short-term, when the responses are transient, or
longer term, as the responses move toward sustainable, dynamic steady states.
Access to the EFM program /code

The source code for the Edinburgh Forestry Model is available for educational and
research purposes. Please see Technical details, before downloading.

Technical details

Programming language

The Hurley Pasture Model is written in Advanced Continuous Simulation
Language (ACSL, pronounced "axle"). This is a high level language created in the
1970s for applications ranging across pharmaceutical, engineering, and aerospace. It
was developed substantially by Mitchell and Gauthier Associates (USA) and remains
very advanced and capable despite its age. We use the latest stable version ACSL
11.8.4.

Statements are written in the form of largely differential equations, in a very intuitive
style and can be written in almost any sequence. The main programme (*.csl) is
written in the 'system level' language of ACSL. When prompted, the ACSL software
translates the ACSL system statements, re-writing them into a recognised
programming language (eg Fortran or C), which is then compiled. The compiler is
installed along with ACSL. We use Compaq Visual Fortran 6.6 that was originally
packaged with ACSL 11.8.4. ASL then begins a 'real time' simulation which is 'run'
and controlled using ACSL 'runtime' language and commands input from the
keyboard, or more conveniently, input from pre-determined batch' files of commands
(such as the examples in the 'HPM.cmd' file). By collating any number of levels of
ACSL runtime command batch files, the user can assemble their own
library/catalogues of ever higher level commands (eg devising ones called 'do climate
change', or 'rerun paper 2012'). So, at any time, after say altering one aspect of the
model, a whole re-analyses of historic predictions, can be re-produced, and re
analysed confidently.

The entire state of the model can be saved to a file (extension .SAV) and archived,
which allows the researcher to return to an exact state at any time in the future and re
run from there.

Reference Manuals for ACSL, essential for any further development using the ACSL
language, were produced by Mitchell and Gauthier. Some remain available from
Amazon, or Google/books, and may be available from libraries. The ISBN number for
reference manual for ACSL 10.1 is 0-925649-04-X

Running the model

Unfortunately the commercial software ACSL is no longer supported by the most
recent vendor (Aegis Technologies, USA). To compile and run the model requires a
specific operating system (Microsoft Windows XP Professional, 32bit) which is no
longer supported by Microsoft, and various software packages (eg Compaq Visual
Fortran 6.6) which is also no longer supported by Microsoft/Compaq. Obtaining
licenced copies of these comes down to approaching those suppliers.
However, if the software can be obtained, the models can be run highly effectively, and
securely, on a modern computer by using a Mac (iMac or MacBook) running any
recent Mac OS (eg Yosemite or Sierra), as the host operating system, and while
running a Windows Professional 32 bit operating system as a 'virtual PC' contained
within eg VMWare Fusion (for Sierra this is Fusion 8). Any legitimate 'real' and
licenced XP PC can be 'migrated' onto a Mac, and into VMWare Fusion, to create a
'virtual' PC, so allowing it to run on a computer that remains by all measures, state of
the art. Files can be moved seamlessly between the two operating systems (by swiping
with the mouse).

We had some limited success in running the models in early versions of Windows 7,
but these appear to use an emulator for XP, and run very slowly.
While the use of a Mac sustains complete functionality for the model, it is unknown to
what extent the original software vendors will continue to distribute licences for ACSL,
Visual Fortran, or XP. Recent postings on the Aegis Technologies website state:
"Please contact Jtuck@aegistg.com in regards to any of these matters"
A full set of manuals and all required software will be assembled here, if agreement
can be gained from the vendors to allow us to sustain the legacy of our more than 25
years commitment to this programming language.

On Insight and Validation

The model is conceived, and parameterised at the level of fundamental processes,
wherever possible, and so is 'validated' scientifically at that level, which is at least one,
preferably two, levels below the level and scale at which predictions are being made.
This allows the model predictions to be independent of, and so can be assessed
independently from, any available field scale measurements. This also allows the
model to be used to explore combinations of circumstances that have as yet not arisen,
and so no field data exists! This is distinctly different from where, in many 'system'
models, notably in pastoral/practical agriculture, components of models would have
been parameterised backwards' from field scale empirical data. Independence from
already observed field scale information has given rise to many counter-intuitive
predictions, which when subsequently tested were found to be valid, and so has
progressed our understanding. Despite this distinction, the HPM currently produces
predictions of numerous components of the whole grassland ecosystem, that are in a
very realistic ballpark to what later searches have found had been measured.
Differences in how models are conceived and used, and the relevance of this, many
find challenging. The topic needs careful consideration, before assuming what kind of
model suits the purpose in hand.
