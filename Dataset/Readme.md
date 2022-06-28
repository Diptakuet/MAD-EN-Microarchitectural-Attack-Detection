## Data Collection
### Prerequisite
* install `phoronix-test-suite`
### Benign Application:
`cd ~`<br/>
`cd Dataset/Benign_Application/`<br/>

`phoronix-test-suite` incorporates different types of tests, such as Processor, Disk, and System-based tests. We have included various tests from each of these categories to diverse the dataset. Within the Processor directory, the processor-based tests can be found that were picked for this experiment. The same goes for Disk and System as well. The folder named 'RealWorld' and 'Video' are not tests from phoronix-test-suite. Instead we have chosen some real life benign applications that are used by many people and collected the energy trace consumption for them. To record the energy trace data for any of the tests follow the listed commands.

`cd <Type of Benign Application>`, e.g., `cd Processor/`<br/>
`cd <Test name>, e.g., cd aobench/`<br/>
`cd Script/`<br/>
`./benign_app.sh`<br/>
