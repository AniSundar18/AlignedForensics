# On the Effectiveness of Dataset Alignment for Fake Image Detection

Official repository of [On the Effectiveness of Dataset Alignment for Fake Image Detection](https://arxiv.org/abs/2410.11835). The specific instructions for training the models and reproducing the plots can be found in the **training_code** and **testing_code** directories.

## Pretrained Models

Our pre-trained fake image detectors can be found below,
- [Ours](https://drive.google.com/file/d/1ACoiwC8BM0NpyhAwbKsyAk1Da-TAoRRy/view?usp=sharing) (ResNet-50 trained without sync'd batches)
- [Ours-Sync](https://drive.google.com/file/d/1rn0hgAjTXeY7QTpCnx9lMGNPfrwvO1lO/view?usp=sharing) (ResNet-50 trained with sync'd batches)
- [Ours (shaders)](https://drive.google.com/file/d/1pqM8z10--509vS98yNTebI8OzvDqLPgI/view?usp=sharing) (ResNet-50 trained on shaders)
- [Ours-Sync (shaders)](https://drive.google.com/file/d/1wDZe_P5xiAbELZLV-PmYK5Hkh_BG6Eah/view?usp=sharing) (ResNet-50 trained on shaders, with sync'd batches)

## Citation
If you find this code useful in your research, consider citing our work:
```
@misc{rajan2024effectivenessdatasetalignmentfake,
      title={On the Effectiveness of Dataset Alignment for Fake Image Detection}, 
      author={Anirudh Sundara Rajan and Utkarsh Ojha and Jedidiah Schloesser and Yong Jae Lee},
      year={2024},
      eprint={2410.11835},
      archivePrefix={arXiv},
      primaryClass={cs.CV},
      url={https://arxiv.org/abs/2410.11835}, 
}
```
