# AMS IZZIV - final report
Gal Kumperščak

Inverse Consistency by Constructionfor Multistep Deep Registration

Ta github repozitorij je nastal na podlagi: 
- članka: https://link.springer.com/chapter/10.1007/978-3-031-43999-5_65
- github repozitorija: https://github.com/uncbiag/ByConstructionICON

NOTE: this repository has multiple branches for training and testing code go to branch **testiranje**.


## Article topic 
Inverse consistency is a key feature in image registration, as it ensures that transformations between images remain consistent even when used in reverse. The proposed technique achieves inverse consistency in neural registration networks by structuring the network to parameterize the output transformations using a Lie group. This allows a multi-stage approach where networks are constructed to maintain this consistency in registration tasks from coarse to fine. Evaluation of this method on synthetic 2D data and real 3D medical image registration tasks showed high registration accuracy, while maintaining inverse consistency throughout the process. 




## Rezultati
Zaenkrat še zmeraj poganjam...

## Docker Information
Download the ThoraxCBCT dataset including training and validation data, keypoints, masks and the ThoraxCBCT_dataset.json:
https://cloud.imi.uni-luebeck.de/s/xQPEy4sDDnHsmNg
(or use your own data)

Build the docker:

***NOTE***: path to data and save_direcory must be edited in files train_constricon_supervised.py and inference_constricon.py

docker build -t constricon Dockerfile .


docker run -i -t --runtime=nvidia -v /path/to/local/directory:/path/in/container constricon python train_constricon_supervised.py ThoraxCBCT (this command runs the training file)


docker run -i -t --runtime=nvidia -v /path/to/local/directory:/path/in/container constricon python inference_constricon.py ThoraxCBCT Ts (this command runs the testing file)


### Usage without Docker
If you want to use this repository without docker containerisation you can do so by creating an environment directly via the requirements.txt and then run the training and inference scripts after adjusting the paths at the beginning of the scripts:

python train_constricon_supervised.py <task: Oncoreg or ThoraxCBCT>
python inference_constricon.py <task> <Val/Ts>

## Dataset preparation:

The data is expected in a directory (data_dir) with task-specific subdirectories and JSON files containing dataset metadata (e.g., ThoraxCBCT_dataset.json).

Data Loading:
The get_files function reads and parses the dataset. This includes fixed and moving images, keypoints, original shapes, and optional MIND descriptors.

Normalization and Preprocessing:
Images are normalized by subtracting the minimum and dividing by the maximum pixel intensity.
Optional data augmentation is applied during training via the augment function.

Splitting:
The code implicitly handles batch creation by sampling data points randomly during training, ensuring a variety of cases are used in each iteration.

## Train Commands
```bash
bash train.sh
```

Alternatively, if you have execute permissions, you can directly run it:

```bash
./train.sh
```
***NOTE***: path to data and save_direcory must be edited in files train_constricon_supervised.py and inference_constricon.py

## Test Commands
List the commands needed to test your model. Provide any necessary explanations or parameters.
For test.py script, you should use a parser to set all input parameters. Below is the example, how to run `test.py`:

```bash
python test.py --i /path/to/test/data --o /path/to/output -other /other/parameters....
```

Make sure to include `path to test data`, `path where to save output` and all user related parameters in parser.


