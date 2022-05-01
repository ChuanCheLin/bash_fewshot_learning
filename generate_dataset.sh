#!/bin/bash
# base does not need SHOT => assign an arbitrary str
SET="1"
SPLIT="1"
TYPE="balanced"
SHOT="1"

cd ..
cd eric_tools
cd voc_labeloperator
python3 label_operator.py \
--set $SET \
--split $SPLIT \
--shot $SHOT \
--type $TYPE


cd ..
cd coco_dataset_generator
if [ $TYPE = "base" ]
then
    python3 voc2coco.py \
    --voc-root "/home/eric/mmdetection/data/VOCdevkit/datasets/VOC2007/" \
    --img_dir "/home/eric/mmdetection/data/VOCdevkit/datasets/VOC2007/JPEGImages_temp/" \
    --anno_dir "/home/eric/mmdetection/data/VOCdevkit/datasets/VOC2007/set$SET/split$SPLIT/Annotations_$TYPE/" \
    --coco-dir "/home/eric/mmdetection/data/VOCdevkit/datasets/set$SET/split$SPLIT/$TYPE/" \
    --label-file "/home/eric/mmdetection/data/VOCdevkit/datasets/VOC2007/labels16.txt" \
    --dataset_type "$TYPE"

elif [ $TYPE = "few" ]
then
    python3 voc2coco.py \
    --voc-root "/home/eric/mmdetection/data/VOCdevkit/datasets/VOC2007/" \
    --img_dir "/home/eric/mmdetection/data/VOCdevkit/datasets/VOC2007/JPEGImages_temp/" \
    --anno_dir "/home/eric/mmdetection/data/VOCdevkit/datasets/VOC2007/set$SET/split$SPLIT/Annotations_$TYPE$SHOT/" \
    --coco-dir "/home/eric/mmdetection/data/VOCdevkit/datasets/set$SET/split$SPLIT/$TYPE$SHOT/" \
    --label-file "/home/eric/mmdetection/data/VOCdevkit/datasets/VOC2007/labels16.txt" \
    --dataset_type "$TYPE"

elif [ $TYPE = "balanced" ]
then
    python3 voc2coco.py \
    --voc-root "/home/eric/mmdetection/data/VOCdevkit/datasets/VOC2007/" \
    --img_dir "/home/eric/mmdetection/data/VOCdevkit/datasets/VOC2007/JPEGImages_temp/" \
    --anno_dir "/home/eric/mmdetection/data/VOCdevkit/datasets/VOC2007/set$SET/Annotations_$TYPE$SHOT/" \
    --coco-dir "/home/eric/mmdetection/data/VOCdevkit/datasets/set$SET/$TYPE$SHOT/" \
    --label-file "/home/eric/mmdetection/data/VOCdevkit/datasets/VOC2007/labels16.txt" \
    --dataset_type "$TYPE"
fi