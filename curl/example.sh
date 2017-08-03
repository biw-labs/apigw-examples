set -x

APIGW_CLIENT_ID=<client_id>
APIGW_CLIENT_SECRET=<client_secret>
APIGW_BASE_URL=<https://apipprd.biworldwide.com or https://api.biworldwide.com>
RESOURCE_PATH=/<version>/<resource>/<subresource>
TOKEN_EXTENSION=/oauth2/token

TOKEN_RESPONSE=$(curl -X POST -F "client_id=$APIGW_CLIENT_ID" -F "client_secret=$APIGW_CLIENT_SECRET" -F "grant_type=client_credentials" $APIGW_BASE_URL$RESOURCE_PATH$TOKEN_EXTENSION)
ACCESS_TOKEN=$(echo $TOKEN_RESPONSE | python -c "import sys, json; print json.load(sys.stdin)['access_token']")

curl -X POST $APIGW_BASE_URL$RESOURCE_PATH?access_token=$ACCESS_TOKEN