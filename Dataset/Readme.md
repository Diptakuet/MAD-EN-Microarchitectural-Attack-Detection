## Data Collection
### Prerequisite
* `phoronix-test-suite`
* `pycharm`
* `visual studio code`
* `zoom`
* `libreoffice`

### Benign Application:
`cd ~`<br/>
`cd Dataset/Benign_Application/`<br/>

`phoronix-test-suite` incorporates different types of tests, such as Processor, Disk, and System-based tests. We have included various tests from each of these categories to diverse the dataset. Within the Processor directory, the processor-based tests can be found that were picked for this experiment. The same goes for Disk and System as well. The folder named 'RealWorld' and 'Video' are not tests from phoronix-test-suite. Instead we have chosen some real life benign applications that are used by many people and collected the energy trace consumption for them. To record the energy trace data for any of the tests follow the listed commands.

`cd <Type of Benign Application>`, e.g., `cd Processor/`<br/>
`cd <Test name>, e.g., cd aobench/`<br/>
`cd Script/`<br/>
`./benign_app.sh`<br/>


Within the 'Script\' directory there are three bash script files:
* `data.sh`: Record the energy consumption traces and save it to a csv file.
*  `run_benign.sh`: Run the benign apps consecutively for a desired time.
*  `benign_app.sh`: Execute the `data.sh` and `run_benign.sh` in parallel.

### Attack Execution:
The energy consumption traces are recorded while individual attacks are being executed in our target system. 15 categories including the variants of 10 micro-architectural attacks are considered. All of these individual attacks are reproduced from the following repositories:
* [Flush+Flush, Flush+Reload, Prime+Probe](https://github.com/IAIK/flush_flush)
* [PortSmash](https://github.com/bbbrumley/portsmash)
* [TLBleed](https://github.com/vusec/tlbkit)
* [Spectre](https://github.com/google/safeside/tree/main/demos)
* [Medusa](https://github.com/vernamlab/medusa)
* [ZombieLoad](https://github.com/IAIK/ZombieLoad)
* [Fallout](https://github.com/tristan-hornetz/fallout)
* [Branch History Injection](https://github.com/vusec/bhi-spectre-bhb)

While individual attack is being executed, the `data.sh` script is run in parallel to record the energy consumtion traces.


After collecting the raw data, the data is being processed in MATLAB (Codes are available in [Data_Processing](https://github.com/Diptakuet/MAD-EN-Microarchitectural-Attack-Detection/tree/main/Dataset/Data_Processing) folder), and processed data can be found in the [FinalData](https://github.com/Diptakuet/MAD-EN-Microarchitectural-Attack-Detection/tree/main/Dataset/FinalData) folder.
