andrewrothstein.concourse
=========
![Build Status](https://github.com/andrewrothstein/ansible-concourse/actions/workflows/build.yml/badge.svg)

Installs [concourse](https://concourse-ci.org/).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - role: andrewrothstein.concourse
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
