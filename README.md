## Ansible Local Environment Setup

Ansible installation:

```shell
pip3 install ansible
```

Create a file called `password-file` at the root of this repository.
Inside the file include the vault password used to decrypt the secrets.

To Run:

```shell
ansible-playbook mac-playbook.yml -i inventory.cfg
ansible-playbook linux-playbook.yml -i inventory.cfg
```
