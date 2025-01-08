#!/usr/bin/env bash
python3 -m wyoming_faster_whisper \
    --uri 'tcp://0.0.0.0:10300' \
    --data-dir /data \
    --download-dir /data "$@" \
    # --device cuda

# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/python3.10/dist-packages/nvidia/cudnn/lib/
# python3 -m wyoming_faster_whisper \
#     --uri 'tcp://0.0.0.0:10300' \
#     --data-dir /data \
#     --download-dir /data "$@" \