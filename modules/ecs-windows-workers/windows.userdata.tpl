<powershell>

Initialize-ECSAgent -Cluster ${cluster-name} -EnableTaskIAMRole -LoggingDrivers '["json-file","awslogs"]'

</powershell>