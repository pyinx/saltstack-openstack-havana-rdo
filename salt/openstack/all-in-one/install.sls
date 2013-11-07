packstack:
  cmd.run:
    - name: packstack  --allinone --provision-demo=n 
    - env:
      - HOME: /root
  require:
    - pkg: openstack-packstack

reboot:
  cmd.wait:
    - name: reboot
    - watch:
      - cmd: packstack
