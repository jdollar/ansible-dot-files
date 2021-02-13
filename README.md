## Ansible Local Environment Setup

Ansible installation:

```shell
pip3 install ansible
```

To Run:

```shell
ansible-playbook playbook.yml -e "os=mac" -i inventory.cfg
```

Possible OS Values:
* mac
* linux
