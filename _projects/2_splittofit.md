---
layout: page
title: Split to Fit
description: Cross-Accelerator Hybrid Quantization for Efficient Video Understanding on Edge Systems
img: assets/img/SplitVLM.PNG
importance: 2
category: work
---

A system for efficient vision-language model (VLM) inference on mobile SoCs with unified memory, exemplified by deployment on RK3588.

## Overview

Our design decouples VLM execution across heterogeneous accelerators:
- **8-bit vision encoder** runs on the NPU
- **4-bit language model** runs on the GPU

These modules communicate via shared DRAM buffers, avoiding PCIe overhead.

## Key Innovations

### Spatial Embedding Reduction
Compresses ViT outputs without modifying the encoder architecture.

### Temporal Attention Pooling
Fuses multi-frame embeddings to preserve temporal information at reduced frame rates.

## Performance

Together, these techniques enable:
- High-throughput inference from 60fps input to 15ps language output
- Operation under tight memory and power constraints
- Efficient, real-time VLM inference within sub-1GB memory

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/SplitVLM.PNG" title="Split to Fit Architecture" class="img-fluid rounded z-depth-1" %}
    </div>
</div>

## Hardware Platform

Our implementation on RK3588 offers a practical solution for deploying multimodal intelligence at the edge.
