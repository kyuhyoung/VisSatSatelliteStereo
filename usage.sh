cd ./ColmapForVisSat && bash ./ubuntu_scripts/ubuntu1804_install_colmap.sh && cd -
python3 stereo_pipeline.py --config_file aoi_config/MVS3DM_Explorer.json
#colmap feature_extractor --database_path /data/south-building/database_kevin.db --image_path /data/south-building/images --SiftExtraction.use_gpu=0 --SiftExtraction.num_threads=1
