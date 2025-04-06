---
layout: papers
title: "Split to Fit: Cross-Accelerator Hybrid Quantization for Efficient Video Understanding on Edge Systems."
date: 2024-9-10
image: /images/SplitVLM.PNG
authors: "<strong>Yilong Li</strong>, Jingyu Liu, Shuai Zhang, Suman Banerjee"
desp: >
   We present a system for efficient vision-language model (VLM) inference on mobile SoCs with unified memory, exemplified by deployment on RK3588. Our design decouples VLM execution across heterogeneous accelerators: an 8-bit vision encoder runs on the NPU, while a 4-bit language model runs on the GPU. These modules communicate via shared DRAM buffers, avoiding PCIe overhead.To reduce token and compute load, we introduce two lightweight modules: Spatial Embedding Reduction, which compresses ViT outputs without modifying the encoder, and Temporal Attention Pooling, which fuses multi-frame embeddings to preserve temporal information at reduced frame rates. Together, these enable high-throughput inference from 60fps input to 15ps language output under tight memory and power constraints. Our implementation on RK3588 achieves efficient, real-time VLM inference within sub-1GB memory, offering a practical solution for deploying multimodal intelligence at the edge.
---
