# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# Could not resolve unknown_registry node VAEDecode - no aux_id provided, skipped
# Could not resolve unknown_registry node SaveImage - no aux_id provided, skipped
# Could not resolve unknown_registry node ImageUpscaleWithModel - no aux_id provided, skipped
# Could not resolve unknown_registry node CLIPTextEncode - no aux_id provided, skipped
# Could not resolve unknown_registry node CLIPTextEncode - no aux_id provided, skipped
# Could not resolve unknown_registry node KSampler - no aux_id provided, skipped
# Could not resolve unknown_registry node KSampler - no aux_id provided, skipped
# Could not resolve unknown_registry node EmptyLatentImage - no aux_id provided, skipped
# Could not resolve unknown_registry node VAEEncodeTiled - no aux_id provided, skipped
# Could not resolve unknown_registry node ImageScale - no aux_id provided, skipped
# Could not resolve unknown_registry node VAEDecodeTiled - no aux_id provided, skipped
# Could not resolve unknown_registry node PreviewImage - no aux_id provided, skipped
# Could not resolve unknown_registry node CLIPSetLastLayer - no aux_id provided, skipped
# Could not resolve unknown_registry node UpscaleModelLoader - no aux_id provided, skipped

# download models into comfyui
RUN comfy model download --url https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.2.4/RealESRGAN_x4plus_anime_6B.pth --relative-path models/upscale_models --filename RealESRGAN_x4plus_anime_6B.pth
RUN comfy model download --url "https://civitai.com/api/download/models/2514310?type=Model&format=SafeTensor&size=pruned&fp=fp16" --relative-path models/checkpoints --filename waiIllustriousSDXL_v160.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
