# oneview-ansible-debian

Docker image for HPE oneview-ansible modules on Debian

## Versions

* Debian Stretch
* python 2.7.15
* ansible 2.5.5
* hpOneView 4.7.0
* oneview-ansible 5.1.1

## Usage

oneview-ansible-debian contains no playbooks or configuration. Everything must be passed in.

### Ansible inventory and playbooks

Set up a volume or use a bind mount containing the inventory and playbooks. This can be mounted into the container with `-v` or `--mount`

The modules will run on localhost and must use the python in `/usr/local/bin/python`. Add the following line to the inventory file:

```console
localhost ansible_python_interpreter=python2.7 ansible_connection=local
```

### Putting it all together

Assume a named volume `playbooks` with the Ansible inventory and a `site.yml` playbook. This can be run with the following command:

```console
docker run \
    -v playbooks:/playbooks \
    bobfraser1/oneview-ansible-debian \
    ansible-playbook -i /playbooks/hosts /playbooks/site.yml
```
