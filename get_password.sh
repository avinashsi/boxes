JENKINS_USERNAME=admin	
JENKINS_PASSWORD=admin123
JENKINS_HOST=jenkins_host_ip
host=http://$JENKINS_USERNAME:$JENKINS_PASSWORD@$JENKINS_HOST:8080 CRUMB=$(curl -s "$host"'/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
encrypted_passphrase=$(curl  -H "$CRUMB" -d "script=println(hudson.util.Secret.fromString('password').getEncryptedValue())" -X POST $host/scriptText)
echo $encrypted_passphrase

