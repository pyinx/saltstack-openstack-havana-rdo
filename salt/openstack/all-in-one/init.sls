{% if grains['os_family'] == 'RedHat' and grains['osrelease'] == '6.4' %}

epel:
  file.managed:
    - name: /etc/yum.repos.d/epel-163.repo
    - source: salt://openstack/files/epel-163.repo
    - force: True
  cmd.run:
    - name: yum list
    - require:
      - file: /etc/yum.repos.d/epel-163.repo

redhat-rdo:
  cmd.run:
    - name: yum install -y http://rdo.fedorapeople.org/openstack/openstack-havana/rdo-release-havana.rpm

packstack:
  pkg.installed:
    - name: openstack-packstack
    - require:
      - cmd: redhat-rdo
  cmd.run:
    - name: yum -y update
  
reboot:
  cmd.wait:
    - name: reboot
    - watch:
      - pkg: packstack

{% endif %}
