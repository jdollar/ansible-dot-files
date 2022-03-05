## Ansible Local Environment Setup

Ansible installation:

```shell
pip3 install ansible
```

To Run:

```shell
ansible-playbook mac-playbook.yml -i inventory.cfg --ask-become-pass
ansible-playbook linux-playbook.yml -i inventory.cfg --ask-become-pass
```
