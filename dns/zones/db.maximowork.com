$TTL    604800
@       IN      SOA     ocp-svc.maximowork.com. contact.maximowork.com (
                  1     ; Serial
             604800     ; Refresh
              86400     ; Retry
            2419200     ; Expire
             604800     ; Minimum
)
        IN      NS      ocp-svc

ocp-svc.maximowork.com.          IN      A       192.168.22.1
DESKTOP-BDF3JQF.maximowork.com.          IN      A       192.168.22.220

; Temp Bootstrap Node
ocp-bootstrap.lab.maximowork.com.        IN      A      192.168.22.200

; Control Plane Nodes
ocp-cp-1.lab.maximowork.com.         IN      A      192.168.22.201
ocp-cp-2.lab.maximowork.com.         IN      A      192.168.22.202
ocp-cp-3.lab.maximowork.com.         IN      A      192.168.22.203

; Worker Nodes
ocp-w-1.lab.maximowork.com.        IN      A      192.168.22.211
ocp-w-2.lab.maximowork.com.        IN      A      192.168.22.212
ocp-w-3.lab.maximowork.com.        IN      A      192.168.22.213

; OpenShift Internal - Load balancer
api.lab.maximowork.com.        IN    A    192.168.22.1
api-int.lab.maximowork.com.    IN    A    192.168.22.1
*.apps.lab.maximowork.com.     IN    A    192.168.22.1

; ETCD Cluster
etcd-0.lab.maximowork.com.    IN    A     192.168.22.201
etcd-1.lab.maximowork.com.    IN    A     192.168.22.202
etcd-2.lab.maximowork.com.    IN    A     192.168.22.203

; OpenShift Internal SRV records (cluster name = lab)
_etcd-server-ssl._tcp.lab.maximowork.com.    86400     IN    SRV     0    10    2380    etcd-0.lab
_etcd-server-ssl._tcp.lab.maximowork.com.    86400     IN    SRV     0    10    2380    etcd-1.lab
_etcd-server-ssl._tcp.lab.maximowork.com.    86400     IN    SRV     0    10    2380    etcd-2.lab

