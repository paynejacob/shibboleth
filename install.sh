#!/usr/bin/env bash

ansible-playbook playbooks/setup.yaml

pushd /tmp/shibboleth-identity-provider-4.0.1 || exit
  bin/install.sh
popd || exit

ansible-playbook playbooks/tomcat.yaml
ansible-playbook playbooks/apache.yaml
ansible-playbook playbooks/mysql.yaml
ansible-playbook playbooks/shibboleth.yaml