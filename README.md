Wyoming Whisper with gpu

```
whisper:
  container_name: whisper
  image: whisper-gpu
  build: .
  ports:
  - "10300:10300"
  volumes:
  - ./data:/data
  restart: always
  command: --model medium-int8 --language en --device cuda
  deploy:
    resources:
      reservations:
        devices:
          - driver: nvidia
            count: 1
            capabilities: [gpu]
```
