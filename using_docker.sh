docker_name=u_22_colmap
dir_cur=/workspace/${PWD##*/}
dir_data=/mnt/hdd_16tb/dataset_stereo/MVS3DM/
#: << 'END'
##########################################################################################
#   docker build
cd docker_file/; docker buildx build --platform linux/amd64 --force-rm --shm-size=64g -t ${docker_name} -f Dockerfile_${docker_name} .; cd -
#END

#: << 'END'
#   docker info.
#docker run --rm -it -w $PWD -v $PWD:$PWD ${docker_name} bash docker_file/extract_docker_info.sh
docker run --platform linux/amd64 --rm -it -w $PWD -v $PWD:$PWD ${docker_name} sh -c ". ~/.bashrc && . ./extract_docker_info.sh"
#END

#   docker run
##	for SSH remote docker
#docker run --rm -it --shm-size=64g --gpus '"device=0"' -e QT_DEBUG_PLUGINS=1 --net=host -v $HOME/.Xauthority:/root/.Xauthority:rw -e DISPLAY=$DISPLAY -w ${dir_cur} -v ${dir_data}:/data -v $PWD:${dir_cur} -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro -v /etc/shadow:/etc/shadow:ro -v /etc/sudoers.d:/etc/sudoers.d:ro -v /tmp/.X11-unix:/tmp/.X11-unix:rw ${docker_name} /bin/bash
docker run --rm -it --shm-size=64g --gpus '"device=0"' -e QT_DEBUG_PLUGINS=1 --net=host -v $HOME/.Xauthority:/root/.Xauthority:rw -e DISPLAY=$DISPLAY -w ${dir_cur} -v ${dir_data}:/data -v $PWD:${dir_cur} -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro -v /etc/shadow:/etc/shadow:ro -v /etc/sudoers.d:/etc/sudoers.d:ro -v /tmp/.X11-unix:/tmp/.X11-unix:rw ${docker_name} fish
#docker run --rm -it --shm-size=64g --gpus '"device=0"' -e QT_DEBUG_PLUGINS=1 --net=host -v $HOME/.Xauthority:/root/.Xauthority:rw -e DISPLAY=$DISPLAY -w ${dir_cur} -v ${dir_data}:/data -v $PWD:${dir_cur} -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro -v /etc/shadow:/etc/shadow:ro -v /etc/sudoers.d:/etc/sudoers.d:ro -v /tmp/.X11-unix:/tmp/.X11-unix:rw ${docker_name} sh -c "bash usage.sh"
##	for local docker
# xhost +local:docker # in another terminal
#export DISPLAY=:0 && docker run --rm -it --shm-size=64g --gpus '"device=0"' -e QT_DEBUG_PLUGINS=1 -e DISPLAY=$DISPLAY -w ${dir_cur} -v ${dir_data}:/data -v $PWD:${dir_cur} -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro -v /etc/shadow:/etc/shadow:ro -v /etc/sudoers.d:/etc/sudoers.d:ro -v /tmp/.X11-unix:/tmp/.X11-unix ${docker_name} fish



#END