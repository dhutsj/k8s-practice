#! /bin/bash

stress --vm 4 --vm-bytes 500M --vm-keep

stress --vm 4 --vm-bytes 1G --vm-keep

stress -c 4
