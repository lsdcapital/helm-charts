    helm upgrade -i btcpayserver . -n playpen --create-namespace \
    --set postgresql.postgresqlPassword=DA1Qb3oy1f \
    --set postgresql.postgresqlDatabase=btcpay \
    --set postgresql.postgresqlUsername=btcpay \
    $@
