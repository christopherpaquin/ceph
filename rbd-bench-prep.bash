#!/bin/bash
 
#Create Pool
ceph osd pool create test-pool $1
 
 
 
#Create Image
rbd create image01 --size 4096  --pool test-pool
rbd map image01 --pool test-pool --name client.admin
 
#Create Filesystem
mkfs.ext4 -m0 /dev/rbd0
 
#Mount Filesystem
mount /dev/rbd0 /ceph-block-test/rbd0
 
#Run Test
rbd bench-write image01 --pool=test-pool
