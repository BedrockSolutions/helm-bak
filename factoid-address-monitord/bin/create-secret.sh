#!/usr/bin/env bash

set -xe

while [[ "$#" > 0 ]]; do case $1 in
  --key) key="${2}"; shift;;
  --secret) secret="${2}"; shift;;
  -h|--help) echo "${0} --key <key> --secret <secret>"; exit 0;;
  *) echo "Unknown parameter passed: $1"; exit 1;;
esac; shift; done

if [ -z "key" ]; then echo "--key is required" && exit 1; fi
if [ -z "secret" ]; then echo "--secret is required" && exit 1; fi

kubectl create secret generic \
  factoid-address-monitord-secret \
  --from-literal="bitcoinTaxKey=${key}" \
  --from-literal="bitcoinTaxSecret=${secret}"
