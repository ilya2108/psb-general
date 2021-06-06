helm repo add elastic https://helm.elastic.co
helm install elasticsearch elastic/elasticsearch --set service.type=LoadBalancer
helm install kibana elastic/kibana --set service.type=LoadBalancer
helm install metricbeat elastic/metricbeat 
helm install filebeat elastic/filebeat
