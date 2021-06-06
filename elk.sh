helm repo add elastic https://helm.elastic.co
helm install -n learnshell elasticsearch elastic/elasticsearch --set service.type=LoadBalancer
helm install -n learnshell kibana elastic/kibana --set service.type=LoadBalancer
helm install -n learnshell metricbeat elastic/metricbeat 
helm install -n learnshell  filebeat elastic/filebeat
