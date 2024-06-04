global
        log /dev/log    local0
        log /dev/log    local1 notice
        chroot /var/lib/haproxy
        stats socket /run/haproxy/admin.sock mode 660 level admin expose-fd listeners
        stats timeout 30s
        user haproxy
        group haproxy
        daemon
        maxconn 100

defaults
        log     global
        mode    tcp
        timeout connect 4s
        timeout client  30m
        timeout server  30m
        timeout check   5s

listen stats
    mode http
    bind *:7000
    stats enable
    stats uri /

listen consul
    mode tcp
    bind *:9500
    server consul_127.0.0.1_8500 127.0.0.1:8500 check port 8500

{{ $config := printf "infra/%s/pgcluster/members_ip" (env "CLUSTER") }}
listen postgres_write
    bind *:5432
    option httpchk
    http-check expect status 200
    default-server inter 3s fall 3 rise 2 on-marked-down shutdown-sessions
    {{ range ls $config }}server postgresql_{{.Value}}_5432 {{.Value}}:5432 maxconn 200 check port 8008
    {{ end }}

listen postgres_read
    bind *:5433
    mode tcp
    balance leastconn
    default-server inter 3s fall 3 rise 2 on-marked-down shutdown-sessions
    {{ range ls $config }}server postgresql_{{.Value}}_5432 {{.Value}}:5432 maxconn 200 check port 5432
    {{ end }}
