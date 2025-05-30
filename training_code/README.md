# Mitigating Spurious Correlations in Fake Image Detectors


This is the official training code of the ICLR 2025 paper [Aligned Datasets Improve Detection of Latent Diffusion-Generated Images ](https://arxiv.org/abs/2410.11835) and the follow up work [Stay-Positive: A Case for Ignoring Real Image Features in Fake Image Detection](https://arxiv.org/abs/2502.07778) (ICML 2025). Most of the code is borrowed from [On the detection of synthetic images generated by diffusion models](https://github.com/grip-unina/DMimageDetection/tree/main).

## Training-set

#### 1) Real Images
Our real images come from MS-COCO and LSUN. The dataset can be downloaded by following the instructions provided in the [DMimageDetection](https://github.com/grip-unina/DMimageDetection/tree/main) repository. We use their train-validation split as well. Throughout our experiments we keep the validation data consistent.

#### 2) Latent Reconstructions
Our training fake images are obtained by using the Latent Diffusion VAE, for validation, we use the same images used by [DMimageDetection](https://github.com/grip-unina/DMimageDetection/tree/main) to maintain experiment consistency. The scripts to reconstruct the dataset can be found in the **recon** folder. It is important to save the reconstructions using the same name as the corresponding real image as we pair them based on their names. The reconstructions can be computed as by running the script as follows,
```
cd recon
./run.sh
```

The dataset structure we use is the same as the DMimageDetection. 
```
Dataset directory
|--train
|   |--latent_diffusion_class2image
|   |   |--0_real
|   |   |--1_fake
|   |--latent_diffusion_noise2image_FFHQ
|   |   |--0_real
|   |   |--1_fake
|   .
|   .
|   .
|   |--latent_diffusion_text2img_train2
|       |--0_real
|       |--1_fake
|--val
    |--latent_diffusion_class2image
    |   |--0_real
    |   |--1_fake
    |--latent_diffusion_noise2image_FFHQ
    |   |--0_real
    |   |--1_fake
    .
    .
    .
    |--latent_diffusion_text2img_train2
        |--0_real
        |--1_fake
```
There should be two folders, one for training and one for validation. These folders should contain the subfolders present in the zip file. Each subfolders should have two subfolders each one with fake images (1_fake) and one with real images (0_real).
If the pytorch version used is >1.12.0 no folder should be left empty, otherwise the code would not run.

## Training
Using the below code, we can train fake image detectors using aligned data. The --use_inversions argument makes sure to link the real and fake images by name. The --batched_syncing argument makes sure to train on batches consisting of real images and reconstructions augmented in the same way.

```
CUDA_VISIBLE_DEVICES=2 python train.py --name=$LDM_DS_NAME --arch res50nodown --cropSize 96  --norm_type resnet --resize_size 256 --resize_ratio 0.75 --blur_sig 0.0,3.0 --cmp_method cv2,pil --cmp_qual 30,100 --resize_prob 0.2 --jitter_prob  0.8 --colordist_prob 0.2 --cutout_prob 0.2 --noise_prob 0.2 --blur_prob 0.5 --cmp_prob 0.5 --rot90_prob 1.0 --dataroot $DATASET --batch_size 32 --earlystop_epoch 10 --use_inversions --seed 17 --batched_syncing 

```

These details are provided in the bash script. 

```
./script_train.sh

```

By default the code creates a folder called checkpoints in the current directory. If you want to change where the checkpoints folder is saved please add the following argument:
```
--checkpoints_dir /path/to/weights/folder
```
## Shaders experiments
The shaders dataset and reconstructions that we train on can be found [here](https://drive.google.com/file/d/1C6hTqXpsLlZV8GCLVvZwJtqCvfn-BLS0/view?usp=sharing). We use the same validation set as used in the other expriments, we compute the evaluation threshold on a random subset of 5000 real and fake images taken from the validation data. 


## Citation
If you find this code useful in your research, consider citing our work:
```
@misc{rajan2025aligneddatasetsimprovedetection,
      title={Aligned Datasets Improve Detection of Latent Diffusion-Generated Images}, 
      author={Anirudh Sundara Rajan and Utkarsh Ojha and Jedidiah Schloesser and Yong Jae Lee},
      year={2025},
      eprint={2410.11835},
      archivePrefix={arXiv},
      primaryClass={cs.CV},
      url={https://arxiv.org/abs/2410.11835}, 
}
```
