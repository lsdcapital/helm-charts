    helm upgrade -i nbxplorer . -n playpen --create-namespace \
    --set rabbitmq.auth.password='test123' \
    --set rabbitmq.auth.erlangCookie='test123' \
    --set config.rpcauth='lsdopenlnd:PItVvAqMJl_OmpQc54jVIUpCMM9rLEmhoF2h4GHEH8E='
    $@
