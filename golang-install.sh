#!/bin/bash

sudo apt install -y golang
grep -q -F 'export GOPATH' ~/.bashrc || echo 'export GOPATH=/c/dev/go' >> ~/.bashrc
