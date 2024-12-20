# AMS IZZIV - final report
Gal Kumperščak

Inverse Consistency by Constructionfor Multistep Deep Registration

Ta github repozitorij je nastal na podlagi: 
- članka: https://link.springer.com/chapter/10.1007/978-3-031-43999-5_65
- github repozitorija: https://github.com/uncbiag/ByConstructionICON

## Article topic 
Inverse consistency is a key feature in image registration, as it ensures that transformations between images remain consistent even when used in reverse. The proposed technique achieves inverse consistency in neural registration networks by structuring the network to parameterize the output transformations using a Lie group. This allows a multi-stage approach where networks are constructed to maintain this consistency in registration tasks from coarse to fine. Evaluation of this method on synthetic 2D data and real 3D medical image registration tasks showed high registration accuracy, while maintaining inverse consistency throughout the process. 




## Rezultati
Zaenkrat še zmeraj poganjam...

## Docker Information
Download the ThoraxCBCT dataset including training and validation data, keypoints, masks and the ThoraxCBCT_dataset.json:
https://cloud.imi.uni-luebeck.de/s/xQPEy4sDDnHsmNg
(or use your own data)

Build the docker:

docker build -t constricon Dockerfile .
run docker and start training (insert path to ThoraxCBCT data):

sudo docker run --gpus all --entrypoint ./train.sh \
-v /playpen/tgreer/docker/Release_06_12_23/:/oncoreg/data \
-v ./model/:/oncoreg/model/ \
constricon ThoraxCBCT 
Run inference (insert path to ThoraxCBCT data):

sudo docker run --gpus all --entrypoint ./test.sh \
-v /playpen/tgreer/docker/Release_06_12_23/:/oncoreg/data \
-v ./model/:/oncoreg/model/ \
-v ./results/:/oncoreg/results/ \
constricon ThoraxCBCT Val


### Usage without Docker
If you want to use this repository without docker containerisation you can do so by creating an environment directly via the requirements.txt and then run the training and inference scripts after adjusting the paths at the beginning of the scripts:

python train_constricon_supervised.py <task: Oncoreg or ThoraxCBCT>
python inference_constricon.py <task> <Val/Ts>

## Data Preparation
Explain the steps required to prepare the data for training. Include any preprocessing steps and data splitting.

## Train Commands
If applicable, list the commands needed to train your model. Provide any necessary explanations or parameters. 
For train.py script, you should use a parser to set all input parameters. Below is the example, how to run `train.py`:

```bash
python train.py --i /path/to/data --o /path/to/models -other /other/parameters....
```

Make sure to include ` path to data`, `path where to save models` and all user related parameters in parser.

## Test Commands
List the commands needed to test your model. Provide any necessary explanations or parameters.
For test.py script, you should use a parser to set all input parameters. Below is the example, how to run `test.py`:

```bash
python test.py --i /path/to/test/data --o /path/to/output -other /other/parameters....
```

Make sure to include `path to test data`, `path where to save output` and all user related parameters in parser.

# AMS IZZIV - final report
YOUR NAME

YOUR PROJECT

LINK TO YOUR PROJECT

## Method Explanation
Describe the method used in your project in your own words. Explain the key concepts and steps involved. If applicable, include figures. 

## Results
Include some of *your* results here. Make sure to include aggregated results and any relevant images.

```bash
 aggregated results:
	LogJacDetStd        : 0.10320 +- 0.00834 | 30%: 0.10965
	TRE_kp              : 7.69219 +- 2.03832 | 30%: 7.36717
	TRE_lm              : 8.51688 +- 3.86951 | 30%: 8.24852
	DSC                 : 0.55044 +- 0.13053 | 30%: 0.49095
	HD95                : 33.87484 +- 10.90554 | 30%: 23.67392
```


## Docker Information
Provide information on how to set up and use Docker for this project. Be very specific when writing about Docker installation. Include step-by-step instructions, commands, and any necessary configurations. 

## Data Preparation
Explain the steps required to prepare the data for training. Include any preprocessing steps and data splitting.

## Train Commands
If applicable, list the commands needed to train your model. Provide any necessary explanations or parameters. 
For train.py script, you should use a parser to set all input parameters. Below is the example, how to run `train.py`:

```bash
python train.py --i /path/to/data --o /path/to/models -other /other/parameters....
```

Make sure to include ` path to data`, `path where to save models` and all user related parameters in parser.

## Test Commands
List the commands needed to test your model. Provide any necessary explanations or parameters.
For test.py script, you should use a parser to set all input parameters. Below is the example, how to run `test.py`:

```bash
python test.py --i /path/to/test/data --o /path/to/output -other /other/parameters....
```

Make sure to include `path to test data`, `path where to save output` and all user related parameters in parser.
