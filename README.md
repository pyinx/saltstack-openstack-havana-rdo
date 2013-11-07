saltstack-openstack-havana-rdo
==============================

use saltstack to install openstack-havana all-in-one
##使用saltstack部署openstack-havana all-in-one

**1.Openstack架构**
all-in-one,参考:http://www.chenshake.com/centos6-4-single-card-all-in-one-install-havana/

**2.目录结构**
```python
saltstack-openstack-havana-rdo
├── README.md
└── salt
    ├── openstack
    │   ├── all-in-one
    │   │   ├── init.sls
    │   │   ├── install.sls
    │   │   └── ssh_key.sls
    │   └── files
    │       ├── auto_gen_key.exp
    │       ├── epel-163.repo
    │       └── known_hosts
    └── top.sls
```

**3.依赖**
1. RHEL/Centos 6.4
2. 可以访问公网，解析域名

**4.安装**
salt 'openstack-test' state.show_sls openstack.all-in-one.init
salt 'openstack-test' state.show_sls openstack.all-in-one.ssh_key
salt 'openstack-test' state.show_sls openstack.all-in-one.install

