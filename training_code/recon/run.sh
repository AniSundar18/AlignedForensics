#IMAGES_PATH= "ENTER PATH WHERE REAL IMAGES ARE STORED"

#CODE TO CREATE THE DATASET
CUDA_VISIBLE_DEVICES=0 python execute.py --input_folder=$IMAGES_PATH --batch_size 64 --repo_id 'CompVis/ldm-text2im-large-256' 


