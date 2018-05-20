#!/bin/bash

p="ansible"
rpm -q ${p} &>/dev/null || {
  yum install -y ${p}
}
