---
layout: post
title: CRANE was open-sourced for direct Apple Neural Engine inference
date: 2026-03-31
---

CRANE, our compiled runtime for the Apple Neural Engine, is now open-sourced. Built on reverse-engineered private APIs, it provides direct Python control of ANE, compiles MIL programs with baked weights, executes fused transformer blocks on ANE hardware, and caches kernels for repeated inference without requiring Core ML.
