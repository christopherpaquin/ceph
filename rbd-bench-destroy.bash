#!/bin/bash
 
umount /ceph-block-test/rbd0
ceph osd pool delete test-pool test-pool --yes-i-really-really-mean-it

