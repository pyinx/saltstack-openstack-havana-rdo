known_host:
  file.managed:
    - source: salt://openstack/files/known_hosts
    - name: /root/.ssh/known_hosts
    - template: jinja
    - require: 
      - cmd: /usr/bin/expect /tmp/auto_gen_key.exp

expect:
  pkg.installed

generate_key:
  file.managed:
    - source: salt://openstack/files/auto_gen_key.exp
    - name: /tmp/auto_gen_key.exp
  cmd.run:
    - name: /usr/bin/expect /tmp/auto_gen_key.exp
    - require:
      - file: /tmp/auto_gen_key.exp
      - pkg: expect

authorized_key:
  cmd.run:
    - name: cat /root/.ssh/id_rsa.pub  >> /root/.ssh/authorized_keys
    - require: 
      - cmd: /usr/bin/expect /tmp/auto_gen_key.exp
  file.managed:
    - name: /root/.ssh/authorized_keys
    - mode: 600
