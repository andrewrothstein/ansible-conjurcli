andrewrothstein.conjurcli
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-conjurcli.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-conjurcli)

Installs CyberArk's [conjur-cli](https://github.com/cyberark/conjur-cli)

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
    - andrewrothstein.conjurcli
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
