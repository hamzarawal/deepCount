# deepCount
## Deep Built-Structure Counting Using Attention Based Re-weighting

This repository contains code for FusionNet experiment of ['Deep Built-Structure Counting in Satellite Imagery Using Attention Based Re-weighting'](https://www.researchgate.net/publication/332139732_Deep_Built-Structure_Counting_in_Satellite_Imagery_Using_Attention_Based_Re-Weighting) published in ISPRS Journal 2019. Following are the main modules/files of the code:

Download Dataset from ['Counting Dataset']( https://drive.google.com/a/itu.edu.pk/file/d/1WRf8gYOpUVtkTmGFBw1aS1xDZ3jxsRsS/view?usp=drivesdk).
## Overview
### 1. DenseNet Features:
    We have used DenseNet as backbone of our counting pipeline.We First extract 'pool5' layer feature vector and 'Relu5_blk' layer features volume from DenseNet one by one.
      
### 2. SSNet:
    Satellite Segmentation Network is the model that predicts per pixel probability of built-up presence in an image. This model is used as attention map for DenseNet feature volumes.

      
### 3. Product Maps:
    
    To introduce attention in the feature maps, We  multiply the SSNet Probability Maps and DenseNet 'relu5_blk' maps.We calculate the feautes product "products maps" and Global weighted average pooled (GAP) and store in (.mat ) files. 
 
 ## Implementation 
 ### Requirements
     1. python 2.7
     2. tensorflow == 1.10.0
     3. numpy >== 1.15.2
     4. keras == 2.2.3
 ### Settings
     1. learning rate = 0.01
     2. Optimizer SGD 
 ### Procedure
     1. Download weights of base netwrok from "" and add to "Models" folder.
     2. Run "FusionNet.ipynb".
     3. Add root path , dataset path and feature path .
 ## Citation:
     @article{shakeel2019deep,
      title={Deep built-structure counting in satellite imagery using attention based re-weighting},
      author={Shakeel, Anza and Sultani, Waqas and Ali, Mohsen},
      journal={ISPRS Journal of Photogrammetry and Remote Sensing},
      volume={151},
      pages={313--321},
      year={2019},
      publisher={Elsevier}
      }
 
      
