#!/usr/bin/env bash

set -e

while [[ "$#" > 0 ]]; do case $1 in
  --secret) secret="${2}"; shift;;
  -h|--help) echo "${0} --secret <secret>"; exit 0;;
  *) echo "Unknown parameter passed: $1"; exit 1;;
esac; shift; done

if [ -z "secret" ]; then echo "--secret is required" && exit 1; fi

kubectl create secret generic \
  factoid-address-monitord-secret \
  --from-literal="bitcoinTaxSecret=${secret}"
