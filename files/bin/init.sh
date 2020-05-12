#!/bin/bash

inaccel install -m others https://store.inaccel.com/artifactory/bitstreams/xilinx/u250/xdma_201830.2/com/inaccel/ml/LogisticRegression/1.0/4Gradients 2>1
inaccel install -m others https://store.inaccel.com/artifactory/bitstreams/xilinx/u280/xdma_201920.3/com/inaccel/ml/NaiveBayes/1.0/4Classifier 2>1

jupyterhub
