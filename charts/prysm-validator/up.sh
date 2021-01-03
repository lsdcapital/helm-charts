helm upgrade -i prysm-validator . \
--set validator.beacon="prysm-beacon:4000" \
--set validator.graffiti="LSD OPEN" \
--set validator.debug.init=true \
--set validator.acceptTermsOfUse=true \
$@
