scope: postgres
namespace: /db/CLUSTER
name: HOSTNAME

restapi:
    listen: HOST_IP:8008
    connect_address: HOST_IP:8008

consul:
    host: 127.0.0.1:8500

bootstrap:
    dcs:
        ttl: 30
        loop_wait: 10
        retry_timeout: 10
        maximum_lag_on_failover: 1048576
        postgresql:
            use_pg_rewind: true

    initdb:
    - encoding: UTF8
    - data-checksums

    pg_hba:
    - host replication replicator 127.0.0.1/32 md5
    - host replication replicator 10.0.0.0/16 md5
    - host all all 0.0.0.0/0 md5

    users:
        admin:
            password: admin
            options:
                - createrole
                - createdb

postgresql:
    listen: HOST_IP:5432
    connect_address: HOST_IP:5432
    data_dir: /data/patroni
    pgpass: /tmp/pgpass
    authentication:
        replication:
            username: replicator
            password: rep-pass
        superuser:
            username: postgres
            password: secretpassword
    parameters:
        unix_socket_directories: '.'

tags:
    nofailover: false
    noloadbalance: false
    clonefrom: false
    nosync: false